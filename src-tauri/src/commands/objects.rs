use crate::models::objects::assets::Function;
use crate::models::objects::assets::Object;
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
pub fn load_functions(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Function> {
    let mut connection = get_connection(connection);
    Function::load(&mut connection).expect("Failed to load functions")
}
