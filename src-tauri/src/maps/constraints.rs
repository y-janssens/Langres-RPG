use std::collections::HashSet;

use super::settings::{
    BORDER, DEFAULT_MAP_SIZE, DEFAULT_MAP_SIZE_FACTOR, EMPTY, FENCE, GRASS, GROUND,
    INCONSISTENT_VALUES, ROAD, ROAD_VALUES, SHORE, TREE, WATER,
};
use crate::world::models::Item;

pub struct Constraints {
    values: Vec<String>,
}

impl Constraints {
    /// Get all possible tiles list with weight
    /// Soil - Trees - Water- Shore - Borders - Roads - Fences - Ground
    pub fn get_tiles(
        grass: u32,
        trees: u32,
        water: u32,
        shore: u32,
        border: u32,
    ) -> Vec<(String, u32)> {
        let factor = *DEFAULT_MAP_SIZE / *DEFAULT_MAP_SIZE_FACTOR;
        let tiles: Vec<(String, u32)> = vec![
            (GRASS.value(), grass * factor),
            (TREE.value(), trees * factor),
            (WATER.value(), water * factor),
            (SHORE.value(), shore * factor),
            (BORDER.value(), border * factor),
            (ROAD.value(), 0),
            (FENCE.value(), 0),
            (GROUND.value(), 0),
        ];
        tiles
    }

    pub fn ensure_no_water_tiles() -> Self {
        Self {
            values: vec![WATER.value(), SHORE.value()],
        }
    }

    pub fn ensure_no_trees() -> Self {
        Self {
            values: vec![TREE.value(), BORDER.value()],
        }
    }

    pub fn ensure_only_forest_tiles() -> Self {
        Self {
            values: vec![GRASS.value(), WATER.value(), SHORE.value()],
        }
    }

    pub fn ensure_empty_area() -> Self {
        Self {
            values: vec![WATER.value(), SHORE.value(), BORDER.value(), TREE.value()],
        }
    }

    pub fn ensure_no_ground_tiles() -> Self {
        Self {
            values: vec![GRASS.value(), TREE.value(), BORDER.value()],
        }
    }

    pub fn ensure_no_standalone_tiles() -> Self {
        Self {
            values: vec![WATER.value(), TREE.value()],
        }
    }

    pub fn ensure_no_constraints() -> Self {
        Self { values: vec![] }
    }

    /// Check all item's neighbours to eliminate forbidden values
    pub fn apply(neighbours: Vec<String>, values: &Vec<String>) -> (Vec<String>, Vec<String>) {
        let mut filtered_values = Vec::new();
        let mut remaining = HashSet::new();

        let neighbours_constraints: HashSet<String> =
            neighbours.iter().flat_map(|item| Self::get(item)).collect();

        for i in values {
            if !neighbours_constraints.contains(&i.to_string()) {
                filtered_values.push(i.to_string());
                remaining.insert(i.to_string());
            }
        }

        (filtered_values, remaining.into_iter().collect())
    }

    /// Generate constraints for neighbouring tiles
    pub fn get(value: &str) -> Vec<String> {
        match value {
            val if val == TREE.val() => Self::ensure_only_forest_tiles().values,
            val if val == FENCE.val() => Self::ensure_empty_area().values,
            val if val == WATER.val() => Self::ensure_no_ground_tiles().values,
            val if val == GRASS.val() => Self::ensure_no_standalone_tiles().values,
            val if val == SHORE.val() => Self::ensure_no_trees().values,
            val if val == BORDER.val() => Self::ensure_no_water_tiles().values,
            val if val == EMPTY.val() || val == ROAD.val() => Self::ensure_no_constraints().values,
            _ => Self::ensure_no_constraints().values,
        }
    }

    pub fn ensure_consistency(item: &Item, items: &[Item]) -> String {
        let value = item.value.as_str();
        if !INCONSISTENT_VALUES.contains(&value) {
            return value.to_string();
        }

        let neighbours = item.get_neighbours_values(items).0;
        match value {
            val if val == SHORE.val() => Self::ensure_no_stranded_shores(value, &neighbours),
            val if val == BORDER.val() => Self::ensure_no_stranded_borders(value, &neighbours),
            val if val == ROAD.val() => Self::ensure_roads_consistency(value, &neighbours),
            _ => value.to_string(),
        }
    }

    fn ensure_no_stranded_shores(value: &str, neighbours: &[String]) -> String {
        let first_value = &neighbours[0];
        match value {
            _ if !neighbours.contains(&WATER.value()) => GRASS.value(),
            _ if neighbours.iter().all(|x| x == first_value) => first_value.to_string(),
            _ => value.to_string(),
        }
    }

    fn ensure_no_stranded_borders(value: &str, neighbours: &[String]) -> String {
        match value {
            _ if !neighbours.contains(&TREE.value()) => TREE.value(),
            _ if neighbours
                .iter()
                .all(|x| x == GRASS.val() || x == TREE.val()) =>
            {
                TREE.value()
            }
            _ => value.to_string(),
        }
    }

    fn ensure_roads_consistency(value: &str, neighbours: &[String]) -> String {
        match value {
            _ if ROAD_VALUES
                .iter()
                .any(|item| neighbours.contains(&item.to_string())) =>
            {
                TREE.value()
            }
            _ => value.to_string(),
        }
    }
}
