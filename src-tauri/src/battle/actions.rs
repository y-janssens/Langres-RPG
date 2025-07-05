use serde::{Deserialize, Serialize};
use std::io::{Error, ErrorKind::NotFound};
use strum::IntoEnumIterator;
use strum_macros::{Display, EnumIter, EnumString};

use super::{
    logs::BattleLog,
    models::BattleSystem,
    rolls::Roll,
    types::{Location, Operator, Stat},
};
use crate::{
    backend::{settings::errors::BATTLE_SYSTEM_ACTION_ERROR, utils::models::Dice},
    battle::{alterations::Alteration, settings::TamperMode},
    character::models::Character,
};

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
pub struct ActionInfo {
    pub cost: i32,
    pub name: String,
    pub primary: bool,
    pub disabled: bool,
    pub defensive: bool,
}

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Display, EnumString, EnumIter)]
#[strum(serialize_all = "snake_case")]
pub enum Action {
    Pray,
    Init,
    Flee,
    Pass,
    Parry,
    Dodge,
    Shoot,
    Attack,
    Expose,
    Protect,
    CounterAttack,
}

impl Action {
    pub fn get_list(character: &Character) -> Vec<ActionInfo> {
        Self::iter()
            .map(|action| ActionInfo {
                cost: action.cost(),
                name: action.to_string(),
                primary: action.is_primary(),
                defensive: action.is_defensive(),
                disabled: character.ap < action.cost(),
            })
            .collect()
    }

    fn get_stat(&self) -> Stat {
        match self {
            Self::Parry => Stat::Parry,
            Self::Attack => Stat::Attack,
            Self::Dodge => Stat::Dexterity,
            Self::Init => Stat::Initiative,
            Self::Flee => Stat::Initiative,
            Self::Pass => Stat::Initiative,
            Self::Expose => Stat::Endurance,
            Self::Protect => Stat::Endurance,
            Self::Pray => Stat::Intelligence,
            Self::Shoot => Stat::Marksmanship,
            Self::CounterAttack => Stat::Attack,
        }
    }

    fn cost(&self) -> i32 {
        match self {
            Self::Init => 0,
            Self::Pray => 1,
            Self::Flee => 0,
            Self::Pass => 0,
            Self::Shoot => 1,
            Self::Parry => 1,
            Self::Dodge => 2,
            Self::Attack => 2,
            Self::Expose => 0,
            Self::Protect => 0,
            Self::CounterAttack => 0,
        }
    }

    pub fn is_primary(&self) -> bool {
        match self {
            Self::Dodge => false,
            Self::Parry => false,
            Self::Init => false,
            Self::Pray => true,
            Self::Flee => false,
            Self::Pass => true,
            Self::Shoot => false,
            Self::Attack => false,
            Self::Expose => true,
            Self::Protect => true,
            Self::CounterAttack => false,
        }
    }

    pub fn is_defensive(&self) -> bool {
        match self {
            Self::Dodge => true,
            Self::Parry => true,
            Self::Init => false,
            Self::Pray => false,
            Self::Flee => false,
            Self::Pass => false,
            Self::Shoot => false,
            Self::Attack => false,
            Self::Expose => false,
            Self::Protect => false,
            Self::CounterAttack => true,
        }
    }

    pub fn get_action(&self) -> fn(&Action, &mut BattleSystem, &Stat) -> Result<(), Error> {
        match self {
            Self::Pray => Self::pray_roll,
            Self::Flee => Self::flee_roll,
            Self::Pass => Self::stand_roll,
            Self::Parry => Self::parry_roll,
            Self::Dodge => Self::dodge_roll,
            Self::Shoot => Self::shoot_roll,
            Self::Attack => Self::attack_roll,
            Self::Protect => Self::protect_roll,
            Self::Expose => Self::expose_roll,
            Self::Init => Self::initiative_roll,
            Self::CounterAttack => Self::counter_attack_roll,
        }
    }

    pub fn get_alteration(&self) -> Alteration {
        match self {
            Self::Pray => Alteration::Enlighten,
            Self::Expose => Alteration::Expose,
            Self::Protect => Alteration::Protect,
            Self::Attack => Alteration::Bleed,
            _ => unreachable!(),
        }
    }

