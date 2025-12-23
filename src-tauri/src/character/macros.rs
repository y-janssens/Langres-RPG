use std::io::Error;

use serde_yaml::Value;

use super::models::Inventory;
use crate::{
    backend::utils::parse::{get_numeric_value, get_sequence},
    loot::models::Loot,
};

impl Inventory {
    pub fn from_value(content: &Value) -> Result<Self, Error> {
        Ok(Self {
            right_hand: Loot::try_parse(content.get("right_hand"))?,
            left_hand: Loot::try_parse(content.get("left_hand"))?,
            head: Loot::try_parse(content.get("head"))?,
            torso: Loot::try_parse(content.get("torso"))?,
            legs: Loot::try_parse(content.get("legs"))?,
            gold: get_numeric_value(content, "gold"),
            objects: Loot::from_value(get_sequence(content, "objects")?.to_vec())?,
        })
    }
}
