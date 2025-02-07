use rand::seq::SliceRandom;
use rand::thread_rng;
use serde::{Deserialize, Serialize};

use super::actions::generator::Generator;
use super::config::Values;
use super::constraints::Constraints;
use super::settings::GRASS;
use crate::maps::config::Conf;
use crate::world::models::{Item, Options};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Map {
    settings: Conf,      // Procedural generation configuration
    options: Options,    // Request parameters
    content: Vec<Item>,  // Map content
    values: Vec<String>, // Array of values to be processed as items values
}

impl Map {
    /// Procedural map generation entry point
    pub fn generate(tiles: Vec<Item>, options: Options) -> Vec<Item> {
        let settings = Conf::get_config(&options.r#type);
        let values = Conf::get_values(&settings);
        let mut config = Self {
            settings: settings.clone(),
            options: options.clone(),
            content: vec![],
            values,
        };
        config.get_content(tiles);
        config.collapse();
        config.post_process();

        config.export()
    }

    /// Initially convert map's content to collapsable Items
    fn get_content(&mut self, tiles: Vec<Item>) {
        let items: Vec<Item> = tiles.into_iter().map(|it| it.pre_collapse()).collect();
        self.content = Generator::perform_actions(&self.options, items)
    }

    /// WFC core algorithm, randomly loops over each tile and assign values according to neighbouring constraints
    fn collapse(&mut self) {
        let mut rng = thread_rng();
        let items = &mut self.content;

        while items.iter().any(|tile| tile.entropy > 0) {
            let filtered_indices = Self::get_items_indices(items);

            if let Some(&index) = filtered_indices.choose(&mut rng) {
                let neighbours = items[index].get_neighbours_values(items);
                let constraints = Constraints::apply(neighbours.0, &self.values);
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

    fn post_process(&mut self) {
        self.content = Generator::perform_post_actions(&self.options, self.content.clone());
    }

    /// Convert back to World Tiles for game usage
    fn export(&mut self) -> Vec<Item> {
        let items = &mut self.content;
        items
            .iter()
            .map(|tile| {
                let value = Constraints::ensure_consistency(tile, items);
                let (display_value, display_color, walkable) = Values::get_value(&value);

                Item {
                    id: tile.id,
                    x: tile.x,
                    y: tile.y,
                    z: tile.z,
                    value,
                    walkable,
                    display_value,
                    display_color,
                    events: tile.events.clone(),
                    neighbours_ids: tile.neighbours_ids.clone(),
                    entropy: tile.entropy,
                }
            })
            .collect()
    }

    /// Reduce items list to a list of lowest entropy indices for random picking
    fn get_items_indices(items: &[Item]) -> Vec<usize> {
        let min_entropy = items
            .iter()
            .filter(|tile| tile.entropy > 0)
            .map(|tile| tile.entropy)
            .min()
            .unwrap();

        items
            .iter()
            .enumerate()
            .filter(|&(_, tile)| tile.entropy == min_entropy)
            .map(|(index, _)| index)
            .collect()
    }

    /// Pick a random value for a tile to be collapsed
    fn get_random_value(remaining_values: &[String]) -> String {
        let mut rng = rand::thread_rng();
        match remaining_values.len() {
            0 => GRASS.value(),
            1 => String::from(&remaining_values[0]),
            _ => String::from(remaining_values.choose(&mut rng).unwrap()),
        }
    }
}
