use crate::config::fetcher::get_connection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::Quest;

#[tauri::command]
pub fn load_quests(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Quest> {
    let mut connection = get_connection(connection);
    Quest::load(&mut connection).expect("Failed to load quests")
}

#[tauri::command]
pub fn new_quest() -> Quest {
    Quest::new()
}

#[tauri::command]
pub fn save_quest(
    data: Quest,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Quest::save(data, &mut connection).expect("Failed to save quest")
}

#[tauri::command]
pub fn delete_quest(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Quest::delete(id, &mut connection).expect("Failed to delete quest")
}
