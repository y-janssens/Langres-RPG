use crate::{
    models::{maps::procedural::generation::Map, world::maps::Item},
    tests::factories::tests_factories::world_factory,
};

#[tauri::command]
pub fn generate_maps_batch(kind: String) -> Vec<Item> {
    let world = world_factory("batch", 50);
    Map::generate(world.content, &kind)
}
