use crate::config::fetcher::get_connection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::Loot;

#[tauri::command]
pub fn load_loots(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Loot> {
    let mut connection = get_connection(connection);
    Loot::load(&mut connection).expect("Failed to load loots")
}

#[tauri::command]
pub fn new_loot(kind: &str) -> Loot {
    Loot::new(kind)
}

#[tauri::command]
pub fn save_loot(
    data: Loot,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Loot::save(data, &mut connection).expect("Failed to save loot")
}

#[tauri::command]
pub fn delete_loot(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Loot::delete(id, &mut connection).expect("Failed to delete loot")
}
