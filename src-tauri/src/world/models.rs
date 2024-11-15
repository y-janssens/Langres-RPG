use crate::events::models::Event;
use crate::game::models::Position;
use crate::maps::models::Map;
use crate::maps::tiles::Values;
use crate::{npcs::models::Npc, settings::factory::factory_models::AbstractModel};
use diesel::prelude::Queryable;
use rand::{seq::SliceRandom, Rng};
use serde::{Deserialize, Serialize};

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
    pub events: Vec<Event>,
    pub walkable: bool,
}

impl Item {
    pub fn get_item_value(&self) -> String {
        if self.value == "-" {
            "null".to_string()
        } else {
            self.value.to_string()
        }
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
        let mut content = Vec::new();
        let walkable_tiles = ["-".to_string(), "S".to_string(), "C".to_string()];

        for i in 0..grid {
            let col = i % size;
            let y = i / size;
            let x = if y % 2 == 0 { (col * 2) + 1 } else { col * 2 };

            let value = Self::generate_borders(col, y, size, threshold);

            let item = Item {
                id: i,
                x,
                y,
                z: 0,
                value: value.clone(),
                display_value: Values::get_display(&value),
                events: vec![],
                walkable: walkable_tiles.contains(&value),
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
            return String::from("T");
        }
        String::from("-")
    }

    /// Generate random trees in available space
    pub fn generate_forest(mut content: Vec<Item>) -> Vec<Item> {
        println!("Generating game trees...");
        let items = ["T", "-", "-", "-", "-", "-", "-", "-"];
        let walkable_values = ["-", "M", "G"];

        for item in content
            .iter_mut()
            .filter(|i| walkable_values.contains(&i.value.as_str()))
        {
            let value = String::from(*items.choose(&mut rand::thread_rng()).unwrap());
            item.value = value.clone();
            item.walkable = value != "T";
        }
        content
    }
}
