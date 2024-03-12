
use lazy_static::lazy_static;

use crate::maps::models::Tile;

lazy_static! {
// Base map types definitions
static ref SOIL: &'static str = "-";
static ref TREE: &'static str = "T";
static ref BORDER: &'static str = "C";
static ref WATER: &'static str = "W";
static ref SHORE: &'static str = "S";
static ref ROAD: &'static str = "R";
static ref EMPTY: &'static str = "null";
static ref WALKABLE_TILES: Vec<&'static str> =
    vec![&SOIL, &SHORE, &BORDER];
}

/// Get all possible tiles list with weight
/// Soil - Trees - Water- Shore - Borders - Roads
pub fn get_tiles(
    soil: u32,
    trees: u32,
    water: u32,
    shore: u32,
    border: u32,
    roads: u32,
) -> Vec<(String, u32)> {
    let tiles: Vec<(String, u32)> = vec![
        (SOIL.to_string(), soil),
        (TREE.to_string(), trees),
        (WATER.to_string(), water),
        (SHORE.to_string(), shore),
        (BORDER.to_string(), border),
        (ROAD.to_string(), roads),
    ];
    tiles
}

pub fn ensure_no_water_tiles() -> Vec<String> {
    vec![WATER.to_string(), SHORE.to_string()]
}

pub fn ensure_no_trees() -> Vec<String> {
    vec![TREE.to_string()]
}

pub fn ensure_only_forest_tiles() -> Vec<String> {
    vec![SOIL.to_string(), WATER.to_string(), SHORE.to_string()]
}

pub fn ensure_no_ground_tiles() -> Vec<String> {
    vec![SOIL.to_string(), TREE.to_string(), BORDER.to_string()]
}

pub fn ensure_no_standalone_tiles() -> Vec<String> {
    vec![WATER.to_string(), TREE.to_string()]
}

pub fn ensure_no_constraints() -> Vec<String> {
    vec![EMPTY.to_string()]
}

/// Get all possible tiles list with only values
pub fn get_tiles_values() -> Vec<String> {
    let tiles = get_tiles(0, 0, 0, 0, 0, 0);
    tiles.iter().map(|tile| tile.0.to_string()).collect()
}

pub fn get_walkable_tiles(value: &str) -> bool {
    WALKABLE_TILES.contains(&value)
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
