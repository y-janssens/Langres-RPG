use super::models::{Item, World};

#[tauri::command]
pub fn generate(size: u32, name: String, order: u32, primary: bool) -> World {
    World::new(size, name, order, primary)
}

#[tauri::command]
pub fn regenerate(map: World) -> World {
    World::regenerate(map)
}

#[tauri::command]
pub fn generate_forest(data: Vec<Item>) -> Vec<Item> {
    World::generate_forest(data)
}
