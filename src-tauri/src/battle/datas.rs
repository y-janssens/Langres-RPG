use serde::{Deserialize, Serialize};

use crate::{
    battle::{actions::Action, alterations::Alteration, objects::Object},
    character::models::Character,
};

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
pub struct AlterationInfo {
    pub name: String,
    pub is_ailment: bool,
}

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
pub struct ActionInfo {
    pub cost: i32,
    pub name: String,
    pub primary: bool,
    pub disabled: bool,
    pub defensive: bool,
}

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
pub struct ObjectInfo {
    pub name: String,
    pub quantity: i32,
    pub disabled: bool,
}

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
