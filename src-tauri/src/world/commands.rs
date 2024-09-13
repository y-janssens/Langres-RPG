use super::models::World;

#[tauri::command]
pub fn generate(size: u32, name: String, order: u32, primary: bool) -> World {
    World::new(size, name, order, primary)
}

#[tauri::command]
pub fn regenerate(map: World) -> World {
    World::regenerate(map)
}

#[tauri::command]
pub fn clear(mut map: World) -> World {
    let content = World::generate(map.size);
    map.content = content;
    map
}

#[tauri::command]
pub fn generate_forest(mut map: World) -> World {
    let content = World::generate_forest(map.content);
    map.content = content;
    map
}
