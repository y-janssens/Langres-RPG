use crate::{functions, models};

#[tauri::command]
pub fn generate(size: u32, name: String, order: u32) -> models::world::world::World {
    let _regenerate = functions::world::generate_world(size, name, order);
    _regenerate.unwrap()
}

#[tauri::command]
pub fn regenerate(size: u32) -> Vec<models::world::world::Item> {
    let _regenerate = functions::world::regenerate_world(size);
    _regenerate.unwrap()
}

#[tauri::command]
pub fn populate_trees(data: Vec<models::world::world::Item>) -> Vec<models::world::world::Item> {
    let _generate = functions::world::populate_trees(data);
    _generate.unwrap()
}
