use crate::{classes, functions};

#[tauri::command]
pub fn regenerate(size: u32) -> Vec<classes::world::world::Item> {
    let _regenerate = functions::world::regenerate_world(size);
    _regenerate.unwrap()
}

#[tauri::command]
pub fn generate(size: u32, name: String, order: u32) -> classes::world::world::World {
    let _regenerate = functions::world::generate_world(size, name, order);
    _regenerate.unwrap()
}

#[tauri::command]
pub fn populate_trees(data: Vec<classes::world::world::Item>) -> Vec<classes::world::world::Item> {
    let _generate = functions::world::populate_trees(data);
    _generate.unwrap()
}
