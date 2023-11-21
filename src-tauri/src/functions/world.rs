use crate::classes::world::world::Item;
use crate::classes::world::world::World;
#[allow(dead_code)]

pub fn generate_world(
    size: u32,
    name: String,
    order: u32,
) -> Result<World, Box<dyn std::error::Error>> {
    let mut _world = World::new(size, name, order);
    Ok(_world)
}

pub fn regenerate_world(size: u32) -> Result<Vec<Item>, Box<dyn std::error::Error>> {
    let _world = World::regenerate(size);
    Ok(_world)
}

pub fn populate_trees(data: Vec<Item>) -> Result<Vec<Item>, Box<dyn std::error::Error>> {
    let map = World::generate_trees(data);
    Ok(map)
}
