use serde::{Deserialize, Serialize};

use crate::battle::{
    actions::{Action, ActionInfo},
    alterations::{Alteration, AlterationInfo},
    objects::{Object, ObjectInfo},
};

#[derive(Debug, Serialize, Deserialize)]
pub struct SystemDatas {
    pub actions: Vec<ActionInfo>,         // Serialized registered actions
    pub objects: Vec<ObjectInfo>,         // Serialized registered objects
    pub alterations: Vec<AlterationInfo>, // Serialized registered alterations
}

impl SystemDatas {
    pub fn get() -> Self {
        Self {
            actions: Action::get_list(),
            objects: Object::get_list(),
            alterations: Alteration::get_list(),
        }
    }
}
