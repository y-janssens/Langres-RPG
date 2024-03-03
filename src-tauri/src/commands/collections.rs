use crate::models::collection::collections::Collection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::fetcher::get_connection;

#[tauri::command]
pub fn load_collections(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Collection> {
    let mut connection = get_connection(connection);
    Collection::load(&mut connection).expect("Failed to load collections")
}

#[tauri::command]
pub fn save_collections(
    id: Option<i32>,
    data: Collection,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    if id.is_some() {
        Collection::patch(id.unwrap(), data, &mut connection).expect("Failed to save collections");
    } else {
        Collection::save(data.map, &mut connection).expect("Failed to save collections");
    }
}
