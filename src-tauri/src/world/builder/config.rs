use serde::{Deserialize, Serialize};
use std::collections::HashMap;

use super::constraints::Constraints;
use crate::world::settings::{GRASS, WATER};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Conf {
    pub name: String,
    pub primary_value: String,
    pub values: HashMap<String, u32>,
    pub post_process: bool,
}

impl Conf {
    /// Get config from entrypoint map's kind
    pub fn get_config(name: &str) -> Self {
        match name {
            "forest" => Self::get_forest_config(),
            "swamp" => Self::get_swamp_config(),
            "town" => Self::get_town_config(),
            _ => Self::get_forest_config(),
        }
    }
    // Configs definitions
    // Soil - Trees - Water- Shore - Borders - Roads(0) - Fences(0) - Ground(0)
    fn get_forest_config() -> Self {
        Self {
            name: "forest".to_string(),
            primary_value: GRASS.value(),
            values: Constraints::get_tiles(50, 13, 13, 5, 5),
            post_process: true,
        }
    }

    fn get_swamp_config() -> Self {
        Self {
            name: "swamp".to_string(),
            primary_value: WATER.value(),
            values: Constraints::get_tiles(30, 8, 30, 30, 5),
            post_process: false,
        }
    }

    fn get_town_config() -> Self {
        Self {
            name: "town".to_string(),
            primary_value: GRASS.value(),
            values: Constraints::get_tiles(50, 18, 13, 5, 5),
            post_process: true,
        }
    }
}
