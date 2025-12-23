use super::models::Loot;
use crate::backend::database::authenticated_command;
use crate::backend::database::get_connection;
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;

use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

#[tauri::command]
pub fn load_loots(connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || Ok(Loot::load(&mut connection)?))
}

#[tauri::command]
pub fn new_loot(kind: &str) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || Ok(Loot::new(kind)))
}

#[tauri::command]
pub fn save_loot(
    data: Loot,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || Ok(data.save(&mut connection)?))
}

#[tauri::command]
pub fn delete_loot(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || Ok(Loot::delete(id, &mut connection)?))
}