    fn parse_alteration(&self, current: Operator, system: &mut BattleSystem) {
        let alteration = self.get_alteration();
        system.alterations.set(current, alteration);
        system.increment_history(BattleLog::alteration_log(current, alteration, None));
    }

    fn process_damages_over_time(&self, system: &mut BattleSystem) {
        let current = system.current;
        if current != Operator::default() {
            let alteration = system.alterations.get(current);

            if alteration.is_ailment() {
                let damages = alteration.compute();
                system.increment_history(BattleLog::alteration_log(
                    system.current,
                    alteration,
                    Some(damages),
                ));
                system.alterations.consume(current);
                self.inflict_damages(current.get_opponent(), system, damages);
            }
        }
    }

    pub fn to_value(&self) -> String {
        let value = match self {
            Action::Pray => "seek the light",
            Action::Init => "",
            Action::Flee => "flee",
            Action::Pass => "",
            Action::Parry => "parry",
            Action::Dodge => "dodge",
            Action::Shoot => "shoot",
            Action::Attack => "attack",
            Action::Expose => "expose itself",
            Action::Protect => "protect itself",
            Action::CounterAttack => "attack",
        };
        value.to_string()
    }

    pub fn resolve(action: &str) -> Result<Self, Error> {
        let action =
            Self::try_from(action).map_err(|_| Error::new(NotFound, BATTLE_SYSTEM_ACTION_ERROR))?;
        Ok(action)
    }

    pub fn trigger(&self, system: &mut BattleSystem) -> Result<(), Error> {
        let stat = &self.get_stat();
        self.process_damages_over_time(system);

        if self.validate_action_potential(system.current, system) {
            let action = self.get_action();
            return action(self, system, stat);
        }
        system.increment_history(BattleLog::stand_log(system.current, None));
        Ok(())
    }

