use lazy_static::lazy_static;

use crate::maps::models::Tile;

#[derive(Clone)]
pub struct Values {
    pub value: String,
    pub display_value: String,
}

lazy_static! {
// Base map types definitions
    pub static ref GRASS: Values = Values::store("-", "grass");
    pub static ref GROUND: Values = Values::store("G", "ground");
    pub static ref MUD: Values = Values::store("M", "mud");
    pub static ref TREE: Values = Values::store("T", "tree");
    pub static ref FENCE: Values = Values::store("F", "fence");
    pub static ref BORDER: Values = Values::store("C", "border");
    pub static ref WATER: Values = Values::store("W", "water");
    pub static ref SHORE: Values = Values::store("S", "shore");
    pub static ref ROAD: Values = Values::store("R", "road");
    static ref EMPTY: Values = Values::store("null", "null");

    static ref EVEN_IDS: Vec<i32> = vec![-1, 1, -50, -49, 50, 51];
    static ref ODD_IDS: Vec<i32> = vec![-1, 1, -51, -50, 50, 49];

    static ref WALKABLE_TILES: Vec<&'static str> =
        vec![&GRASS.value, &SHORE.value, &BORDER.value, &GROUND.value];

    static ref VALUES: Vec<Values> = vec![
        GRASS.clone(),
        GROUND.clone(),
        MUD.clone(),
        TREE.clone(),
        FENCE.clone(),
        BORDER.clone(),
        WATER.clone(),
        SHORE.clone(),
        ROAD.clone(),
        EMPTY.clone()
    ];
}

impl Values {
    fn store(value: &str, display_value: &str) -> Self {
        Self {
            value: value.to_string(),
            display_value: display_value.to_string(),
        }
    }

    pub fn value(&self) -> String {
        self.value.clone()
    }

    pub fn get_display(value: &str) -> String {
        VALUES
            .clone()
            .into_iter()
            .find(|v| v.value == value)
            .unwrap()
            .display_value
    }
}

/// Get all possible tiles list with weight
/// Soil - Trees - Water- Shore - Borders - Roads - Fences
pub fn get_tiles(
    grass: u32,
    trees: u32,
    water: u32,
    shore: u32,
    border: u32,
) -> Vec<(String, u32)> {
    let tiles: Vec<(String, u32)> = vec![
        (GRASS.value(), grass),
        (TREE.value(), trees),
        (WATER.value(), water),
        (SHORE.value(), shore),
        (BORDER.value(), border),
        (ROAD.value(), 0),
        (FENCE.value(), 0),
        (GROUND.value(), 0),
    ];
    tiles
}

pub fn ensure_no_water_tiles() -> Vec<String> {
    vec![WATER.value(), SHORE.value()]
}

pub fn ensure_no_trees() -> Vec<String> {
    vec![TREE.value(), BORDER.value()]
}

pub fn ensure_only_forest_tiles() -> Vec<String> {
    vec![GRASS.value(), WATER.value(), SHORE.value()]
}

pub fn ensure_empty_area() -> Vec<String> {
    vec![WATER.value(), SHORE.value(), BORDER.value(), TREE.value()]
}

pub fn ensure_no_ground_tiles() -> Vec<String> {
    vec![GRASS.value(), TREE.value(), BORDER.value()]
}

pub fn ensure_no_standalone_tiles() -> Vec<String> {
    vec![WATER.value(), TREE.value()]
}

pub fn ensure_no_constraints() -> Vec<String> {
    vec![]
}

/// Get all possible tiles list with only values
pub fn get_tiles_values() -> Vec<String> {
    VALUES.iter().map(|tile| tile.value.to_string()).collect()
}

pub fn get_walkable_tiles(value: &str) -> bool {
    WALKABLE_TILES.contains(&value)
}

/// Get each item's neighbours and return values and indices
pub fn get_neighbours_values(items: &[Tile], index: usize) -> (Vec<String>, Vec<usize>) {
    let offset = get_offset(items[index].y);
    let mut neighbour_indices = Vec::with_capacity(offset.len());
    let mut neighbour_values = Vec::with_capacity(offset.len());

    let ids: Vec<u32> = items[index].neighbours_ids.clone();

    for (id, tile) in items.iter().enumerate() {
        if ids.binary_search(&tile.id).is_ok() {
            neighbour_indices.push(id);
            neighbour_values.push(tile.value.clone());
        }
    }
    (neighbour_values, neighbour_indices)
}

pub fn get_neighbours_ids(index: u32, row: i32) -> Vec<u32> {
    let offset = get_offset(row as u32);
    let mut ids: Vec<u32> = offset
        .iter()
        .map(|&offset| (index as i32 + offset) as u32)
        .collect();
    ids.sort_unstable();
    ids
}

fn get_offset(row: u32) -> Vec<i32> {
    if row % 2 == 0 {
        EVEN_IDS.clone()
    } else {
        ODD_IDS.clone()
    }
}
