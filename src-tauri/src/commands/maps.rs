use crate::models::{maps::procedural::generation::Map, world::maps::Item};
use crate::utils::factories::factories_definitions::WorldFactory;
use crate::utils::factory::factory_models::Factory;

#[tauri::command]
pub fn generate_maps_batch(kind: String) -> Vec<Item> {
    let world = WorldFactory.generate();
    Map::generate(world.content, &kind)
}
