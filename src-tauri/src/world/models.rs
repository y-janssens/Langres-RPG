use crate::events::models::Event;
use crate::game::models::Position;
use crate::objects::models::Object;
use crate::{config::factory::factory_models::AbstractModel, npcs::models::Npc};
use diesel::prelude::Queryable;
use rand::{seq::SliceRandom, Rng};
use serde::{Deserialize, Serialize};

impl AbstractModel for World {}

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
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Item {
    pub id: u32,
    pub x: u32,
    pub y: u32,
    pub z: i32,
    pub value: String,
    pub events: Vec<Event>,
    pub walkable: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Value {
    id: u32,
    value: String,
    name: String,
    assets: Vec<Option<Object>>,
}

impl World {
    pub fn new(size: u32, name: String, order: u32, primary: bool) -> World {
        let mut rng = rand::thread_rng();
        World {
            id: rng.gen_range(1..=i32::MAX),
            name,
            size,
            order,
            complete: false,
            content: Self::generate(size),
            starting_point: Position::resolve((9.0, 4.0, 254)),
            primary,
            npcs: vec![],
        }
    }

    pub fn regenerate(size: u32) -> Vec<Item> {
        Self::generate(size)
    }

    pub fn generate(size: u32) -> Vec<Item> {
        println!("Generating world data...");
        // Adjust the number of rows to keep a square map
        let rows = ((size as f32 + (size as f32).sqrt()).ceil() + 1_f32) as u32;
        let threshold = rows - size;
        let grid: u32 = size * rows;
        let mut content = Vec::new();
        let walkable_tiles = vec!["-".to_string(), "S".to_string(), "C".to_string()];

        for i in 0..grid {
            let col = i % size;
            let row = i / size;
            let x = if row % 2 == 0 { (col * 2) + 1 } else { col * 2 };
            let y = row;

            let value = Self::generate_borders(col, row, size, threshold);

            let item = Item {
                id: i,
                x,
                y,
                z: 0,
                value: value.clone(),
                events: vec![],
                walkable: walkable_tiles.contains(&value),
            };
            content.push(item);
        }
        content
    }

    // Map content generation

    fn generate_borders(x: u32, y: u32, size: u32, threshold: u32) -> String {
        if (x < 1 || x > size - 2) || (y < 1 || y > size + threshold - 2) {
            return String::from("T");
        }
        String::from("-")
    }

    pub fn generate_forest(mut content: Vec<Item>) -> Vec<Item> {
        println!("Generating game trees...");
        let items = Self::get_items("map");

        for item in content.iter_mut().filter(|i| i.value == "-") {
            let value = String::from(*items.choose(&mut rand::thread_rng()).unwrap());
            item.value = value.clone();
            item.walkable = value == "-";
        }
        content
    }

    fn get_items(name: &str) -> Vec<&'static str> {
        match name {
            "map" => vec!["T", "-", "-", "-", "-", "-"],
            _ => vec![],
        }
    }
}
