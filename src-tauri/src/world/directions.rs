use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::ops::Deref;
use strum_macros::{Display, EnumString};

use super::models::Item;
use crate::maps::settings::{
    DEFAULT_MAP_SIZE_GRID, DIRECTIONAL_KEYS, DIRECTIONAL_MATCHES, DIRECTIONAL_PRIORITY,
};

use models_registry::Model;

#[derive(Debug, Serialize, Deserialize, Clone, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum Direction {
    Top,
    Left,
    Right,
    Bottom,
    TopLeft,
    TopRight,
    BottomLeft,
    BottomRight,
}

impl Direction {
    /// Output display value for ASCII display
    pub fn get_display_value(value: &str) -> &str {
        match value {
            x if x == Direction::Top.to_string() => "↑",
            x if x == Direction::Left.to_string() => "←",
            x if x == Direction::Right.to_string() => "→",
            x if x == Direction::Bottom.to_string() => "↓",
            x if x == Direction::TopLeft.to_string() => "↖",
            x if x == Direction::TopRight.to_string() => "↗",
            x if x == Direction::BottomLeft.to_string() => "↙",
            x if x == Direction::BottomRight.to_string() => "↘",
            _ => value,
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Model)]
pub struct Directions(HashMap<String, String>);

impl Deref for Directions {
    type Target = HashMap<String, String>;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl Directions {
    /// Filter neighbouring items and computes directional matches
    pub fn compute(item: &Item, neighbours_values: HashMap<usize, String>) -> Self {
        let mut directions = HashMap::new();
        let filtered_values: HashMap<usize, String> = neighbours_values
            .clone()
            .into_iter()
            .filter(|(_, v)| DIRECTIONAL_MATCHES.contains(&v.as_str()))
            .collect();
        let keys: Vec<usize> = filtered_values.keys().cloned().collect();
        let neighbours_locations = Self::get_neighbours_locations(item.id as i32, item.y as i32)
            .into_iter()
            .filter(|(_, v)| v.iter().all(|val| keys.contains(&(*val as usize))))
            .collect();

        for (id, value) in filtered_values.clone() {
            let direction = match &neighbours_locations {
                dir if Self::check_cardinals(dir, "top", id) => Some(Direction::Top),
                dir if Self::check_cardinals(dir, "bottom", id) => Some(Direction::Bottom),
                dir if Self::check_values(dir, "left", id) => Some(Direction::Left),
                dir if Self::check_values(dir, "right", id) => Some(Direction::Right),
                dir if Self::check_values(dir, "top_left", id) => Some(Direction::TopLeft),
                dir if Self::check_values(dir, "top_right", id) => Some(Direction::TopRight),
                dir if Self::check_values(dir, "bottom_left", id) => Some(Direction::BottomLeft),
                dir if Self::check_values(dir, "bottom_right", id) => Some(Direction::BottomRight),
                _ => None,
            };

            if let Some(dir) = direction {
                directions.insert(dir.to_string(), value);
            }
        }
        Self(directions)
    }

    /// Resolve item's display direction based on compute's matching
    pub fn resolve(self) -> Option<String> {
        if self.is_empty() {
            return None;
        }

        if self.len() > 1 {
            if self.contains_key("top") && self.contains_key("right") {
                return Some("top_right".to_string());
            }
            if self.contains_key("top") && self.contains_key("left") {
                return Some("top_left".to_string());
            }
            if self.contains_key("bottom") && self.contains_key("left") {
                return Some("bottom_left".to_string());
            }
            if self.contains_key("bottom") && self.contains_key("right") {
                return Some("bottom_right".to_string());
            }
        }

        for dir in DIRECTIONAL_PRIORITY.clone() {
            if self.contains_key(dir) {
                return Some(dir.to_string());
            }
        }

        // Default value, should never reach this point
        self.iter().next().map(|(dir, _)| dir.clone())
    }

    /// Check neighbour's direction for base directional values
    /// (left, right, top_left, top_right, bottom_left, bottom_right)
    fn check_values(direction: &HashMap<&str, Vec<i32>>, key: &str, id: usize) -> bool {
        direction
            .get(key)
            .is_some_and(|v| v.len() == 1 && v[0] == (id as i32))
    }

    /// Check neighbour's direction for computed cardinal values
    /// (top, bottom)
    fn check_cardinals(direction: &HashMap<&str, Vec<i32>>, key: &str, id: usize) -> bool {
        direction
            .get(key)
            .is_some_and(|v| v.len() == 2 && v.contains(&(id as i32)))
    }

    fn get_neighbours_locations(index: i32, row: i32) -> HashMap<&'static str, Vec<i32>> {
        let size = *DEFAULT_MAP_SIZE_GRID as i32;
        let mut directions: HashMap<&str, Vec<i32>> = HashMap::new();
        let offsets = Item::get_offset(row as u32);

        // Default neighbours offsets
        for (key, value) in offsets {
            if index + value >= 1 && index + value < size {
                directions.insert(key, vec![index + value]);
            }
        }

        // Computed values for top and bottom neighbours
        for (val, keys) in DIRECTIONAL_KEYS.clone() {
            if keys.iter().all(|key| directions.contains_key(key)) {
                directions.insert(
                    val,
                    keys.iter().map(|k| directions.get(k).unwrap()[0]).collect(),
                );
            }
        }

        directions
    }

    /// Get ASCII value for testing outputs
    pub fn display(item: &Item) -> &str {
        if let Some(val) = &item.display_direction {
            return Direction::get_display_value(val);
        };
        &item.value
    }
}
