use serde::{Deserialize, Serialize};
use std::ops::Deref;

use super::{
    constraints::Constraints,
    settings::{GRASS, VALUES, WATER},
};

#[derive(Clone)]
pub struct Values {
    pub value: String,
    pub display_value: String,
    pub walkable: bool,
    pub display_color: String,
}

impl Deref for Values {
    type Target = str;

    fn deref(&self) -> &Self::Target {
        &self.value
    }
}

impl Values {
    pub fn store(value: &str, display_value: &str, walkable: bool, display_color: &str) -> Self {
        Self {
            walkable,
            value: value.to_string(),
            display_value: display_value.to_string(),
            display_color: display_color.to_string(),
        }
    }

    pub fn value(&self) -> String {
        self.to_string()
    }

    pub fn val(&self) -> &str {
        self.as_ref()
    }

    pub fn get_value(value: &str) -> (String, String, bool) {
        let value = VALUES
            .clone()
            .into_iter()
            .find(|v| v.value == value)
            .unwrap();
        (value.display_value, value.display_color, value.walkable)
    }

    /// Get all possible tiles list with only values
    pub fn get_tiles_values() -> Vec<String> {
        VALUES.iter().map(|tile| tile.value.to_string()).collect()
    }
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Conf {
    pub name: String,
    pub primary_value: String,
    pub values: Vec<(String, u32)>,
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
            values: Constraints::get_tiles(50, 18, 13, 5, 5),
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

    /// Get and compute all available values for a given map type
    pub fn get_values(conf: &Conf) -> Vec<String> {
        conf.values
            .iter()
            .flat_map(|(value, count)| std::iter::repeat(value).take(*count as usize))
            .map(|s| s.to_string())
            .collect()
    }
}
