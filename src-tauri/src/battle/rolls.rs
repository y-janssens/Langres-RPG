use rand::*;
use serde::{Deserialize, Serialize};
use strum_macros::{Display, EnumString};

use crate::character::models::Inventory;

use super::{
    models::BattleSystem,
    types::{Operator, Stat},
};

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum Location {
    Head,
    Arms,
    Legs,
    Torso,
}

impl Location {
    pub fn get_damages(&self) -> u32 {
        match self {
            Self::Head => 5,
            Self::Arms => 3,
            Self::Legs => 2,
            Self::Torso => 3,
        }
    }

    pub fn from_value(value: u32) -> Self {
        match value {
            val if (1..=2).contains(&val) => Self::Head,
            val if (3..=7).contains(&val) => Self::Arms,
            val if (8..=11).contains(&val) => Self::Legs,
            val if (12..=20).contains(&val) => Self::Torso,
            _ => Self::Torso,
        }
    }

    pub fn resolve_parade_reducers(self, inventory: Inventory) -> i32 {
        match self {
            Self::Head => inventory.head.and_then(|head| head.parade).unwrap_or(0),
            Self::Arms => inventory.torso.and_then(|torso| torso.parade).unwrap_or(0),
            Self::Legs => inventory.legs.and_then(|legs| legs.parade).unwrap_or(0),
            Self::Torso => inventory.torso.and_then(|torso| torso.parade).unwrap_or(0),
        }
    }
}

#[derive(Clone, Copy, Debug, Serialize, Deserialize, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum RollOutput {
    Success,
    Failure,
    CriticalSuccess,
    CriticalFailure,
}

impl RollOutput {
    pub fn get(current_roll: i32, cap: i32) -> String {
        match current_roll {
            1 => Self::CriticalSuccess,
            20 => Self::CriticalFailure,
            val if val <= cap => Self::Success,
            _ => Self::Failure,
        }
        .to_string()
    }

    pub fn default_value(&self) -> i32 {
        match self {
            RollOutput::Success => 8,
            RollOutput::Failure => 16,
            RollOutput::CriticalSuccess => 1,
            RollOutput::CriticalFailure => 20,
        }
    }
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Roll {
    pub output: i32,
    pub success: bool,
    pub failure: bool,
    pub value: String,
    pub critical_success: bool,
    pub critical_failure: bool,
}

impl Default for Roll {
    fn default() -> Self {
        Self {
            output: 10,
            success: false,
            failure: false,
            value: String::new(),
            critical_success: false,
            critical_failure: false,
        }
    }
}

impl Roll {
    pub fn parse(stat: i32, roll: i32) -> Self {
        Self {
            output: roll,
            failure: roll > stat,
            success: roll <= stat,
            critical_success: roll == 1,
            critical_failure: roll == 20,
            value: RollOutput::get(roll, stat),
        }
    }

    pub fn launch(stat: &Stat, system: &mut BattleSystem) -> Self {
        let mut rng = rand::thread_rng();
        let stats = stat.get_stats(&system.character, &system.npc);
        let cap = match system.current_operator {
            Operator::Npc => stats.1,
            _ => stats.0,
        } - system.settings.difficulty.get_value();

        Self::parse(cap, rng.gen_range(1..=20))
    }

    pub fn success() -> Self {
        let output = RollOutput::Success;
        Self {
            success: true,
            value: output.to_string(),
            output: output.default_value(),
            ..Default::default()
        }
    }

    pub fn critical_success() -> Self {
        let output = RollOutput::CriticalSuccess;
        Self {
            success: true,
            critical_success: true,
            value: output.to_string(),
            output: output.default_value(),
            ..Default::default()
        }
    }

    pub fn failure() -> Self {
        let output = RollOutput::Failure;
        Self {
            failure: true,
            value: output.to_string(),
            output: output.default_value(),
            ..Default::default()
        }
    }

    pub fn critical_failure() -> Self {
        let output = RollOutput::CriticalFailure;
        Self {
            failure: true,
            critical_failure: true,
            value: output.to_string(),
            output: output.default_value(),
            ..Default::default()
        }
    }
}
