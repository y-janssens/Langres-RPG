use serde::{Deserialize, Serialize};
use std::fmt::{Display, Formatter};
use strum_macros::{Display, EnumString};

use crate::battle::alterations::Alteration;

use super::{
    actions::Action,
    models::BattleSystem,
    objects::Object,
    rolls::Roll,
    types::{Location, Operator, Stat},
};

#[derive(Default, Clone, Copy, Debug, Serialize, Deserialize, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum LogType {
    #[default]
    State,
    Action,
    Object,
    Location,
    Alteration,
    Damage,
    Heal,
    Stand,
}

#[derive(Clone, Debug, Serialize, Deserialize, Default)]
pub struct BattleLog {
    pub r#type: LogType,
    pub initiator: Operator,
    pub action: Option<Action>,
    pub object: Option<Object>,
    pub alteration: Option<Alteration>,
    pub event: String,
    pub text: String,
    pub roll: Option<String>,
    pub value: Option<i32>,
}

impl Display for BattleLog {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        write!(f, "BattleLog {{ ")?;

        write!(f, "initiator: {:?}", self.initiator)?;

        write!(f, ", type: {:?}", self.r#type)?;

        if let Some(ref action) = self.action {
            write!(f, ", action: {:?}", action)?;
        };

        if let Some(ref object) = self.object {
            write!(f, ", object: {:?}", object)?;
        };

        if let Some(ref alteration) = self.alteration {
            write!(f, ", alteration: {:?}", alteration)?;
        };

        write!(f, ", event: {:?}", self.event)?;

        if !self.text.is_empty() {
            write!(f, ", text: {:?}", self.text)?;
        }

        if let Some(ref roll) = self.roll {
            write!(f, ", roll: {:?}", roll)?;
        };

        if let Some(ref value) = self.value {
            write!(f, ", value: {:?}", value)?;
        };
        write!(f, " }}")
    }
}

impl BattleLog {
    /// Battle state log, displays current battle status
    pub fn state_log(system: &mut BattleSystem) -> Self {
        Self {
            event: system.state.display(),
            text: system.state.flavor_text(system.result),
            ..Default::default()
        }
    }

    /// Log each new turn
    pub fn turn_log(turn: &u8) -> Self {
        Self {
            event: format!("Turn {}", turn),
            ..Default::default()
        }
    }

    /// Log both system and characters actions
    pub fn action_log(
        action: Option<&Action>,
        initiator: Operator,
        stat: &Stat,
        result: Option<&Roll>,
    ) -> Self {
        Self {
            r#type: LogType::Action,
            action: action.cloned(),
            initiator,
            event: format!("Roll {}", stat),
            roll: result.map(|r| r.value.clone()),
            value: result.map(|r| r.output),
            text: match initiator {
                Operator::System => String::new(),
                _ => format!(
                    "{:?} tries to {}",
                    initiator,
                    action.map_or(String::new(), |act| act.to_value())
                ),
            },
            ..Default::default()
        }
    }

    /// Log character objects usage
    pub fn object_log(
        object: Option<&Object>,
        initiator: Operator,
        stat: &Stat,
        result: Option<&Roll>,
    ) -> Self {
        Self {
            initiator,
            r#type: LogType::Object,
            object: object.cloned(),
            event: match object {
                Some(_) => format!("Roll {}", stat),
                None => String::new(),
            },
            roll: result.map(|r| r.value.clone()),
            value: result.map(|r| r.output),
            text: match object {
                Some(obj) => format!("{:?} {}", initiator, obj.to_value()),
                None => format!("{:?} cannot use this object", initiator),
            },
            ..Default::default()
        }
    }

    /// Displays the amount of damages taken by any opponent
    pub fn damage_log(initiator: Operator, stat: &str, value: i32) -> Self {
        Self {
            initiator,
            r#type: LogType::Damage,
            event: format!("Roll {}", stat),
            text: format!("{:?} inflicts {} damage(s)", initiator, value),
            value: Some(value),
            ..Default::default()
        }
    }

    /// Displays the amount of health recovered by any opponent
    pub fn heal_log(initiator: Operator, stat: &str, value: i32) -> Self {
        Self {
            initiator,
            r#type: LogType::Heal,
            event: format!("Roll {}", stat),
            text: format!("{:?} recovers {} hp(s)", initiator, value),
            value: Some(value),
            ..Default::default()
        }
    }

    /// Displays location results before applying damages
    pub fn location_log(initiator: Operator, location: &Location) -> Self {
        Self {
            initiator,
            r#type: LogType::Location,
            event: String::from("Roll location"),
            text: format!("{:?} aims for the {}", initiator, location),
            ..Default::default()
        }
    }

    /// Displays alterations
    pub fn alteration_log(initiator: Operator, alteration: Alteration, value: Option<i32>) -> Self {
        let text = if value.is_some() {
            alteration.to_damage_value()
        } else {
            alteration.to_value()
        };
        Self {
            initiator,
            alteration: Some(alteration),
            r#type: LogType::Alteration,
            event: String::from("Roll alteration"),
            text: format!("{:?} {}", initiator, text),
            value,
            ..Default::default()
        }
    }

    pub fn stand_log(initiator: Operator, action: Option<&Action>) -> Self {
        Self {
            initiator,
            r#type: LogType::Stand,
            action: Some(Action::Pass),
            event: String::from("Pass"),
            text: match action {
                Some(_) => format!("{:?} skips its turn", initiator),
                None => format!("{:?} cannot attack", initiator),
            },
            ..Default::default()
        }
    }
}
