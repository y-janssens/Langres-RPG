use std::collections::HashMap;

use lazy_static::lazy_static;

use super::{builder::actions::generator::Params, values::Values};

lazy_static! {
    pub static ref DEFAULT_MAP_SIZE : u32 = 50;
    pub static ref DEFAULT_MAP_SIZE_FACTOR : u32 = 50;
    pub static ref DEFAULT_MAP_SIZE_ROWS : u32 = ((*DEFAULT_MAP_SIZE as f32 + (*DEFAULT_MAP_SIZE as f32).sqrt()).ceil() + 1_f32) as u32;
    pub static ref DEFAULT_MAP_SIZE_THRESHOLD : u32 =  *DEFAULT_MAP_SIZE_ROWS - *DEFAULT_MAP_SIZE;
    pub static ref DEFAULT_MAP_SIZE_GRID : u32 = *DEFAULT_MAP_SIZE * *DEFAULT_MAP_SIZE_ROWS;
    pub static ref OFFSET_KEYS: Vec<&'static str> = vec!["left", "right", "top_left", "top_right", "bottom_left", "bottom_right"];
    pub static ref DIRECTIONAL_VALUES: Vec<&'static str> = vec![BORDER.val(), SHORE.val(), ROAD.val(), FENCE.val()];
    pub static ref DIRECTIONAL_MATCHES: Vec<&'static str> = vec![WATER.val(), TREE.val()];
    pub static ref DIRECTIONAL_KEYS: HashMap<&'static str, [&'static str; 2]> = HashMap::from([
            ("top", ["top_left", "top_right"]),
            ("bottom", ["bottom_left", "bottom_right"]),
        ]);
    pub static ref DIRECTIONAL_PRIORITY: Vec<&'static str> = ["top", "bottom"].iter().chain(OFFSET_KEYS.iter()).cloned().collect();

    // Base map types definitions
    pub static ref GRASS: Values = Values::store("-", "grass", None, "#BDB76B", true);
    pub static ref GROUND: Values = Values::store("G", "ground", None, "#D2B48C", true);
    pub static ref MUD : Values = Values::store("M", "mud", None, "#654321", true);
    pub static ref TREE : Values = Values::store("T", "tree",  Some("C"), "#5EDB35CC", false);
    pub static ref FENCE: Values = Values::store("F", "fence",  None, "#D2B48C", false);
    pub static ref BORDER: Values = Values::store("C", "border",  None, "#C8FF1380", true);
    pub static ref WATER: Values = Values::store("W", "water", Some("S"), "#87CEFA", false);
    pub static ref SHORE: Values = Values::store("S", "shore", None, "#DBD257", true);
    pub static ref ROAD : Values= Values::store("R", "road", None, "#808080", true);
    pub static ref EMPTY: Values = Values::store("null", "null", None, "#000000", true);

    pub static ref DEFAULT_MAP_VALUE: Values = GRASS.clone();
    pub static ref INCONSISTENT_VALUES: Vec<&'static str> = vec![BORDER.val(), SHORE.val()];
    pub static ref TRANSITORY_VALUES: Vec<(&'static str, &'static str)> = vec![(TREE.val(), BORDER.val()), (WATER.val(), SHORE.val())];
    pub static ref ROAD_VALUES: Vec<&'static str> = vec![TREE.val(), BORDER.val(), WATER.val(), SHORE.val()];
    pub static ref WALKABLE_VALUES: Vec<&'static str> = vec![GRASS.val(), MUD.val(), GROUND.val()];

    pub static ref VALUES: Vec<Values> = vec![
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


    // Actions parameters : scale - factor - output
    pub static ref TOWN_PARAMS: Params = Params::get("town", 0.025, 1.8, vec![FENCE.val()], TREE.val(), true);
    pub static ref SHANTY_PARAMS: Params = Params::get("shanty", 0.1, 1.8, vec![FENCE.val()], GRASS.val(), true);
    pub static ref DIRT_PARAMS: Params = Params::get("dirt", 0.1, 1.25, vec![GROUND.val()], GRASS.val(), false);
    pub static ref GROUND_PARAMS: Params = Params::get("ground", 0.05, 1.8, vec![GROUND.val(), GRASS.val(), MUD.val()], GRASS.val(), false);

    pub static ref AVAILABLE_PARAMS: Vec<&'static String> = vec![&TOWN_PARAMS.name, &SHANTY_PARAMS.name];
    pub static ref AVAILABLE_ACTIONS: Vec<&'static String> = vec![&DIRT_PARAMS.name, &GROUND_PARAMS.name];
}
