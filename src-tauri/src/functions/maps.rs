use crate::{
    models::{maps::procedural::generation::Map, world::maps::Item},
    tests::factories::tests_factories::world_factory,
};

pub fn generate_map_batch(kind: String) -> Result<Vec<Item>, Box<dyn std::error::Error>> {
    let world = world_factory("batch", 50);
    Ok(Map::generate(world.content, &kind))
}
