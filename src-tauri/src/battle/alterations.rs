use serde::{Deserialize, Serialize};
use strum::IntoEnumIterator;
use strum_macros::{Display, EnumIter, EnumString};

use crate::{backend::utils::models::Dice, battle::types::Operator};

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
pub struct AlterationInfo {
    name: String,
    is_ailment: bool,
}

#[derive(
    Default, Clone, Copy, Debug, Serialize, Deserialize, PartialEq, Display, EnumString, EnumIter,
)]
#[strum(serialize_all = "snake_case")]
pub enum Alteration {
    #[default]
    Clear,
    Burn,
    Bleed,
    Expose,
    Protect,
    Enlighten,
}

impl Alteration {
    pub fn get_list() -> Vec<AlterationInfo> {
        Self::iter()
            .map(|object| AlterationInfo {
                name: object.to_string(),
                is_ailment: object.is_ailment(),
            })
            .collect()
    }

    pub fn is_ailment(&self) -> bool {
        match self {
            Alteration::Burn => true,
            Alteration::Bleed => true,
            Alteration::Clear => false,
            Alteration::Expose => false,
            Alteration::Protect => false,
            Alteration::Enlighten => false,
        }
    }

    pub fn get_offensive_modifier(&self) -> i32 {
        match self {
            Alteration::Burn => 2,
            Alteration::Clear => 0,
            Alteration::Bleed => 2,
            Alteration::Expose => 2,
            Alteration::Protect => 0,
            Alteration::Enlighten => 4,
        }
    }

    pub fn get_defensive_modifier(&self) -> i32 {
        match self {
            Alteration::Burn => 0,
            Alteration::Clear => 0,
            Alteration::Bleed => 0,
            Alteration::Expose => -2,
            Alteration::Protect => 2,
            Alteration::Enlighten => 0,
        }
    }

    pub fn to_value(&self) -> String {
        match self {
            Alteration::Burn => "is burning".to_string(),
            Alteration::Bleed => "is bleeding".to_string(),
            Alteration::Expose => "lowers its guard".to_string(),
            Alteration::Protect => "braces for impact".to_string(),
            Alteration::Enlighten => "sought the light, and found it".to_string(),
            Alteration::Clear => unreachable!(),
        }
    }

    pub fn to_damage_value(&self) -> String {
        if self.is_ailment() {
            return match self {
                Alteration::Burn => "suffers from burns".to_string(),
                Alteration::Bleed => "suffers from bleeding".to_string(),
                _ => unreachable!(),
            };
        }
        String::new()
    }

    fn get_modifier(&self) -> i32 {
        if self.is_ailment() {
            return self.get_offensive_modifier();
        }
        self.get_defensive_modifier()
    }

    pub fn compute(&self) -> i32 {
        Dice::roll(6_u32) as i32 + self.get_modifier()
    }
}

#[derive(Default, Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct Alterations {
    pub character: Alteration,
    pub npc: Alteration,
}

impl Alterations {
    pub fn get(&self, current: Operator) -> Alteration {
        match current {
            Operator::Character => self.character,
            Operator::Npc => self.npc,
            Operator::System => unreachable!(),
        }
    }

    pub fn set(&mut self, current: Operator, alteration: Alteration) {
        match current {
            Operator::Character => self.character = alteration,
            Operator::Npc => self.npc = alteration,
            Operator::System => unreachable!(),
        }
    }

    pub fn consume(&mut self, current: Operator) {
        match current {
            Operator::Character => self.character = Alteration::default(),
            Operator::Npc => self.npc = Alteration::default(),
            Operator::System => unreachable!(),
        }
    }
}
