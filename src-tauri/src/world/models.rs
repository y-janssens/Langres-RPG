use diesel::prelude::Queryable;
use rand::{seq::SliceRandom, Rng};
use serde::{Deserialize, Serialize};

use crate::events::models::Event;
use crate::game::models::Position;
use crate::maps::config::Values;
use crate::maps::models::Map;
use crate::maps::settings::{EMPTY, GRASS, TREE};
use crate::{backend::conf::factory::factory_models::AbstractModel, npcs::models::Npc};

impl AbstractModel for World {}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Options {
    pub r#type: String,              // Map type
    pub action: Option<String>,      // Action's name
    pub post_action: Option<String>, // Post processing actions
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

    fn get_neighbours_ids(index: i32, row: i32, size: i32, map_size: u32) -> Vec<u32> {
        let offset = Self::get_offset(row as u32, map_size as i32);
        let mut ids: Vec<u32> = offset
            .iter()
            .filter(|&offset| index + offset >= 1 && index + offset < size)
            .map(|&offset| (index + offset) as u32)
            .collect();
        ids.sort_unstable();
        ids
    }

    fn get_offset(row: u32, size: i32) -> Vec<i32> {
        if row % 2 == 0 {
            vec![-1, 1, -size, -size + 1, size, size + 1]
        } else {
            vec![-1, 1, -size - 1, -size, size, size - 1]
        }
    }

    /// Get each item's neighbours and return values and indices
    pub fn get_neighbours_values(&self, items: &[Item]) -> (Vec<String>, Vec<usize>) {
        let ids = &self.neighbours_ids;
        let size = self.neighbours_ids.len();
        let mut neighbour_indices = Vec::with_capacity(size);
        let mut neighbour_values = Vec::with_capacity(size);

        for (id, tile) in items.iter().enumerate() {
            if ids.binary_search(&tile.id).is_ok() {
                neighbour_indices.push(id);
                neighbour_values.push(tile.value.clone());
            }
        }
        (neighbour_values, neighbour_indices)
    }
}

impl World {
    pub fn new(size: u32, name: String, order: u32, primary: bool) -> Self {
        let mut rng = rand::thread_rng();
        Self {
            id: rng.gen_range(1..=i32::MAX),
            name,
            size,
            order,
            complete: false,
            content: Self::generate(size),
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

    pub fn regenerate(map: World) -> World {
        map.generate_content(None)
    }

    /// Generate base map
    pub fn generate(size: u32) -> Vec<Item> {
        println!("Generating world data...");
        // Adjust the number of rows to keep a square map
        let rows = ((size as f32 + (size as f32).sqrt()).ceil() + 1_f32) as u32;
        let threshold = rows - size;
        let grid: u32 = size * rows;
        let mut content = Vec::with_capacity(grid.try_into().unwrap());

        for i in 0..grid {
            let col = i % size;
            let y = i / size;
            let x = if y % 2 == 0 { (col * 2) + 1 } else { col * 2 };

            let value = Self::generate_borders(col, y, size, threshold);
            let (display_value, display_color, walkable) = Values::get_value(&value);

            let item = Item {
                id: i,
                x,
                y,
                z: 0,
                value,
                display_value,
                display_color,
                events: vec![],
                walkable,
                entropy: 0,
                neighbours_ids: Item::get_neighbours_ids(i as i32, y as i32, grid as i32, size),
            };
            content.push(item);
        }
        content
    }

    pub fn generate_content(self, options: Option<Options>) -> Self {
        let mut opts = self.options.clone();
        if options.is_some() {
            opts = options.unwrap();
        }
        let cleared_content = Self::generate(self.size);
        let content = Map::generate(cleared_content, opts.clone());
        Self {
            content,
            options: opts,
            ..self
        }
    }

    /// Generate map's borders
    fn generate_borders(x: u32, y: u32, size: u32, threshold: u32) -> String {
        if (x < 1 || x > size - 2) || (y < 1 || y > size + threshold - 2) {
            return TREE.value();
        }
        GRASS.value()
    }

    /// Generate random trees in available space
    pub fn generate_forest(mut content: Vec<Item>) -> Vec<Item> {
        println!("Generating game trees...");
        let items = ["T", "-", "-", "-", "-", "-", "-", "-"];

        for item in content.iter_mut().filter(|i| i.walkable) {
            let value = String::from(*items.choose(&mut rand::thread_rng()).unwrap());
            item.value = value.clone();
            item.walkable = value != TREE.val();
        }
        content
    }
}
