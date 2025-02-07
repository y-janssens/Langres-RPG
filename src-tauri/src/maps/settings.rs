use lazy_static::lazy_static;

use super::{actions::generator::Params, config::Values};

lazy_static! {
    pub static ref DEFAULT_MAP_SIZE : u32 = 50;

    // Base map types definitions
    pub static ref GRASS: Values = Values::store("-", "grass",  true, "#BDB76B");
    pub static ref GROUND: Values = Values::store("G", "ground",  true, "#D2B48C");
    pub static ref MUD : Values = Values::store("M", "mud",  true, "#654321");
    pub static ref TREE : Values= Values::store("T", "tree",  false, "#5EDB35CC");
    pub static ref FENCE: Values = Values::store("F", "fence",  false, "#D2B48C");
    pub static ref BORDER: Values = Values::store("C", "border",  true, "#C8FF1380");
    pub static ref WATER: Values = Values::store("W", "water",  false, "#87CEFA");
    pub static ref SHORE: Values = Values::store("S", "shore",  true, "#DBD257");
    pub static ref ROAD : Values= Values::store("R", "road",  true, "#808080");
    pub static ref EMPTY: Values = Values::store("null", "null",  true, "#000000");

    pub static ref INCONSISTENT_VALUES: Vec<&'static str> = vec![BORDER.val(), SHORE.val()];
    pub static ref ROAD_VALUES: Vec<&'static str> = vec![TREE.val(), BORDER.val(), WATER.val(), SHORE.val()];

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
