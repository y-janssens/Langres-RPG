pub mod generation {
    use std::collections::HashSet;

    use crate::models::maps::config::map_config::*;
    use crate::models::maps::rules::map_config_rules::{
        ensure_values_consistency, get_constraints,
    };
    use crate::models::maps::tiles::map_config_tiles::{get_neighbours, get_walkable_tiles};
    use crate::models::maps::topology::map_topology::Topology;
    use crate::models::world::maps::{Item, Threshold};
    use rand::seq::SliceRandom;
    use serde::{Deserialize, Serialize};

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Map {
        settings: Conf,
        content: Vec<Tile>,
        values: Vec<String>,
        interactive_mode: bool,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Tile {
        pub id: u32,
        pub x: u32,
        pub y: u32,
        pub z: i32,
        pub value: String,
        threshold: Option<Threshold>,
        walkable: bool,
        tesselated: bool,
        pub entropy: u32,
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
                z: 0,
                value: String::from(value),
                threshold: item.threshold,
                walkable: item.walkable,
                tesselated: false,
                entropy: if value == "null" { *ENTROPY } else { 0 },
            }
        }
    }

    impl Map {
        /// Procedural map generation entry point
        pub fn generate(tiles: Vec<Item>, kind: &str) -> Vec<Item> {
            let settings = get_config(kind);
            let values = get_values(settings);
            let mut conf = Map {
                settings: settings.clone(),
                content: Self::to_internal_value(tiles, false),
                values,
                interactive_mode: false,
            };
            conf.collapse();
            conf.export()
        }

        /// Initially convert map's content to collapsable Items
        fn to_internal_value(tiles: Vec<Item>, edit: bool) -> Vec<Tile> {
            let items: Vec<Tile> = tiles.into_iter().map(Tile::from).collect();
            Topology::topologize(items.clone(), edit)
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
                        z: if value == "W" && self.interactive_mode {
                            0
                        } else {
                            tile.z
                        },
                        value,
                        threshold: tile.threshold,
                        walkable,
                    }
                })
                .collect()
        }

        /// Check all item's neighbours to eliminate forbidden values
        fn apply_constraints(
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
        fn get_random_value(values: &Vec<String>, remaining_values: &Vec<String>) -> String {
            let mut rng = rand::thread_rng();
            match remaining_values.len() {
                0 => String::from(values.choose(&mut rng).unwrap()),
                1 => String::from(&remaining_values[0]),
                _ => String::from(remaining_values.choose(&mut rng).unwrap()),
            }
        }

        /// WFC core algorithm, randomly loops over each tile and assign values according to config and constraints
        fn collapse(&mut self) -> Vec<Tile> {
            let mut rng = rand::thread_rng();
            let items = &mut self.content;
            let values = &self.values;

            while items.iter().any(|tile| tile.entropy > 0) {
                let filtered_indices = Self::get_items_indices(items);

                if let Some(&index) = filtered_indices.choose(&mut rng) {
                    let neighbours = get_neighbours(items, index);
                    let constraints = Self::apply_constraints(neighbours.0, values);
                    let value = Self::get_random_value(values, &constraints.0);

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
            items.to_vec()
        }
    }
}
