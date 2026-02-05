use rand::seq::SliceRandom;
use rand::thread_rng;
use serde::{Deserialize, Serialize};
use std::collections::{HashMap, HashSet};
use std::mem::take;

use super::actions::generator::Generator;
use super::config::Conf;
use super::constraints::Constraints;
use super::settings::GRASS;
use crate::backend::utils::functions::get_weighted_random_value;
use crate::world::analysis::report::{MapReport, MapReportEntry};
use crate::world::models::{Item, Options};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Map {
    settings: Conf,     // Procedural generation configuration
    options: Options,   // Request parameters
    content: Vec<Item>, // Map content
}

impl Map {
    /// Procedural map generation entry point
    pub fn generate(tiles: Vec<Item>, options: Options) -> Vec<Item> {
        let settings = Conf::get_config(&options.r#type);
        let mut config = Self {
            settings,
            options,
            content: vec![],
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

        // Keep seeding new regions until nothing is left to collapse
        while let Some(seed_idx) = self.content.iter().position(|tile| tile.entropy > 0) {
            let mut entropy_buckets: HashMap<u32, Vec<usize>> = HashMap::new();
            let mut visited = HashSet::new();

            // Seed this region
            let seed_entropy = self.content[seed_idx].entropy;
            entropy_buckets.entry(seed_entropy).or_default().push(seed_idx);
            visited.insert(seed_idx);

            // Collapse this region
            while !entropy_buckets.is_empty() {
                let min_entropy = *entropy_buckets.keys().min().unwrap();
                let candidates = entropy_buckets.get_mut(&min_entropy).unwrap();
                let &index = candidates.choose(&mut rng).unwrap();

                candidates.retain(|&idx| idx != index);
                if candidates.is_empty() {
                    entropy_buckets.remove(&min_entropy);
                }

                let neighbours = self.content[index].get_neighbours_values(&self.content);
                let constraints = Constraints::apply(&neighbours, &self.settings);
                let value = Self::get_random_value(&constraints.0);

                self.content[index].edit(value);
                self.content[index].entropy = 0;

                if !constraints.0.is_empty() {
                    let local_entropy = constraints.1.len() as u32;

                    for &neighbour_idx in neighbours.keys() {
                        let neighbour = &mut self.content[neighbour_idx];

                        if neighbour.entropy > 0 {
                            if visited.insert(neighbour_idx) {
                                entropy_buckets.entry(neighbour.entropy).or_default().push(neighbour_idx);
                            }

                            if neighbour.entropy != local_entropy {
                                if let Some(old_bucket) = entropy_buckets.get_mut(&neighbour.entropy) {
                                    old_bucket.retain(|&idx| idx != neighbour_idx);
                                    if old_bucket.is_empty() {
                                        entropy_buckets.remove(&neighbour.entropy);
                                    }
                                }

                                neighbour.entropy = local_entropy;
                                entropy_buckets.entry(local_entropy).or_default().push(neighbour_idx);
                            }
                        }
                    }
                }
            }
        }
    }

    fn post_process(&mut self) {
        self.content = Generator::perform_post_actions(&self.options, self.content.clone());
    }

    /// Convert back to World Tiles for game usage
    fn export(&mut self) -> Vec<Item> {
        let items = take(&mut self.content);
        let report = MapReport::new().generate(&items, &self.options).unwrap();

        items
            .clone()
            .into_iter()
            .map(|mut tile| {
                let value = Self::get_value(&report, &tile, &items);
                tile.edit(value);
                tile
            })
            .collect()
    }

    /// Pick a random value for a tile to be collapsed
    fn get_random_value(values: &HashMap<String, u32>) -> String {
        let keys: Vec<&str> = values.keys().map(|k| k.as_str()).collect();

        match keys.len() {
            0 => GRASS.value(),
            1 => String::from(keys[0]),
            _ => get_weighted_random_value(values),
        }
    }

    /// Correct inconsistent values based on map analysis or not
    pub fn get_value(report: &MapReport, tile: &Item, items: &[Item]) -> String {
        if let Some(inconsistencies) = report.details.get(&MapReportEntry::Inconsistent) {
            if !inconsistencies.is_empty() {
                return Constraints::ensure_consistency(tile, items);
            }
        }
        tile.value.clone()
    }
}
