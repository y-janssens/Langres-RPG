use serde_json::Value;

use crate::backend::{database::authenticated_command, permissions::models::Permission};

use super::models::World;

#[tauri::command]
pub fn generate(size: u32, name: String, order: u32, primary: bool) -> Value {
    authenticated_command(Permission::Editor, || {
        World::new(size, name, order, primary)
    })
}

#[tauri::command]
pub fn regenerate(map: World) -> Value {
    authenticated_command(Permission::Editor, || World::regenerate(map))
}

#[tauri::command]
pub fn clear(mut map: World) -> Value {
    authenticated_command(Permission::Editor, || {
        let content = World::generate(map.size);
        map.content = content;
        map
    })
}

#[tauri::command]
pub fn generate_forest(mut map: World) -> Value {
    authenticated_command(Permission::Editor, || {
        let content = World::generate_forest(map.content);
        map.content = content;
        map
    })
}
