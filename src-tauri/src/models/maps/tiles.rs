pub mod map_config_tiles {
    use lazy_static::lazy_static;

    lazy_static! {
        static ref SOIL: String = "-".to_string();
        static ref TREE: String = "T".to_string();
        static ref BORDER: String = "C".to_string();
        static ref WATER: String = "W".to_string();
        static ref SHORE: String = "S".to_string();
        static ref ROAD: String = "R".to_string();
        static ref EMPTY: String = "null".to_string();
        static ref WALKABLE_TILES: Vec<String> =
            vec!["-".to_string(), "S".to_string(), "C".to_string()];
    }

    /// Get all possible tiles list with weight
    pub fn get_tiles(
        soil_weight: u32,
        trees_weight: u32,
        water_weight: u32,
        shore_weight: u32,
        border_weight: u32,
        roads_weight: u32,
    ) -> Vec<(String, u32)> {
        let tiles: Vec<(String, u32)> = vec![
            (SOIL.clone(), soil_weight),
            (TREE.clone(), trees_weight),
            (WATER.clone(), water_weight),
            (SHORE.clone(), shore_weight),
            (BORDER.clone(), border_weight),
            (ROAD.clone(), roads_weight),
        ];
        tiles
    }

    pub fn ensure_no_ground_tiles() -> Vec<String> {
        vec![WATER.clone(), SHORE.clone(), BORDER.clone()]
    }

    pub fn ensure_no_trees() -> Vec<String> {
        vec![TREE.clone()]
    }

    pub fn ensure_only_forest_tiles() -> Vec<String> {
        vec![SOIL.clone(), WATER.clone(), SHORE.clone()]
    }

    pub fn ensure_road_consistency() -> Vec<String> {
        vec![EMPTY.clone()]
    }

    pub fn ensure_no_water_tiles() -> Vec<String> {
        vec![SOIL.clone(), TREE.clone(), BORDER.clone()]
    }

    pub fn ensure_no_isolated_tiles() -> Vec<String> {
        vec![WATER.clone(), TREE.clone()]
    }

    pub fn ensure_no_constraints() -> Vec<String> {
        vec![EMPTY.clone()]
    }

    /// Get all possible tiles list with only values
    pub fn get_tiles_values() -> Vec<String> {
        let tiles = get_tiles(0, 0, 0, 0, 0, 0);
        let mut values = vec![];

        for tile in tiles {
            values.push(tile.0)
        }
        values
    }

    pub fn get_walkable_tiles() -> Vec<String> {
        WALKABLE_TILES.clone()
    }
}
