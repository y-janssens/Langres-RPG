use rand::seq::SliceRandom;
use rand::thread_rng;
use serde::{Deserialize, Serialize};
use std::collections::HashSet;

use super::actions::{generator::Generator, params::Options};
use super::tiles::Values;
use crate::events::models::Event;
use crate::maps::config::*;
use crate::maps::rules::{ensure_values_consistency, get_constraints};
use crate::maps::tiles::{get_neighbours_ids, get_neighbours_values, get_walkable_tiles};
use crate::world::models::Item;

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Map {
    settings: Conf,
    options: Options,
    content: Vec<Tile>,
    values: Vec<String>,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Tile {
    pub id: u32,
    pub x: u32,
    pub y: u32,
    pub z: i32,
    pub value: String,
    events: Vec<Event>,
    walkable: bool,
    pub entropy: u32,
    pub neighbours_ids: Vec<u32>,
}

impl From<Item> for Tile {
    fn from(item: Item) -> Self {
        let value = if item.value == "-" {
            "null"
        } else {
            &item.value
        };

        Tile {
            id: item.id,
            x: item.x,
            y: item.y,
            z: item.z,
            value: String::from(value),
            events: item.events,
            walkable: item.walkable,
            neighbours_ids: get_neighbours_ids(item.id, item.y as i32),
            entropy: if value == "null" { *ENTROPY } else { 0 },
        }
    }
}

impl Map {
    /// Procedural map generation entry point
    pub fn generate(tiles: Vec<Item>, options: Options) -> Vec<Item> {
        let settings = get_config(&options.r#type);
        let values = get_values(settings);
        let mut config = Self {
            settings: settings.clone(),
            options: options.clone(),
            content: vec![],
            values,
        };
        config.get_content(tiles);
        config.collapse();
        config.export()
    }

    /// Initially convert map's content to collapsable Items
    fn get_content(&mut self, tiles: Vec<Item>) {
        let items: Vec<Tile> = tiles.into_iter().map(Tile::from).collect();
        self.content = Generator::perform_actions(&self.options, items)
    }

    /// Convert back to World Tiles for game usage
    fn export(&mut self) -> Vec<Item> {
        let items = &mut self.content;
        items
            .iter()
            .enumerate()
            .map(|(index, tile)| {
                let value = ensure_values_consistency(&tile.value, items, index);
                let walkable = get_walkable_tiles(&value);
                Item {
                    id: tile.id,
                    x: tile.x,
                    y: tile.y,
                    z: tile.z,
                    value: value.clone(),
                    display_value: Values::get_display(&value),
                    events: [].to_vec(),
                    walkable,
                }
            })
            .collect()
    }

    /// Check all item's neighbours to eliminate forbidden values
    pub fn apply_constraints(
        neighbours: Vec<String>,
        values: &Vec<String>,
    ) -> (Vec<String>, Vec<String>) {
        let mut filtered_values = Vec::new();
        let mut remaining = HashSet::new();

        let neighbours_constraints: HashSet<String> = neighbours
            .iter()
            .flat_map(|item| get_constraints(item))
            .collect();

        for i in values {
            if !neighbours_constraints.contains(&i.to_string()) {
                filtered_values.push(i.to_string());
                remaining.insert(i.to_string());
            }
        }

        (filtered_values, remaining.into_iter().collect())
    }

    /// Reduce items list to a list of lowest entropy indices for random picking
    fn get_items_indices(items: &[Tile]) -> Vec<usize> {
        let min_entropy = items
            .iter()
            .filter(|tile| tile.entropy > 0)
            .map(|tile| tile.entropy)
            .min()
            .unwrap_or(0);

        items
            .iter()
            .enumerate()
            .filter(|&(_, tile)| tile.entropy == min_entropy)
            .map(|(index, _)| index)
            .collect()
    }

    /// Pick a random value for a tile to be collapsed
    fn get_random_value(remaining_values: &Vec<String>) -> String {
        let mut rng = rand::thread_rng();
        match remaining_values.len() {
            0 => String::from("-"),
            1 => String::from(&remaining_values[0]),
            _ => String::from(remaining_values.choose(&mut rng).unwrap()),
        }
    }

    /// WFC core algorithm, randomly loops over each tile and assign values according to neighbouring constraints
    fn collapse(&mut self) {
        let mut rng = thread_rng();
        let items = &mut self.content;

        while items.iter().any(|tile| tile.entropy > 0) {
            let filtered_indices = Self::get_items_indices(items);

            if let Some(&index) = filtered_indices.choose(&mut rng) {
                let neighbours = get_neighbours_values(items, index);
                let constraints = Self::apply_constraints(neighbours.0, &self.values);
                let value = Self::get_random_value(&constraints.0);

                items[index].value = value;
                items[index].entropy = 0;

                for neighbour_index in neighbours.1 {
                    if items[neighbour_index].entropy > 0 && !constraints.0.is_empty() {
                        // Assign entropy value based on remaining possibilities
                        items[neighbour_index].entropy = constraints.1.len() as u32;
                    }
                }
            } else {
                break;
            }
        }
        self.content = items.to_vec();
    }
}
