use crate::permissions::models::Permission;
use crate::settings::database::get_connection;
use crate::views::models::authenticated_command;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;
use serde_json::Value;

use super::models::Statistic;

#[tauri::command]
pub fn load_statistics(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Statistic::load(&mut connection).expect("Failed to load statistics")
    })
}

#[tauri::command]
pub fn new_statistic() -> Value {
    authenticated_command(Permission::Dashboard, Statistic::new)
}

#[tauri::command]
pub fn save_statistic(
    data: Statistic,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Statistic::save(data, &mut connection).expect("Failed to save statistic")
    })
}

#[tauri::command]
pub fn delete_statistic(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Statistic::delete(id, &mut connection).expect("Failed to delete statistic")
    })
}
