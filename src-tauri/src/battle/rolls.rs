use rand::*;
use serde::{Deserialize, Serialize};
use strum_macros::{Display, EnumString};

use super::{
    models::BattleSystem,
    types::{Operator, Stat},
};

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
        let value = match current_roll {
            1 => Self::CriticalSuccess,
            20 => Self::CriticalFailure,
            val if val <= cap => Self::Success,
            _ => Self::Failure,
        };
        value.to_string()
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
        let cap = match system.current {
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
