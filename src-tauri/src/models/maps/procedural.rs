pub mod generation {
    use crate::models::maps::config::map_config;
    use crate::models::maps::rules::map_config_rules;
    use crate::models::maps::tiles::map_config_tiles::*;
    use crate::models::world::maps::{Item, Threshold};
    use rand::seq::SliceRandom;
    use serde::{Deserialize, Serialize};

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Map {
        settings: map_config::Conf,
        content: Vec<Tile>,
        values: Vec<String>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Tile {
        pub id: u32,
        x: u32,
        y: u32,
        pub value: String,
        threshold: Option<Threshold>,
        walkable: bool,
        entropy: u32,
    }

    impl From<Item> for Tile {
        fn from(item: Item) -> Self {
            Tile {
                id: item.id,
                x: item.x,
                y: item.y,
                value: String::from("null"),
                threshold: item.threshold,
                walkable: item.walkable,
                entropy: *map_config::ENTROPY,
            }
        }
    }

    impl Map {
        /// Procedural map generation entry point
        pub fn generate(tiles: Vec<Item>, kind: &str, roads: bool) -> Vec<Item> {
            let settings = map_config::get_config(kind);
            let values = map_config::get_values(settings.clone());
            let conf = Map {
                settings: settings.clone(),
                content: Self::to_internal_value(tiles),
                values: values.clone(),
            };
            let mut items = Self::collapse_items(conf);
            if roads {
                items = Self::draw_roads(items);
            }
            Self::to_representation(items)
        }

        /// Initially convert map's content to collapsable Items
        pub fn to_internal_value(tiles: Vec<Item>) -> Vec<Tile> {
            let mut items = vec![];
            for item in tiles {
                let tile = Tile::from(item);
                items.push(tile);
            }
            items
        }

        /// Convert back to World Tiles for game usage
        fn to_representation(items: Vec<Tile>) -> Vec<Item> {
            let mut tiles = vec![];
            for (index, tile) in items.iter().enumerate() {
                let neighbours = Self::get_neighbours(&items, index);
                let value = map_config_rules::ensure_values_consistency(&tile.value, neighbours.0);

                tiles.push(Item {
                    id: tile.id,
                    x: tile.x,
                    y: tile.y,
                    value: value.clone(),
                    threshold: tile.threshold,
                    walkable: get_walkable_tiles().contains(&value),
                })
            }
            tiles
        }

        /// Get each item's neighbours and return values and indices
        pub fn get_neighbours(items: &[Tile], index: usize) -> (Vec<String>, Vec<usize>) {
            let mut neighbour_indices = Vec::new();
            let mut neighbour_values = Vec::new();

            let item = &items[index];
            let even_ids = vec![-1, 1, -50, -49, 50, 51];
            let odd_ids = vec![-1, 1, -51, -50, 50, 49];
            let offsets = if item.y % 2 == 0 { &even_ids } else { &odd_ids };

            let resolved_ids: Vec<i32> = offsets
                .iter()
                .map(|&offset| (item.id as i32) + offset)
                .collect();

            for (id, tile) in items.iter().enumerate() {
                if resolved_ids.contains(&(tile.id as i32)) {
                    neighbour_indices.push(id);
                    neighbour_values.push(tile.value.clone());
                }
            }
            (neighbour_values, neighbour_indices)
        }

        /// Check all item's neighbours to eliminate forbidden values
        pub fn apply_constraints(
            neighbours: Vec<String>,
            values: Vec<String>,
        ) -> (Vec<String>, Vec<String>) {
            let mut filtered_values = Vec::new();
            let mut neighbours_constraints = Vec::new();
            let mut remaining_possibilities = Vec::new();

            for item in neighbours {
                let constraint = map_config_rules::get_constraints(&item);
                for value in constraint {
                    if !neighbours_constraints.contains(&value) {
                        neighbours_constraints.push(value);
                    }
                }
            }

            for i in values {
                if !neighbours_constraints.contains(&i) {
                    filtered_values.push(i.clone());
                }
                if !neighbours_constraints.contains(&i) && !remaining_possibilities.contains(&i) {
                    remaining_possibilities.push(i);
                }
            }
            (filtered_values, remaining_possibilities)
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
        fn get_random_value(values: Vec<String>, remaining_values: Vec<String>) -> String {
            let mut rng = rand::thread_rng();
            match remaining_values.len() {
                0 => String::from(values.clone().choose(&mut rng).unwrap()),
                1 => remaining_values[0].clone(),
                _ => String::from(remaining_values.clone().choose(&mut rng).unwrap()),
            }
        }

        /// WFC core algorithm, randomly loops over each tile and assign values according to config and constraints
        fn collapse_items(config: Map) -> Vec<Tile> {
            let mut rng = rand::thread_rng();
            let mut items = config.content;
            let values = config.values;

            while items.iter().any(|tile| tile.entropy > 0) {
                let filtered_indices = Self::get_items_indices(&items);

                if let Some(&index) = filtered_indices.choose(&mut rng) {
                    let neighbours = Self::get_neighbours(&items, index);
                    let constraints = Self::apply_constraints(neighbours.0, values.clone());

                    items[index].value =
                        Self::get_random_value(values.clone(), constraints.clone().0);
                    items[index].entropy = 0;

                    for neighbour_index in neighbours.1 {
                        if items[neighbour_index].entropy > 0 && !constraints.0.is_empty() {
                            // Assign entropy value based on remaining possibilities length
                            items[neighbour_index].entropy = constraints.1.len() as u32;
                        }
                    }
                } else {
                    break;
                }
            }
            items
        }

        fn draw_roads(items: Vec<Tile>) -> Vec<Tile> {
            items
        }
    }
}
