use diesel::{r2d2::ConnectionManager, SqliteConnection};
use serde_json::Value;

use crate::{
    permissions::models::Permission, settings::database::get_connection,
    views::models::authenticated_command,
};

use super::models::Function;

#[tauri::command]
pub fn load_functions(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Function::load(&mut connection).expect("Failed to load functions")
    })
}

#[tauri::command]
pub fn new_function() -> Value {
    authenticated_command(Permission::Dashboard, Function::new)
}

#[tauri::command]
pub fn save_function(
    data: Function,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Function::save(data, &mut connection).expect("Failed to save function")
    })
}

#[tauri::command]
pub fn delete_function(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Function::delete(id, &mut connection).expect("Failed to delete function")
    });
}
