use std::env;

use diesel::{result::Error, SqliteConnection};
use serde::{Deserialize, Serialize};
use strum_macros::{Display, EnumString};

use super::rolls::Roll;
use super::types::BattleDifficulty;
use crate::{application::models::ApplicationSettings, backend::permissions::models::Credentials};

#[derive(Default, Clone, Debug, Serialize, Deserialize, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum TamperMode {
    #[default]
    NoTamper,
    Success,
    CriticalSuccess,
    Failure,
    CriticalFailure,
}

impl TamperMode {
    pub fn get_result(&self) -> Roll {
        match self {
            TamperMode::Success => Roll::success(),
            TamperMode::CriticalSuccess => Roll::critical_success(),
            TamperMode::Failure => Roll::failure(),
            TamperMode::CriticalFailure => Roll::critical_failure(),
            _ => unreachable!(),
        }
    }

    pub fn resolve() -> Self {
        let is_admin = Credentials::is_admin();
        if is_admin {
            let key = env::var("TAMPERING_MODE").ok();
            if let Some(k) = key {
                return match k.as_str() {
                    "success" => Self::Success,
                    "failure" => Self::Failure,
                    "critical_success" => Self::CriticalSuccess,
                    "critical_failure" => Self::CriticalFailure,
                    _ => Self::default(),
                };
            }
        }
        Self::default()
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Settings {
    pub debug: bool,                  // Admin only battle outputs
    pub realtime: bool,               // Real time or turn by turn battle
    pub automatic: bool,              // Automatic battle setting
    pub difficulty: BattleDifficulty, // Battle system difficulty setting
    pub tampering: TamperMode,        // Test and debug roll tampering mode
}

impl Settings {
    pub fn initialize(connection: &mut SqliteConnection) -> Result<Self, Error> {
        let application_datas = ApplicationSettings::load(connection)?;
        Ok(Self {
            debug: Credentials::is_admin(),
            realtime: application_datas.battle_realtime,
            automatic: application_datas.battle_automatic,
            difficulty: BattleDifficulty::resolve(application_datas.difficulty as usize),
            tampering: TamperMode::resolve(),
        })
    }

    pub fn mode(&self) -> String {
        let mode = match self.realtime {
            true => "Real time",
            false => "Turn based",
        };
        mode.to_string()
    }
}
