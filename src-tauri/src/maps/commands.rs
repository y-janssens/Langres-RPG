use super::models::Map;
use crate::config::factories::factories_definitions::WorldFactory;
use crate::config::factory::factory_models::Factory;
use crate::world::models::Item;

#[tauri::command]
pub fn generate_maps_batch(kind: String) -> Vec<Item> {
    let world = WorldFactory.generate();
    Map::generate(world.content, &kind)
}
