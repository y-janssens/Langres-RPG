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
    character::models::{Character, Inventory},
    npcs::models::{Class, Npc},
};

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
        system.current = Self::Character;
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
            BattleState::Ended => "Battle over".to_string(),
            BattleState::Pending => "Battle initiated".to_string(),
            BattleState::Ongoing => "Battle started".to_string(),
        }
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
        match self {
            BattleState::Pending => false,
            BattleState::Ongoing => true,
            BattleState::Ended => false,
        }
    }

    pub fn flavor_text(&self, result: Option<Operator>) -> String {
        match self {
            BattleState::Ended => format!("{:?} wins", result.unwrap_or_default()),
            BattleState::Pending => String::new(),
            BattleState::Ongoing => String::new(),
        }
    }
}

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum Location {
    Head,
    Arms,
    Legs,
    Torso,
}

impl Location {
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
        let value = match self {
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
        };
        value.to_string()
    }
}
