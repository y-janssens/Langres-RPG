use std::ops::Deref;

use serde::{Deserialize, Serialize};

use super::settings::VALUES;

#[derive(Debug, Default, Clone, PartialEq, Deserialize, Serialize)]
pub struct Values {
    pub value: String,
    pub display_value: String,
    pub side_value: Option<String>,
    pub walkable: bool,
    pub display_color: String,
    pub supports_density: bool,
}

impl Deref for Values {
    type Target = str;

    fn deref(&self) -> &Self::Target {
        &self.value
    }
}

impl Values {
    pub fn store(value: &str, display_value: &str, side_value: Option<&str>, display_color: &str, walkable: bool, density: bool) -> Self {
        Self {
            walkable,
            value: value.to_string(),
            side_value: side_value.map(|v| v.to_string()),
            display_value: display_value.to_string(),
            display_color: display_color.to_string(),
            supports_density: density,
        }
    }

    pub fn value(&self) -> String {
        self.to_string()
    }

    pub fn val(&self) -> &str {
        self.as_ref()
    }

    pub fn get(value: &str) -> Option<Self> {
        VALUES.clone().into_iter().find(|v| v.value == value)
    }

    pub fn get_value(value: &str) -> (String, String, bool) {
        let value = VALUES.clone().into_iter().find(|v| v.value == value).unwrap();
        (value.display_value, value.display_color, value.walkable)
    }

    /// Get all possible tiles list with only values
    pub fn get_tiles_values() -> Vec<String> {
        VALUES.iter().map(|tile| tile.value.to_string()).collect()
    }
}
