use serde::{Deserialize, Serialize};

use crate::{
    battle::{
        actions::{Action, ActionInfo},
        alterations::{Alteration, AlterationInfo},
        objects::{Object, ObjectInfo},
    },
    character::models::Character,
};

#[derive(Debug, Serialize, Deserialize)]
pub struct SystemDatas {
    pub actions: Vec<ActionInfo>,         // Serialized registered actions
    pub objects: Vec<ObjectInfo>,         // Serialized registered objects
    pub alterations: Vec<AlterationInfo>, // Serialized registered alterations
}

impl SystemDatas {
    pub fn get(character: &Character) -> Self {
        Self {
            actions: Action::get_list(character),
            objects: Object::get_list(character),
            alterations: Alteration::get_list(),
        }
    }
}
