use crate::backend::database::{authenticated_command, get_connection};
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::Achievement;

#[tauri::command]
pub fn load_achievements(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Ok(Achievement::load(&mut connection)?)
    })
}

#[tauri::command]
pub fn new_achievement() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || Ok(Achievement::new()))
}

#[tauri::command]
pub fn save_achievement(
    data: Achievement,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Ok(data.save(&mut connection)?)
    })
}

#[tauri::command]
pub fn delete_achievement(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Ok(Achievement::delete(id, &mut connection)?)
    })
}
