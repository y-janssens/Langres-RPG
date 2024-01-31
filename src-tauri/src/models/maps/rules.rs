pub mod map_config_rules {
    use crate::models::maps::{procedural::generation::Tile, tiles::map_config_tiles::*};

    struct ExclusionRule {
        values: Vec<String>,
    }

    /// Generate constraints for neighbouring tiles
    pub fn get_constraints(value: &str) -> Vec<String> {
        let mut constraint = ExclusionRule { values: Vec::new() };
        match value {
            "T" => {
                constraint.values = ensure_only_forest_tiles();
            }
            "W" => {
                constraint.values = ensure_no_ground_tiles();
            }
            "-" => {
                constraint.values = ensure_no_standalone_tiles();
            }
            "S" => {
                constraint.values = ensure_no_trees();
            }
            "C" => {
                constraint.values = ensure_no_water_tiles();
            }
            "null" | "R" => {
                constraint.values = ensure_no_constraints();
            }
            _ => {
                constraint.values = ensure_no_constraints();
            }
        }
        constraint.values
    }

    pub fn ensure_values_consistency(value: &str, items: &[Tile], index: usize) -> String {
        match value {
            "S" => ensure_no_stranded_shores(value, items, index),
            "C" => ensure_no_stranded_borders(value, items, index),
            _ => value.to_string(),
        }
    }

    fn ensure_no_stranded_shores(value: &str, items: &[Tile], index: usize) -> String {
        let neighbours = get_neighbours(items, index).0;
        let first_value = &neighbours[0];
        match value {
            _ if !neighbours.contains(&"W".to_string()) => "-".to_string(),
            _ if neighbours.iter().all(|x| x == first_value) => first_value.to_string(),
            _ => value.to_string(),
        }
    }

    fn ensure_no_stranded_borders(value: &str, items: &[Tile], index: usize) -> String {
        let neighbours = get_neighbours(items, index).0;
        match value {
            _ if !neighbours.contains(&"T".to_string()) => "T".to_string(),
            _ if neighbours.iter().all(|x| x == "-" || x == "T") => "T".to_string(),
            _ => value.to_string(),
        }
    }
}
