use diesel::prelude::Queryable;
use diesel::SqliteConnection;
use rand::seq::SliceRandom;
use rand::{thread_rng, Rng};
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::io::{Error, ErrorKind::NotFound};
use strum_macros::{Display, EnumIter, EnumString};

use super::directions::Directions;
use crate::backend::utils::functions::{get_weighted_random_value, to_weighted_map};
use crate::events::models::Event;
use crate::game::models::Position;
use crate::npcs::models::Npc;
use crate::world::analysis::report::MapReport;
use crate::world::builder::config::Values;
use crate::world::builder::models::Map;
use crate::world::builder::settings::*;

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Options {
    pub r#type: String,              // Map type
    pub action: Option<String>,      // Action's name
    pub post_action: Option<String>, // Post processing actions
}

impl Default for Options {
    fn default() -> Self {
        Self::new()
    }
}

impl Options {
    pub fn new() -> Self {
        Self {
            r#type: "forest".to_string(),
            action: None,
            post_action: None,
        }
    }

    pub fn generate(r#type: &str, action: Option<String>, post_action: Option<String>) -> Self {
        Self {
            r#type: r#type.to_string(),
            action,
            post_action,
        }
    }
}

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Display, EnumString, EnumIter, Default)]
#[strum(serialize_all = "snake_case")]
pub enum MapType {
    #[default]
    Hexagonal,
    Square,
}

impl MapType {
    pub fn parse(name: &str) -> Result<Self, Error> {
        Self::try_from(name).map_err(|e| Error::new(NotFound, e))
    }

