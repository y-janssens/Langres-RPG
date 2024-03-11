use crate::config::fetcher::get_connection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::Collection;

#[tauri::command]
pub fn load_collections(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Collection> {
    let mut connection = get_connection(connection);
    Collection::load(&mut connection).expect("Failed to load collections")
}

#[tauri::command]
pub fn new_collection() -> Collection {
    Collection::new()
}

#[tauri::command]
pub fn save_collection(
    data: Collection,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Collection::save(data, &mut connection).expect("Failed to save collection");
}

#[tauri::command]
pub fn delete_collection(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Collection::delete(id, &mut connection).expect("Failed to delete collection")
}
