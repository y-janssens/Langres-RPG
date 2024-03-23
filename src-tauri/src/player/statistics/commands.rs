use crate::config::fetcher::get_connection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::PlayerStatistic;

#[tauri::command]
pub fn load_player_statistics(
    game_id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<PlayerStatistic> {
    let mut connection = get_connection(connection);
    PlayerStatistic::load(game_id, &mut connection).expect("Failed to load statistics")
}

#[tauri::command]
pub fn load_player_statistic(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> PlayerStatistic {
    let mut connection = get_connection(connection);
    PlayerStatistic::get(id, &mut connection).expect("Failed to load statistics")
}

#[tauri::command]
pub fn save_player_statistic(
    data: PlayerStatistic,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    PlayerStatistic::save(data, &mut connection).expect("Failed to save statistic")
}