    pub fn get_threshold(&self) -> u32 {
        match self {
            MapType::Hexagonal => *DEFAULT_MAP_SIZE_THRESHOLD,
            MapType::Square => 0,
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct World {
    pub id: i32,
    pub name: String,
    pub size: u32,
    pub order: u32,
    pub complete: bool,
    pub content: Vec<Item>,
    pub starting_point: Position,
    pub primary: bool,
    pub npcs: Vec<Npc>,
    pub options: Options,
    pub r#type: MapType,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Item {
    pub id: u32,
    pub x: u32,
    pub y: u32,
    pub z: i32,
    pub value: String,
    pub display_value: String,
    pub display_color: String,
    pub display_direction: Option<Directions>,
    pub events: Vec<Event>,
    pub walkable: bool,
    pub entropy: u32,
    pub neighbours_ids: Vec<u32>,
}

impl World {
    pub fn new(_size: u32, name: String, order: u32, primary: bool) -> Self {
        let mut rng = rand::thread_rng();
        let mut map = Self {
            id: rng.gen_range(1..=i32::MAX),
            name,
            size: *DEFAULT_MAP_SIZE,
            order,
            complete: false,
            content: vec![],
            starting_point: Position::resolve((9.0, 4.0, 254)),
            primary,
            npcs: vec![],
            r#type: DEFAULT_MAP_TYPE.clone(),
            options: Options {
                r#type: "forest".to_string(),
                action: None,
                post_action: None,
            },
        };
        map.generate();
        map
    }

    pub fn compute_directions(&mut self) {
        let original_content = self.content.clone();
        for item in &mut self.content {
            let neighbours: Vec<Item> = original_content
                .iter()
                .filter(|it| item.neighbours_ids.contains(&it.id))
                .cloned()
                .collect();

            if item.display_direction.clone().is_none_or(|dir| !dir.custom) {
                item.get_display_direction(&neighbours);
            }
        }
    }

    /// Generate random trees in available space
    pub fn generate_forest(mut content: Vec<Item>) -> Vec<Item> {
        let values = to_weighted_map([("T", 1), ("-", 7)].to_vec());

        for item in content.iter_mut().filter(|i| WALKABLE_VALUES.contains(&i.value.as_str())) {
            let value = get_weighted_random_value(&values);
            item.edit(value);
        }
        content
    }

    pub fn generate_npcs(&self, connection: &mut SqliteConnection) -> Result<Vec<Npc>, diesel::result::Error> {
        let mut rng = thread_rng();
        let count = rng.gen_range(1..50);

        let npcs: Vec<Npc> = Npc::get_for_map(self.id, connection)?;

        let npcs_positions: Vec<u32> = npcs.iter().map(|npc| npc.starting_point.id).collect();

        let items: Vec<Item> = self
            .content
            .iter()
            .filter(|it| {
                it.walkable && !it.neighbours_ids.iter().any(|id| npcs_positions.contains(id))
                // Limit npcs packs as much as possible
            })
            .cloned()
            .collect();

        let chosen_items: Vec<Item> = items.choose_multiple(&mut rng, count).cloned().collect();
        for item in chosen_items {
            let npc = Npc::new(self.id, (item.x as f32, item.y as f32, item.id));
            npc.save(connection)?;
        }
        Npc::get_for_map(self.id, connection)
    }

    pub fn clear_npcs(&mut self, connection: &mut SqliteConnection) -> Result<(), diesel::result::Error> {
        Npc::clear(self, connection)?;
        self.npcs = vec![];
        Ok(())
    }

    pub fn generate_report(&self) -> Result<MapReport, Error> {
        let mut report = MapReport::new();
        report.generate(&self.content, &self.options)
    }

    pub fn fix_inconsistencies(&mut self) {
        let original_content = self.content.clone();
        let report = MapReport::new().generate(&original_content, &self.options).unwrap();

        for item in &mut self.content {
            let value = Map::get_value(&report, item, &original_content);
            item.edit(value);
        }
    }
}

impl Default for Item {
    fn default() -> Self {
        let value = String::from("-");
        let (display_value, display_color, walkable) = Values::get_value(&value);
        Self {
            id: 0,
            x: 0,
            y: 0,
            z: 0,
            value,
            display_value,
            display_color,
            display_direction: None,
            events: vec![],
            walkable,
            entropy: 0,
            neighbours_ids: vec![],
        }
    }
}

impl Item {
    pub fn new(i: u32, x: u32, y: u32, value: String) -> Self {
        let (display_value, display_color, walkable) = Values::get_value(&value);
        Self {
            id: i,
            x,
            y,
            value,
            display_value,
            display_color,
            walkable,
            neighbours_ids: Self::get_neighbours_ids(i as i32, y as i32),
            ..Default::default()
        }
    }
    fn get_item_value(value: &str) -> String {
        if value != GRASS.val() {
            return value.to_string();
        }
        EMPTY.value()
    }

    pub fn pre_collapse(mut self) -> Self {
        let value = Self::get_item_value(&self.value);
        let entropy = Values::get_tiles_values().len() as u32;

        self.entropy = if value == EMPTY.val() { entropy } else { 0 };
        self.value = value;
        self
    }

    pub fn get_neighbours_ids(index: i32, row: i32) -> Vec<u32> {
        let offset: Vec<i32> = Self::get_offset(row as u32).values().cloned().collect();
        let size = *DEFAULT_MAP_SIZE_GRID as i32;
        let mut ids: Vec<u32> = offset
            .iter()
            .filter(|&offset| index + offset >= 1 && index + offset < size)
            .map(|&offset| (index + offset) as u32)
            .collect();
        ids.sort_unstable();
        ids
    }

    /// left - right - top_left - top_right - bottom_left - bottom_right
    pub fn get_offset(row: u32) -> HashMap<&'static str, i32> {
        let size = *DEFAULT_MAP_SIZE as i32;
        let offsets = if row.is_multiple_of(2) {
            vec![-1, 1, -size, -size + 1, size, size + 1]
        } else {
            vec![-1, 1, -size - 1, -size, size - 1, size]
        };
        OFFSET_KEYS.iter().zip(offsets.iter()).map(|(&key, &value)| (key, value)).collect()
    }

    /// Get each item's neighbours and return values and indices
    pub fn get_neighbours_values(&self, items: &[Item]) -> HashMap<usize, String> {
        let ids = &self.neighbours_ids;
        let neighbours_items: Vec<Self> = items.iter().filter(|&it| self.neighbours_ids.contains(&it.id)).cloned().collect();
        let mut values: HashMap<usize, String> = HashMap::new();

        for tile in neighbours_items.iter() {
            if ids.binary_search(&tile.id).is_ok() {
                values.insert(tile.id as usize, tile.value.clone());
            }
        }
        values
    }

    pub fn get_display_direction(&mut self, items: &[Self]) -> Option<Directions> {
        if !DIRECTIONAL_VALUES.contains(&self.value.as_str()) {
            return None;
        }
        let neighbours_values = self.get_neighbours_values(items);
        let direction = Directions::compute(self, neighbours_values).resolve();
        self.display_direction = direction.clone();

        direction
    }

    pub fn edit(&mut self, value: String) {
        let (display_value, display_color, walkable) = Values::get_value(&value);

        self.value = value;
        self.walkable = walkable;
        self.display_value = display_value;
        self.display_color = display_color;
    }

    pub fn reset(&mut self) {
        let value = GRASS.val();
        let (display_value, display_color, walkable) = Values::get_value(value);

        self.value = value.to_string();
        self.walkable = walkable;
        self.display_value = display_value;
        self.display_color = display_color;
    }
}
