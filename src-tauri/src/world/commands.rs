use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use crate::backend::{
    database::{authenticated_command, authenticated_thread, get_connection},
    permissions::models::Permission,
    response::Response,
    utils::errors::ValidationError,
};

use super::models::World;

#[tauri::command]
pub fn generate(size: u32, name: String, order: u32, primary: bool) -> Result<Response, ValidationError> {
    authenticated_command(Permission::DevTools, || Ok(World::new(size, name, order, primary)))
}

#[tauri::command]
pub async fn regenerate(mut map: World) -> Result<Response, ValidationError> {
    authenticated_thread(Permission::Editor, || async {
        let result = map.regenerate().await;
        Ok(result)
    })
    .await
}

#[tauri::command]
pub fn clear_npcs(
    mut map: World,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        map.clear_npcs(&mut connection)?;
        Ok(map)
    })
}

#[tauri::command]
pub fn clear(
    mut map: World,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        map.clear_npcs(&mut connection)?;
        map.generate();
        Ok(map)
    })
}

#[tauri::command]
pub fn compute_map_directions(mut map: World) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, || {
        map.compute_directions();
        Ok(map)
    })
}

#[tauri::command]
pub fn fix_map_inconsistencies(mut map: World) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, || {
        map.fix_inconsistencies();
        Ok(map)
    })
}

#[tauri::command]
pub fn generate_forest(mut map: World) -> Result<Response, ValidationError> {
    authenticated_command(Permission::DevTools, || {
        let content = World::generate_forest(map.content);
        map.content = content;
        Ok(map)
    })
}

#[tauri::command]
pub fn generate_npcs(
    mut map: World,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::DevTools, || {
        let npcs = map.generate_npcs(&mut connection)?;
        map.npcs = npcs;
        Ok(map)
    })
}
