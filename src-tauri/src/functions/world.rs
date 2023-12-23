use crate::models::world::maps::Item;
use crate::models::world::maps::World;
#[allow(dead_code)]

pub fn generate_world(
    size: u32,
    name: String,
    order: u32,
    primary: bool,
) -> Result<World, Box<dyn std::error::Error>> {
    let mut _world = World::new(size, name, order, primary);
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
