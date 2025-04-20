use super::models::Npc;
use crate::backend::database::authenticated_command;
use crate::backend::database::get_connection;
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;

use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

#[tauri::command]
pub fn load_npcs(
    map_id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Ok(Npc::get_for_map(map_id, &mut connection)?)
    })
}

#[tauri::command]
pub fn load_npc(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || Ok(Npc::load(id, &mut connection)?))
}

#[tauri::command]
pub fn new_npc(map_id: i32, position: (f32, f32, u32)) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, || {
        Ok(Npc::get_zombie(map_id, position)?)
    })
}

#[tauri::command]
pub fn save_npc(
    npc: Npc,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || Ok(npc.save(&mut connection)?))
}

#[tauri::command]
pub fn delete_npc(
    npc: Npc,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || Ok(npc.delete(&mut connection)?))
}
