use crate::maps::models::Tile;
use crate::maps::tiles::*;
use lazy_static::lazy_static;

lazy_static! {
    static ref INCONSISTENT_VALUES: Vec<&'static str> = vec!["C", "S", "R"];
    static ref ROAD_VALUES: Vec<&'static str> = vec!["T", "C", "W", "S",];
}

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
        "F" => {
            constraint.values = ensure_empty_area();
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
    if !INCONSISTENT_VALUES.contains(&value) {
        return value.to_string();
    }
    let neighbours = get_neighbours(items, index).0;
    match value {
        "S" => ensure_no_stranded_shores(value, &neighbours),
        "C" => ensure_no_stranded_borders(value, &neighbours),
        "R" => ensure_roads_consistency(value, &neighbours),
        _ => value.to_string(),
    }
}

fn ensure_no_stranded_shores(value: &str, neighbours: &[String]) -> String {
    let first_value = &neighbours[0];
    match value {
        _ if !neighbours.contains(&"W".to_string()) => "-".to_string(),
        _ if neighbours.iter().all(|x| x == first_value) => first_value.to_string(),
        _ => value.to_string(),
    }
}

fn ensure_no_stranded_borders(value: &str, neighbours: &[String]) -> String {
    match value {
        _ if !neighbours.contains(&"T".to_string()) => "T".to_string(),
        _ if neighbours.iter().all(|x| x == "-" || x == "T") => "T".to_string(),
        _ => value.to_string(),
    }
}

fn ensure_roads_consistency(value: &str, neighbours: &[String]) -> String {
    match value {
        _ if ROAD_VALUES
            .iter()
            .any(|item| neighbours.contains(&item.to_string())) =>
        {
            "T".to_string()
        }
        _ => value.to_string(),
    }
}
