use crate::models::functions::functions_assets::Function;
use crate::models::objects::objects_assets::Object;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::fetcher::get_connection;

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

#[tauri::command]
pub fn load_functions(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Function> {
    let mut connection = get_connection(connection);
    Function::load(&mut connection).expect("Failed to load functions")
}

#[tauri::command]
pub fn new_function() -> Function {
    Function::new()
}

#[tauri::command]
pub fn save_function(
    data: Function,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Function::save(data, &mut connection).expect("Failed to save function")
}

#[tauri::command]
pub fn delete_function(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Function::delete(id, &mut connection).expect("Failed to delete function")
}
