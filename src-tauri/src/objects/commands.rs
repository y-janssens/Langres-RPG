use crate::config::fetcher::get_connection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::Object;

#[tauri::command]
pub fn load_objects(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Object> {
    let mut connection = get_connection(connection);
    Object::load(&mut connection).expect("Failed to load objects")
}

#[tauri::command]
pub fn new_object() -> Object {
    Object::new()
}

#[tauri::command]
pub fn save_object(
    data: Object,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Object::save(data, &mut connection).expect("Failed to save object")
}

#[tauri::command]
pub fn delete_object(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Object::delete(id, &mut connection).expect("Failed to delete object")
}
