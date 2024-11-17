use crate::backend::database::get_connection;
use crate::backend::permissions::models::Permission;
use crate::backend::database::authenticated_command;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;
use serde_json::Value;

use super::models::Object;

#[tauri::command]
pub fn load_objects(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Object::load(&mut connection).expect("Failed to load objects")
    })
}

#[tauri::command]
pub fn new_object() -> Value {
    authenticated_command(Permission::Dashboard, Object::new)
}

#[tauri::command]
pub fn save_object(
    data: Object,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Object::save(data, &mut connection).expect("Failed to save object")
    })
}

#[tauri::command]
pub fn delete_object(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Object::delete(id, &mut connection).expect("Failed to delete object")
    })
}
