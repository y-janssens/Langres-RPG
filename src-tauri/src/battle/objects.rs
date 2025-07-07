use serde::{Deserialize, Serialize};
use std::io::{Error, ErrorKind::NotFound};
use strum::IntoEnumIterator;
use strum_macros::{Display, EnumIter, EnumString};

use super::{
    actions::Action,
    logs::BattleLog,
    models::BattleSystem,
    rolls::Roll,
    types::{Location, Stat},
};
use crate::{
    backend::{settings::errors::BATTLE_SYSTEM_OBJECT_ERROR, utils::models::Dice},
    battle::{alterations::Alteration, settings::TamperMode},
    character::models::Character,
};

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
pub struct ObjectInfo {
    pub name: String,
    pub quantity: i32,
    pub disabled: bool,
}

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

    pub fn to_value(&self) -> String {
        let value = match self {
            Object::Bandage => "tries to use a bandage",
            Object::Dirt => "tries to throw dirt at it's opponent",
            Object::WaterVial => "tries to throw a sea water vial",
            Object::Torch => "tries to throw a flaming torch at it's opponent",
        };
        value.to_string()
    }

    pub fn resolve(object: &str) -> Result<Self, Error> {
        let action =
            Self::try_from(object).map_err(|_| Error::new(NotFound, BATTLE_SYSTEM_OBJECT_ERROR))?;
        Ok(action)
    }

    pub fn trigger(&self, system: &mut BattleSystem) -> Result<(), Error> {
        if self.validate_object_availability(system) {
            let object = match self {
                Self::Dirt => Self::dirt_roll,
                Self::Torch => Self::torch_roll,
                Self::Bandage => Self::bandage_roll,
                Self::WaterVial => Self::water_vial_roll,
            };
            return object(self, system, &Stat::Dexterity);
        }
        system.increment_history(BattleLog::object_log(
            None,
            system.current,
            &Stat::Dexterity,
            None,
        ));
        Ok(())
    }

    fn water_vial_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);
        if result.success {
            let roll = Dice::roll(20);
            let random = Dice::roll(3);
            let location = Location::from_value(roll);

            let damages = match location {
                Location::Head => 5,
                Location::Arms => 3,
                Location::Legs => 2,
                Location::Torso => 3,
            } + random;

            system.increment_history(BattleLog::damage_log(
                system.current,
                &stat.to_string(),
                damages as i32,
            ));

            system.npc.inflict_damages(damages as i32);
        }
        if result.failure && result.critical_failure {
            system.action(&Action::CounterAttack.to_string())?;
        }
        Ok(())
    }

    fn dirt_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);

        if result.success {
            system.action(&Action::Pass.to_string())?;
        }
        if result.failure && result.critical_failure {
            system.action(&Action::CounterAttack.to_string())?;
        }
        Ok(())
    }

    fn torch_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);

        if result.success {
            self.parse_alteration(system);
        }
        if result.failure && result.critical_failure {
            system.action(&Action::CounterAttack.to_string())?;
        }
        Ok(())
    }

    fn bandage_roll(&self, system: &mut BattleSystem, stat: &Stat) -> Result<(), Error> {
        let result = self.get_result(system, stat);

        if result.success {
            let hps = Dice::roll(10);
            system.character.restore_hps(hps as i32);
            system.increment_history(BattleLog::heal_log(
                system.current,
                &stat.to_string(),
                hps as i32,
            ));
        }
        Ok(())
    }

    fn validate_object_availability(&self, system: &mut BattleSystem) -> bool {
        let objects = system.character.inventory.get_consumables(Some(self));
        if !objects.is_empty() {
            system
                .character
                .inventory
                .remove_object(format!("obj_{}", self));
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
        system.increment_history(BattleLog::object_log(
            Some(self),
            system.current,
            stat,
            Some(&result),
        ));
        result
    }

    fn get_alteration(&self) -> Alteration {
        match self {
            Object::Torch => Alteration::Burn,
            _ => unreachable!(),
        }
    }

    fn parse_alteration(&self, system: &mut BattleSystem) {
        let alteration = self.get_alteration();
        let opponent = system.current.get_opponent();
        system.alterations.set(opponent, alteration);
        system.increment_history(BattleLog::alteration_log(opponent, alteration, None));
    }
}
