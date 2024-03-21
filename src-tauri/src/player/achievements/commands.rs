use crate::config::fetcher::get_connection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::PlayerAchievement;

#[tauri::command]
pub fn load_player_achievements(
    game_id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<PlayerAchievement> {
    let mut connection = get_connection(connection);
    PlayerAchievement::load(game_id, &mut connection).expect("Failed to load achievements")
}

#[tauri::command]
pub fn load_player_achievement(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> PlayerAchievement {
    let mut connection = get_connection(connection);
    PlayerAchievement::get(id, &mut connection).expect("Failed to load achievements")
}

#[tauri::command]
pub fn save_player_achievement(
    data: PlayerAchievement,
    game_id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    PlayerAchievement::save(data, game_id, &mut connection).expect("Failed to save achievement")
}

#[tauri::command]
pub fn activate_player_achievement(
    data: PlayerAchievement,
    game_id: i32,
    language: &str,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    PlayerAchievement::activate(data, game_id, language, &mut connection)
}
