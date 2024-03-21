use crate::config::fetcher::get_connection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::Achievement;

#[tauri::command]
pub fn load_achievements(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Achievement> {
    let mut connection = get_connection(connection);
    Achievement::load(&mut connection).expect("Failed to load achievements")
}

#[tauri::command]
pub fn new_achievement() -> Achievement {
    Achievement::new()
}

#[tauri::command]
pub fn save_achievement(
    data: Achievement,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Achievement::save(data, &mut connection).expect("Failed to save achievement")
}

#[tauri::command]
pub fn delete_achievement(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Achievement::delete(id, &mut connection).expect("Failed to delete achievement")
}
