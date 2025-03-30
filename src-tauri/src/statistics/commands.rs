use crate::backend::database::authenticated_command;
use crate::backend::database::get_connection;
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::Statistic;

#[tauri::command]
pub fn load_statistics(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Ok(Statistic::load(&mut connection)?)
    })
}

#[tauri::command]
pub fn new_statistic() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || Ok(Statistic::new()))
}

#[tauri::command]
pub fn save_statistic(
    data: Statistic,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || Ok(data.save(&mut connection)?))
}

#[tauri::command]
pub fn delete_statistic(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Ok(Statistic::delete(id, &mut connection)?)
    })
}