    fn initiative_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);
        if result.failure || result.critical_failure {
            Operator::reset(system);
            system.action(&Self::Attack.to_string())?;
        };
        Ok(())
    }

    fn stand_roll(&self, system: &mut BattleSystem, _stat: &Stat) -> Result<(), Error> {
        system.increment_history(BattleLog::stand_log(system.current, Some(self)));
        Ok(())
    }

    fn flee_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);

        if result.success {
            system.end()?;
        }
        Ok(())
    }

    fn pray_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);
        if result.success {
            self.parse_alteration(system.current, system);
        }
        Ok(())
    }

    fn protect_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let _ = self.get_result(system, stat);
        self.parse_alteration(system.current, system);
        Ok(())
    }

    fn expose_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let _ = self.get_result(system, stat);
        self.parse_alteration(system.current, system);
        Ok(())
    }

    fn attack_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);
        if result.success {
            if result.critical_success {
                self.parse_alteration(system.current.get_opponent(), system);
                return self.resolve_damages(system, stat, false);
            }
            return self.defensive_roll(system, stat);
        }

        if result.failure && result.critical_failure {
            system.action(&Self::CounterAttack.to_string())?;
        }
        Ok(())
    }

    fn counter_attack_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);
        if result.success {
            self.resolve_damages(system, stat, false)?
        }
        Ok(())
    }

    fn parry_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);
        if result.success {
            self.resolve_damages(system, stat, true)?;
        }

        if result.failure {
            self.resolve_damages(system, stat, false)?
        }
        Ok(())
    }

    fn dodge_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);

        if result.failure {
            self.resolve_damages(system, stat, false)?
        }
        Ok(())
    }

    fn shoot_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);
        if result.success {
            self.resolve_damages(system, stat, false)?;
        }

        if result.failure && result.critical_failure {
            system.action(&Self::CounterAttack.to_string())?;
        }
        Ok(())
    }

    fn defensive_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let opponent = system.current.get_opponent();
        let opponent_class = opponent.get_class(system);

        if opponent_class.can_dodge() {
            let action = Self::Dodge;
            if self.validate_action_potential(opponent, system) {
                return system.action(&action.to_string());
            }
        }

        if opponent_class.can_parry() {
            let action = Self::Parry;
            if self.validate_action_potential(opponent, system) {
                return system.action(&action.to_string());
            }
        }

        self.resolve_damages(system, stat, false)
    }

    fn resolve_damages(
        &self,
        system: &mut BattleSystem,
        stat: &Stat,
        parry: bool,
    ) -> Result<(), Error> {
        let damages = self.compute_base_damages(system);
        let reducer = self.compute_damages_reduction(system, parry);
        let result = (damages - reducer).max(0);
        let current = self.get_current(system);

        system.alterations.consume(current);
        system.increment_history(BattleLog::damage_log(current, &stat.to_string(), result));
        self.inflict_damages(current, system, result);

        Ok(())
    }

    fn compute_base_damages(&self, system: &mut BattleSystem) -> i32 {
        let current = self.get_current(system);
        let alteration = system.alterations.get(current);

        match current {
            Operator::Character => {
                let mut dmg = system.character.r#for + alteration.get_offensive_modifier();

                let right_hand = &system.character.inventory.right_hand;
                dmg += right_hand
                    .clone()
                    .map(|weapon| weapon.resolve_damages())
                    .unwrap_or(0);

                dmg - system.npc.end
            }
            Operator::Npc => {
                let mut dmg = system.npc.r#for + alteration.get_offensive_modifier();
                let right_hand = &system.npc.inventory.right_hand;
                dmg += right_hand
                    .clone()
                    .map(|weapon| weapon.resolve_damages())
                    .unwrap_or(0);
                dmg - system.character.end
            }
            Operator::System => unreachable!(),
        }
    }

    fn compute_damages_reduction(&self, system: &mut BattleSystem, parry: bool) -> i32 {
        let adversary = system.current.get_opponent();
        let location = self.resolve_strike_location(system);
        let alteration = system.alterations.get(system.current);

        let adversary_inventory = match adversary {
            Operator::Character => system.character.inventory.clone(),
            Operator::Npc => system.npc.inventory.clone(),
            Operator::System => unreachable!(),
        };

        let mut reduce = location.resolve_parade_reducers(adversary_inventory.clone())
            + alteration.get_defensive_modifier();

        if parry {
            let right_hand = adversary_inventory.right_hand;
            let left_hand = adversary_inventory.left_hand;
            if let Some(shield) = left_hand {
                reduce += shield.parade.unwrap_or(0);
            } else {
                reduce += right_hand.and_then(|loot| loot.parade).unwrap_or(0);
            }
        }

        reduce / 2
    }

    fn resolve_strike_location(&self, system: &mut BattleSystem) -> Location {
        let roll = Dice::roll(20);
        let location = Location::from_value(roll);
        let current = self.get_current(system);

        system.increment_history(BattleLog::location_log(current, &location));
        location
    }

    fn validate_action_potential(&self, current: Operator, system: &mut BattleSystem) -> bool {
        let cost = self.cost();
        match current {
            Operator::Character => system.character.validate_and_compute_ap(cost),
            Operator::Npc => system.npc.validate_and_compute_ap(cost),
            Operator::System => true,
        }
    }

    fn inflict_damages(&self, current: Operator, system: &mut BattleSystem, damages: i32) {
        match current {
            Operator::Character => system.npc.inflict_damages(damages),
            Operator::Npc => system.character.inflict_damages(damages),
            Operator::System => unreachable!(),
        }
    }

    fn get_result(&self, system: &mut BattleSystem, stat: &Stat) -> Roll {
        let tamper = &system.settings.tampering;
        let result = match tamper {
            TamperMode::NoTamper => Roll::launch(stat, system),
            _ => tamper.get_result(),
        };
        system.increment_history(BattleLog::action_log(
            Some(self),
            system.current,
            stat,
            Some(&result),
        ));
        result
    }

    fn get_current(&self, system: &mut BattleSystem) -> Operator {
        if self.is_defensive() {
            system.current.get_opponent()
        } else {
            system.current
        }
    }
}
