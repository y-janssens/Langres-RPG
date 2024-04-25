use crate::maps::models::Tile;
use lazy_static::lazy_static;

#[allow(dead_code)]
#[derive(Clone)]
pub struct Values {
    value: String,
    display_value: String,
}

lazy_static! {
// Base map types definitions
    static ref SOIL: Values = Values::store("-", "grass");
    static ref TREE: Values = Values::store("T", "tree");
    static ref FENCE: Values = Values::store("F", "fence");
    static ref BORDER: Values = Values::store("C", "border");
    static ref WATER: Values = Values::store("W", "water");
    static ref SHORE: Values = Values::store("S", "shore");
    static ref ROAD: Values = Values::store("R", "road");
    static ref EMPTY: Values = Values::store("null", "null");

    static ref EVEN_IDS: Vec<i32> = vec![-1, 1, -50, -49, 50, 51];
    static ref ODD_IDS: Vec<i32> = vec![-1, 1, -51, -50, 50, 49];

    static ref WALKABLE_TILES: Vec<&'static str> =
        vec![SOIL.get_str(), SHORE.get_str(), BORDER.get_str()];

    static ref VALUES: Vec<Values> = vec![
        SOIL.clone(),
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

    pub fn get_str(&self) -> &str {
        &self.value
    }

    pub fn get_value(&self) -> String {
        self.value.clone()
    }

    // pub fn get_display(value: &str) -> String {
    //     VALUES.clone().into_iter().find(|v| &v.value == value).unwrap().display_value
    // }
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
        (SOIL.get_value(), soil),
        (TREE.get_value(), trees),
        (WATER.get_value(), water),
        (SHORE.get_value(), shore),
        (BORDER.get_value(), border),
        (ROAD.get_value(), roads),
        (FENCE.get_value(), fences),
    ];
    tiles
}

pub fn ensure_no_water_tiles() -> Vec<String> {
    vec![WATER.get_value(), SHORE.get_value()]
}

pub fn ensure_no_trees() -> Vec<String> {
    vec![TREE.get_value(), BORDER.get_value()]
}

pub fn ensure_only_forest_tiles() -> Vec<String> {
    vec![SOIL.get_value(), WATER.get_value(), SHORE.get_value()]
}

pub fn ensure_empty_area() -> Vec<String> {
    vec![
        WATER.get_value(),
        SHORE.get_value(),
        BORDER.get_value(),
        TREE.get_value(),
    ]
}

pub fn ensure_no_ground_tiles() -> Vec<String> {
    vec![SOIL.get_value(), TREE.get_value(), BORDER.get_value()]
}

pub fn ensure_no_standalone_tiles() -> Vec<String> {
    vec![WATER.get_value(), TREE.get_value()]
}

pub fn ensure_no_constraints() -> Vec<String> {
    vec![]
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

fn get_offset(item: &Tile) -> Vec<i32> {
    if item.y % 2 == 0 {
        EVEN_IDS.clone()
    } else {
        ODD_IDS.clone()
    }
}
