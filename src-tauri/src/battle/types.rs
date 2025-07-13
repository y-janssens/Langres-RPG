use serde::{Deserialize, Serialize};
use std::io::{
    Error,
    ErrorKind::{PermissionDenied, Unsupported},
};
use strum_macros::{Display, EnumString};

use crate::{
    backend::settings::errors::{
        BATTLE_SYSTEM_ENDED_ERROR, BATTLE_SYSTEM_PENDING_ERROR, BATTLE_SYSTEM_TRANSITION_ERROR,
    },
    battle::models::BattleSystem,
    character::models::Character,
    npcs::models::{Class, Npc},
};

#[derive(Default, Clone, Copy, Debug, Serialize, Deserialize, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum Operator {
    #[default]
    System,
    Character,
    Npc,
}

impl Operator {
    pub fn get_opponent(self) -> Self {
        match self {
            Self::Character => Self::Npc,
            Self::Npc => Self::Character,
            Self::System => Self::Character,
        }
    }

    pub fn switch_operator(&mut self) {
        *self = self.get_opponent();
    }

    pub fn reset(system: &mut BattleSystem) {
        system.current_operator = Self::Character;
    }

    pub fn get_class(&self, system: &mut BattleSystem) -> Class {
        match self {
            Operator::Character => system.character.class.clone(),
            Operator::Npc => system.npc.class.clone(),
            _ => unreachable!(),
        }
    }
}

#[derive(Default, Clone, Debug, Serialize, Deserialize, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum BattleState {
    #[default]
    Pending,
    Ongoing,
    Ended,
}

impl BattleState {
    pub fn display(&self) -> String {
        match self {
            BattleState::Ended => "Battle over",
            BattleState::Pending => "Battle initiated",
            BattleState::Ongoing => "Battle started",
        }
        .into()
    }

    pub fn transition(&mut self) -> Result<(), Error> {
        match self {
            Self::Pending => *self = Self::Ongoing,
            Self::Ongoing => *self = Self::Ended,
            _ => return Err(Error::new(Unsupported, BATTLE_SYSTEM_TRANSITION_ERROR)),
        };
        Ok(())
    }

    pub fn validate(&self) -> Result<(), Error> {
        match self {
            Self::Pending => Err(Error::new(PermissionDenied, BATTLE_SYSTEM_PENDING_ERROR)),
            Self::Ended => Err(Error::new(PermissionDenied, BATTLE_SYSTEM_ENDED_ERROR)),
            Self::Ongoing => Ok(()),
        }
    }

    pub fn is_valid(&self) -> bool {
        matches!(self, Self::Ongoing)
    }

    pub fn flavor_text(&self, result: Option<Operator>) -> String {
        match self {
            Self::Ended => format!("{:?} wins", result.unwrap_or_default()),
            _ => String::new(),
        }
    }
}

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum Stat {
    Endurance,
    Strength,
    Dexterity,
    Charisma,
    Intelligence,
    Initiative,
    Attack,
    Parry,
    Marksmanship,
    Actions,
    Health,
}

impl Stat {
    pub fn get_stats(&self, character: &Character, npc: &Npc) -> (i32, i32) {
        match self {
            Self::Endurance => (character.end, npc.end),
            Self::Strength => (character.r#for, npc.r#for),
            Self::Dexterity => (character.hab, npc.hab),
            Self::Charisma => (character.cha, npc.cha),
            Self::Intelligence => (character.int, npc.int),
            Self::Initiative => (character.ini, npc.ini),
            Self::Attack => (character.att, npc.att),
            Self::Parry => (character.par, npc.par),
            Self::Marksmanship => (character.tir, npc.tir),
            Self::Actions => (character.ap, npc.ap),
            Self::Health => (character.pv, npc.pv),
        }
    }

    pub fn to_value(&self) -> String {
        match self {
            Stat::Endurance => "",
            Stat::Strength => "",
            Stat::Dexterity => "dodge",
            Stat::Charisma => "",
            Stat::Intelligence => "",
            Stat::Initiative => "flee",
            Stat::Attack => "strike",
            Stat::Parry => "parry",
            Stat::Marksmanship => "shoot",
            Stat::Actions => "",
            Stat::Health => "",
        }
        .into()
    }
}
