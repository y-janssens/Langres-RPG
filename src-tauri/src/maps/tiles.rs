use lazy_static::lazy_static;

use crate::maps::models::Tile;

lazy_static! {
// Base map types definitions
static ref SOIL: &'static str = "-";
static ref TREE: &'static str = "T";
static ref FENCE: &'static str = "F";
static ref BORDER: &'static str = "C";
static ref WATER: &'static str = "W";
static ref SHORE: &'static str = "S";
static ref ROAD: &'static str = "R";
static ref EMPTY: &'static str = "null";

static ref EVEN_IDS: Vec<i32> = vec![-1, 1, -50, -49, 50, 51];
static ref ODD_IDS: Vec<i32> = vec![-1, 1, -51, -50, 50, 49];

static ref WALKABLE_TILES: Vec<&'static str> =
    vec![&SOIL, &SHORE, &BORDER];
}

/// Get all possible tiles list with weight
/// Soil - Trees - Water- Shore - Borders - Roads - Fences
pub fn get_tiles(
    soil: u32,
    trees: u32,
    water: u32,
    shore: u32,
    border: u32,
    roads: u32,
    fences: u32,
) -> Vec<(String, u32)> {
    let tiles: Vec<(String, u32)> = vec![
        (SOIL.to_string(), soil),
        (TREE.to_string(), trees),
        (WATER.to_string(), water),
        (SHORE.to_string(), shore),
        (BORDER.to_string(), border),
        (ROAD.to_string(), roads),
        (FENCE.to_string(), fences),
    ];
    tiles
}

pub fn ensure_no_water_tiles() -> Vec<String> {
    to_proper_rules(vec![*WATER, *SHORE])
}

pub fn ensure_no_trees() -> Vec<String> {
    to_proper_rules(vec![*TREE, *BORDER])
}

pub fn ensure_only_forest_tiles() -> Vec<String> {
    to_proper_rules(vec![*SOIL, *WATER, *SHORE])
}

pub fn ensure_empty_area() -> Vec<String> {
    to_proper_rules(vec![*WATER, *SHORE, *BORDER, *TREE])
}

pub fn ensure_no_ground_tiles() -> Vec<String> {
    to_proper_rules(vec![*SOIL, *TREE, *BORDER])
}

pub fn ensure_no_standalone_tiles() -> Vec<String> {
    to_proper_rules(vec![*WATER, *TREE])
}

pub fn ensure_no_constraints() -> Vec<String> {
    to_proper_rules(vec![])
}

/// Get all possible tiles list with only values
pub fn get_tiles_values() -> Vec<String> {
    let tiles = get_tiles(0, 0, 0, 0, 0, 0, 0);
    tiles.iter().map(|tile| tile.0.to_string()).collect()
}

pub fn get_walkable_tiles(value: &str) -> bool {
    WALKABLE_TILES.contains(&value)
}

/// Get each item's neighbours and return values and indices
pub fn get_neighbours(items: &[Tile], index: usize) -> (Vec<String>, Vec<usize>) {
    let offset = get_offset(&items[index]);
    let mut neighbour_indices = Vec::with_capacity(offset.len());
    let mut neighbour_values = Vec::with_capacity(offset.len());

    let mut resolved_ids: Vec<i32> = offset
        .iter()
        .map(|&offset| (items[index].id as i32) + offset)
        .collect();

    resolved_ids.sort_unstable();

    for (id, tile) in items.iter().enumerate() {
        if resolved_ids.binary_search(&(tile.id as i32)).is_ok() {
            neighbour_indices.push(id);
            neighbour_values.push(tile.value.clone());
        }
    }
    (neighbour_values, neighbour_indices)
}

fn to_proper_rules(rules: Vec<&'static str>) -> Vec<String> {
    rules.into_iter().map(String::from).collect()
}

fn get_offset(item: &Tile) -> Vec<i32> {
    if item.y % 2 == 0 {
        EVEN_IDS.clone()
    } else {
        ODD_IDS.clone()
    }
}
