use crate::permissions::models::Permission;
use crate::settings::database::get_connection;
use crate::views::models::authenticated_command;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;
use serde_json::Value;

use super::models::Loot;

#[tauri::command]
pub fn load_loots(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Loot::load(&mut connection).expect("Failed to load loots")
    })
}

#[tauri::command]
pub fn new_loot(kind: &str) -> Value {
    authenticated_command(Permission::Dashboard, || Loot::new(kind))
}

#[tauri::command]
pub fn save_loot(
    data: Loot,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Loot::save(data, &mut connection).expect("Failed to save loot")
    })
}

#[tauri::command]
pub fn delete_loot(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Loot::delete(id, &mut connection).expect("Failed to delete loot")
    })
}
