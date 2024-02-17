pub mod map_config {
    use crate::models::maps::tiles::map_config_tiles::{get_tiles, get_tiles_values};
    use lazy_static::lazy_static;
    use serde::{Deserialize, Serialize};

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Conf {
        pub values: Vec<(String, u32)>,
    }

    lazy_static! {
        pub static ref ENTROPY: u32 = get_tiles_values().len() as u32;

        // Config definitions
        /// Soil - Trees - Water- Shore - Borders - Roads
        static ref BASE_CONFIG: Conf = Conf {
            values: get_tiles(10, 5, 0, 0, 1, 0),
        };
        static ref FOREST_CONFIG: Conf = Conf {
            values: get_tiles(110, 20, 25, 10, 10, 0),
        };
        static ref SWAMP_CONFIG: Conf = Conf {
            values: get_tiles(1, 3, 5, 1, 1, 0),
        };
        static ref ROADS_CONFIG: Conf = Conf {
            values: get_tiles(1, 0, 0, 0, 0, 0),
        };

    }

    /// Get config from entrypoint map's kind
    pub fn get_config(name: &str) -> &'static Conf {
        match name {
            "forest" => &FOREST_CONFIG,
            "swamp" => &SWAMP_CONFIG,
            "roads" => &ROADS_CONFIG,
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

    pub fn get_map_size(size: u32) -> (usize, usize) {
        let width = ((size as f32) * 0.85).sqrt() as usize;
        let height = ((size as f32) / 0.85).sqrt().ceil() as usize;
        (width, height)
    }
}
