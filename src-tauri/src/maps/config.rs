use crate::maps::tiles::{get_tiles, get_tiles_values};
use lazy_static::lazy_static;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Conf {
    pub name: String,
    pub primary_value: String,
    pub values: Vec<(String, u32)>,
}

lazy_static! {
    pub static ref ENTROPY: u32 = get_tiles_values().len() as u32;

    // Config definitions
    /// Soil - Trees - Water- Shore - Borders - Roads - Fences
    static ref BASE_CONFIG: Conf = Conf {
        name: "base".to_string(),
        primary_value: "-".to_string(),
        values: get_tiles(10, 5, 0, 0, 1, 0, 0),
    };
    static ref FOREST_CONFIG: Conf = Conf {
        name: "forest".to_string(),
        primary_value: "W".to_string(),
         values: get_tiles(45, 9, 7, 3, 3, 0, 0),
    };
    static ref SWAMP_CONFIG: Conf = Conf {
        name: "swamp".to_string(),
        primary_value: "W".to_string(),
        values: get_tiles(30, 8, 30, 30, 5, 0, 0),
    };
    static ref TOWN_CONFIG: Conf = Conf {
        name: "town".to_string(),
        primary_value: "-".to_string(),
        values: get_tiles(50, 18, 13, 5, 5, 0, 0),
    };
    static ref ROADS_CONFIG: Conf = Conf {
        name: "roads".to_string(),
        primary_value: "-".to_string(),
        values: get_tiles(100, 5, 5, 5, 5, 1, 0),
    };

}

/// Get config from entrypoint map's kind
pub fn get_config(name: &str) -> &'static Conf {
    match name {
        "forest" => &FOREST_CONFIG,
        "swamp" => &SWAMP_CONFIG,
        "roads" => &ROADS_CONFIG,
        "town" => &TOWN_CONFIG,
        _ => &BASE_CONFIG,
    }
}

/// Get and compute all available values for a given map type
pub fn get_values(conf: &Conf) -> Vec<String> {
    conf.values
        .iter()
        .flat_map(|(value, count)| std::iter::repeat(value).take(*count as usize))
        .map(|s| s.to_string())
        .collect()
}
