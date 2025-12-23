use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub enum EventStatus {
    None,
    Pending,
    Done,
    Failed,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub enum EventMode {
    Start,
    End,
    Automatic,
    Action,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub enum EventType {
    None,
    Quest(String),
    GateWay(i32, bool),
    CheckPoint(i32),
    Combat(String),
    CutScene(String),
    Dialog(String),
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct Event {
    pub id: String,
    pub r#type: EventType,
    pub mode: EventMode,
    pub status: EventStatus,
    pub destination: EventType,
}

#[allow(dead_code)]
impl Event {
    fn get_base_event(args: (EventType, EventMode, EventStatus, EventType)) -> Event {
        Self {
            id: Uuid::new_v4().to_string(),
            r#type: args.0,
            mode: args.1,
            status: args.2,
            destination: args.3,
        }
    }

    pub fn get_checkpoint(tile_id: i32) -> Event {
        Self::get_base_event((
            EventType::CheckPoint(tile_id),
            EventMode::Automatic,
            EventStatus::None,
            EventType::None,
        ))
    }

    pub fn get_gateway(map_id: i32, is_final: bool) -> Event {
        Self::get_base_event((
            EventType::GateWay(map_id, is_final),
            EventMode::Automatic,
            EventStatus::None,
            EventType::None,
        ))
    }

    pub fn start_quest(quest_id: String) -> Event {
        Self::get_base_event((EventType::Quest(quest_id), EventMode::Start, EventStatus::Pending, EventType::None))
    }

    pub fn end_quest(quest_id: String) -> Event {
        Self::get_base_event((EventType::Quest(quest_id), EventMode::End, EventStatus::Done, EventType::None))
    }

    pub fn start_dialog(npc_id: String) -> Event {
        Self::get_base_event((EventType::Dialog(npc_id), EventMode::Start, EventStatus::Pending, EventType::None))
    }

    pub fn start_combat(npc_id: String) -> Event {
        Self::get_base_event((EventType::Combat(npc_id), EventMode::Start, EventStatus::Pending, EventType::None))
    }

    pub fn get_cutscene(cutscene_id: String) -> Event {
        Self::get_base_event((
            EventType::CutScene(cutscene_id),
            EventMode::Start,
            EventStatus::Pending,
            EventType::None,
        ))
    }
}
