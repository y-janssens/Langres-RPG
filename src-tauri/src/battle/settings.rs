use std::env;

use diesel::{result::Error, SqliteConnection};
use serde::{Deserialize, Serialize};
use strum_macros::{Display, EnumString};

use super::rolls::Roll;
use crate::{
    application::models::ApplicationSettings,
    backend::{permissions::models::Credentials, settings::variables::BATTLE_SYSTEM_TAMPERING_ENV},
};

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
        if Credentials::is_admin() {
            let key = env::var(BATTLE_SYSTEM_TAMPERING_ENV).ok();
            if let Some(k) = key {
                return Self::try_from(k.as_str()).unwrap_or(Self::default());
            }
        }
        Self::default()
    }
}

#[derive(Default, Clone, Copy, Debug, Serialize, Deserialize, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum BattleDifficulty {
    #[default]
    Normal,
    Hard,
    Extreme,
}

impl BattleDifficulty {
    pub fn resolve(setting: usize) -> Self {
        match setting {
            0 => Self::Normal,
            1 => Self::Hard,
            2 => Self::Extreme,
            _ => Self::default(),
        }
    }

    pub fn get_value(&self) -> i32 {
        match self {
            Self::Normal => 0,
            Self::Hard => 1,
            Self::Extreme => 2,
        }
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
        match self.realtime {
            true => "Real time",
            false => "Turn based",
        }
        .into()
    }
}
