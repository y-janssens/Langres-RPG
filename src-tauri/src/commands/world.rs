use crate::{functions, models};

#[tauri::command]
pub fn generate(size: u32, name: String, order: u32, primary: bool) -> models::world::maps::World {
    let _regenerate = functions::world::generate_world(size, name, order, primary);
    _regenerate.unwrap()
}

#[tauri::command]
pub fn regenerate(size: u32) -> Vec<models::world::maps::Item> {
    let _regenerate = functions::world::regenerate_world(size);
    _regenerate.unwrap()
}

#[tauri::command]
pub fn generate_forest(data: Vec<models::world::maps::Item>) -> Vec<models::world::maps::Item> {
    let _generate = functions::world::generate_forest(data);
    _generate.unwrap()
}

#[tauri::command]
pub fn generate_basic_map(data: Vec<models::world::maps::Item>) -> Vec<models::world::maps::Item> {
    let _generate = functions::world::generate_basic_map(data);
    _generate.unwrap()
}
