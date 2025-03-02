use crate::backend::{
    database::{authenticated_command, authenticated_thread},
    permissions::models::Permission,
    response::Response,
    utils::errors::ValidationError,
};

use super::models::World;

#[tauri::command]
pub fn generate(
    size: u32,
    name: String,
    order: u32,
    primary: bool,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::DevTools, || {
        World::new(size, name, order, primary)
    })
}

#[tauri::command]
pub async fn regenerate(map: World) -> Result<Response, ValidationError> {
    authenticated_thread(Permission::Editor, || World::regenerate(map)).await
}

#[tauri::command]
pub fn clear(mut map: World) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, || {
        let content = World::generate(map.size);
        map.content = content;
        map
    })
}

#[tauri::command]
pub fn generate_forest(mut map: World) -> Result<Response, ValidationError> {
    authenticated_command(Permission::DevTools, || {
        let content = World::generate_forest(map.content);
        map.content = content;
        map
    })
}
