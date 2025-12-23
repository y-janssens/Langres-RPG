use serde::{Deserialize, Serialize};
use std::io::{Error, ErrorKind::NotFound};
use strum::IntoEnumIterator;
use strum_macros::{Display, EnumIter, EnumString};

use super::{
    actions::Action,
    logs::BattleLog,
    models::BattleSystem,
    rolls::{Location, Roll},
    types::Stat,
};
use crate::{
    backend::{settings::errors::BATTLE_SYSTEM_OBJECT_ERROR, utils::models::Dice},
    battle::{alterations::Alteration, datas::ObjectInfo, settings::TamperMode},
    character::models::Character,
};

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Display, EnumString, EnumIter)]
#[strum(serialize_all = "snake_case")]
pub enum Object {
    Dirt,
    Torch,
    Bandage,
    WaterVial,
}

impl Object {
    pub fn get_list(character: &Character) -> Vec<ObjectInfo> {
        Self::iter()
            .map(|object| {
                let objects = character.inventory.get_consumables(Some(&object));
                ObjectInfo {
                    name: object.to_string(),
                    quantity: objects.len() as i32,
                    disabled: objects.is_empty(),
                }
            })
            .collect()
    }

    fn get_alteration(&self) -> Alteration {
        match self {
            Object::Torch => Alteration::Burn,
            _ => unreachable!(),
        }
    }

    pub fn to_value(&self) -> String {
        match self {
            Self::Bandage => "tries to use a bandage",
            Self::Dirt => "tries to throw dirt at it's opponent",
            Self::WaterVial => "tries to throw a sea water vial",
            Self::Torch => "tries to throw a flaming torch at it's opponent",
        }
        .into()
    }

    fn get_object_roll(&self) -> fn(&Object, &mut BattleSystem, &Stat) -> Result<(), Error> {
        match self {
            Self::Dirt => Self::dirt_roll,
            Self::Torch => Self::torch_roll,
            Self::Bandage => Self::bandage_roll,
            Self::WaterVial => Self::water_vial_roll,
        }
    }

    pub fn resolve(object_str: &str) -> Result<Self, Error> {
        let object = Self::try_from(object_str).map_err(|_| Error::new(NotFound, BATTLE_SYSTEM_OBJECT_ERROR))?;
        Ok(object)
    }

    pub fn trigger(&self, system: &mut BattleSystem) -> Result<(), Error> {
        let stat = Stat::Dexterity;

        if self.validate_object_availability(system) {
            let object_roll = self.get_object_roll();
            return object_roll(self, system, &stat);
        }

        system.increment_history(BattleLog::object_unavailability_log(self, system.current_operator));
        Ok(())
    }

    fn water_vial_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);
        if result.success {
            let roll = Dice::roll(20);
            let random = Dice::roll(3);
            let location = Location::from_value(roll);
            let damages = location.get_damages() + random;

            system.increment_history(BattleLog::damage_log(system.current_operator, &stat.to_string(), damages as i32));

            system.npc.inflict_damages(damages as i32);
        }
        if result.failure && result.critical_failure {
            system.trigger_opponent_action(&Action::CounterAttack.to_string())?;
        }
        Ok(())
    }

    fn dirt_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);

        if result.success {
            system.trigger_opponent_action(&Action::Pass.to_string())?;
        }
        if result.failure && result.critical_failure {
            system.trigger_opponent_action(&Action::CounterAttack.to_string())?;
        }
        Ok(())
    }

    fn torch_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);

        if result.success {
            self.parse_alteration(system);
        }
        if result.failure && result.critical_failure {
            system.trigger_opponent_action(&Action::CounterAttack.to_string())?;
        }
        Ok(())
    }

    fn bandage_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);

        if result.success {
            let hps = Dice::roll(10);
            system.character.restore_hps(hps as i32);
            system.increment_history(BattleLog::heal_log(system.current_operator, &stat.to_string(), hps as i32));
        }
        Ok(())
    }

    fn validate_object_availability(&self, system: &mut BattleSystem) -> bool {
        let objects = system.character.inventory.get_consumables(Some(self));
        if !objects.is_empty() {
            system.character.inventory.remove_object(format!("obj_{}", self));
            return true;
        }
        false
    }

    fn get_result(&self, system: &mut BattleSystem, stat: &Stat) -> Roll {
        let tamper = &system.settings.tampering;
        let result = match tamper {
            TamperMode::NoTamper => Roll::launch(stat, system),
            _ => tamper.get_result(),
        };
        system.increment_history(BattleLog::object_log(Some(self), system.current_operator, stat, Some(&result)));
        result
    }

    fn parse_alteration(&self, system: &mut BattleSystem) {
        let alteration = self.get_alteration();
        let opponent = system.current_operator.get_opponent();
        system.alterations.set(opponent, alteration);
        system.increment_history(BattleLog::alteration_log(opponent, alteration, None));
    }
}
