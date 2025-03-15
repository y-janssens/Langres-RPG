use diesel::prelude::Queryable;
use rand::Rng;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use tokio::sync::mpsc;

use super::directions::Directions;
use crate::backend::utils::functions::{get_weighted_random_value, to_weighted_map};
use crate::events::models::Event;
use crate::game::models::Position;
use crate::maps::config::Values;
use crate::maps::models::Map;
use crate::maps::settings::*;
use crate::maps::settings::{DIRECTIONAL_VALUES, OFFSET_KEYS};
use crate::npcs::models::Npc;

use models_registry::Model;

#[derive(Debug, Serialize, Deserialize, Clone, Model)]
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
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Model)]
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
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Model)]
pub struct Item {
    pub id: u32,
    pub x: u32,
    pub y: u32,
    pub z: i32,
    pub value: String,
    pub display_value: String,
    pub display_color: String,
    pub display_direction: Option<String>,
    pub events: Vec<Event>,
    pub walkable: bool,
    pub entropy: u32,
    pub neighbours_ids: Vec<u32>,
}

impl Item {
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
        let offsets = if row % 2 == 0 {
            vec![-1, 1, -size, -size + 1, size, size + 1]
        } else {
            vec![-1, 1, -size - 1, -size, size - 1, size]
        };
        OFFSET_KEYS
            .iter()
            .zip(offsets.iter())
            .map(|(&key, &value)| (key, value))
            .collect()
    }

    /// Get each item's neighbours and return values and indices
    pub fn get_neighbours_values(&self, items: &[Item]) -> HashMap<usize, String> {
        let ids = &self.neighbours_ids;
        let neighbours_items: Vec<Self> = items
            .iter()
            .filter(|&it| self.neighbours_ids.contains(&it.id))
            .cloned()
            .collect();
        let mut values: HashMap<usize, String> = HashMap::new();

        for tile in neighbours_items.iter() {
            if ids.binary_search(&tile.id).is_ok() {
                values.insert(tile.id as usize, tile.value.clone());
            }
        }
        values
    }

    pub fn get_display_direction(&mut self, items: &[Self]) -> Option<String> {
        if !DIRECTIONAL_VALUES.contains(&self.value.as_str()) {
            return None;
        }
        let neighbours_values = self.get_neighbours_values(items);
        let direction = Directions::compute(self, neighbours_values).resolve();
        self.display_direction = direction.clone();

        direction
    }
}

impl World {
    pub fn new(_size: u32, name: String, order: u32, primary: bool) -> Self {
        let mut rng = rand::thread_rng();
        Self {
            id: rng.gen_range(1..=i32::MAX),
            name,
            size: *DEFAULT_MAP_SIZE,
            order,
            complete: false,
            content: Self::generate(),
            starting_point: Position::resolve((9.0, 4.0, 254)),
            primary,
            npcs: vec![],
            options: Options {
                r#type: "forest".to_string(),
                action: None,
                post_action: None,
            },
        }
    }

    pub async fn regenerate(&mut self) -> World {
        self.generate_content(None).await
    }

    /// Generate base map
    pub fn generate() -> Vec<Item> {
        println!("Generating world data...");
        let size = *DEFAULT_MAP_SIZE;
        let grid: u32 = *DEFAULT_MAP_SIZE_GRID;

        let mut content = Vec::with_capacity(grid.try_into().unwrap());

        for i in 0..grid {
            let col = i % size;
            let y = i / size;
            let x = if y % 2 == 0 { (col * 2) + 1 } else { col * 2 };

            let value = Self::generate_borders(col, y);
            let (display_value, display_color, walkable) = Values::get_value(&value);

            let item = Item {
                id: i,
                x,
                y,
                z: 0,
                value,
                display_value,
                display_color,
                display_direction: None,
                events: vec![],
                walkable,
                entropy: 0,
                neighbours_ids: Item::get_neighbours_ids(i as i32, y as i32),
            };
            content.push(item);
        }
        content
    }

    pub async fn generate_content(&mut self, options: Option<Options>) -> Self {
        let (tx, mut rx) = mpsc::channel(100);
        let mut opts = self.options.clone();
        if options.is_some() {
            opts = options.unwrap();
        }
        let cleared_content = Self::generate();
        let opts_for_closure = opts.clone();
        let result =
            tokio::task::spawn_blocking(move || Map::generate(cleared_content, opts_for_closure))
                .await
                .unwrap();

        tx.send(result).await.unwrap();
        self.content = rx.recv().await.unwrap();
        self.compute_directions();
        self.clone()
    }

    /// Generate map's borders
    fn generate_borders(x: u32, y: u32) -> String {
        let size = *DEFAULT_MAP_SIZE;
        let threshold = *DEFAULT_MAP_SIZE_THRESHOLD;
        if (x < 1 || x > size - 2) || (y < 1 || y > size + threshold - 2) {
            return TREE.value();
        }
        GRASS.value()
    }

    pub fn compute_directions(&mut self) {
        let original_content = self.content.clone();
        for item in &mut self.content {
            let neighbours: Vec<Item> = original_content
                .iter()
                .filter(|it| item.neighbours_ids.contains(&it.id))
                .cloned()
                .collect();
            item.get_display_direction(&neighbours);
        }
    }

    /// Generate random trees in available space
    pub fn generate_forest(mut content: Vec<Item>) -> Vec<Item> {
        println!("Generating game trees...");
        let values = to_weighted_map([("T", 1), ("-", 7)].to_vec());

        for item in content
            .iter_mut()
            .filter(|i| WALKABLE_VALUES.contains(&i.value.as_str()))
        {
            let value = get_weighted_random_value(&values);
            item.value = value.clone();
            item.walkable = value != TREE.val();
        }
        content
    }
}
