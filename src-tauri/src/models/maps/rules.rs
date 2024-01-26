pub mod map_config_rules {
    use crate::models::maps::tiles::map_config_tiles::*;

    struct ExclusionRule {
        values: Vec<String>,
    }

    /// Generate constraints for neighbouring tiles
    pub fn get_constraints(value: &str) -> Vec<String> {
        let mut constraint = ExclusionRule { values: vec![] };
        match value {
            "T" => {
                constraint.values = ensure_only_forest_tiles();
            }
            "R" => {
                constraint.values = ensure_road_consistency();
            }
            "W" => {
                constraint.values = ensure_no_water_tiles();
            }
            "-" => {
                constraint.values = ensure_no_isolated_tiles();
            }
            "S" => {
                constraint.values = ensure_no_trees();
            }
            "C" => {
                constraint.values = ensure_no_ground_tiles();
            }
            "null" => {
                constraint.values = ensure_no_constraints();
            }
            _ => {
                constraint.values = ensure_no_constraints();
            }
        }
        constraint.values
    }

    pub fn ensure_values_consistency(value: &str, neighbours: Vec<String>) -> String {
        match value {
            "S" => ensure_no_stranded_shores(value, neighbours),
            "C" => ensure_no_stranded_borders(value, neighbours),
            _ => value.to_string(),
        }
    }

    fn ensure_no_stranded_shores(value: &str, neighbours: Vec<String>) -> String {
        match value {
            _ if !neighbours.contains(&"W".to_string()) => "-".to_string(),
            _ if neighbours.iter().all(|x| x == "-") => "-".to_string(),
            _ if neighbours.iter().all(|x| x == "W") => "W".to_string(),
            _ => value.to_string(),
        }
    }

    fn ensure_no_stranded_borders(value: &str, neighbours: Vec<String>) -> String {
        match value {
            _ if !neighbours.contains(&"T".to_string()) => "T".to_string(),
            _ if neighbours.iter().all(|x| x == "-") => "T".to_string(),
            _ if neighbours.iter().all(|x| x == "T") => "T".to_string(),
            _ => value.to_string(),
        }
    }
}
