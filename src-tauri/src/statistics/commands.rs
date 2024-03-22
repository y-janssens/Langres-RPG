use crate::config::fetcher::get_connection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::Statistic;

#[tauri::command]
pub fn load_statistics(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Statistic> {
    let mut connection = get_connection(connection);
    Statistic::load(&mut connection).expect("Failed to load statistics")
}

#[tauri::command]
pub fn new_statistic() -> Statistic {
    Statistic::new()
}

#[tauri::command]
pub fn save_statistic(
    data: Statistic,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Statistic::save(data, &mut connection).expect("Failed to save statistic")
}

#[tauri::command]
pub fn delete_statistic(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Statistic::delete(id, &mut connection).expect("Failed to delete statistic")
}
