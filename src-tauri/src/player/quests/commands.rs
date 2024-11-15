use crate::backend::database::get_connection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::PlayerQuest;

#[tauri::command]
pub fn load_player_quests(
    game_id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<PlayerQuest> {
    let mut connection = get_connection(connection);
    PlayerQuest::load(game_id, &mut connection).expect("Failed to load quests")
}

#[tauri::command]
pub fn load_player_quest(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> PlayerQuest {
    let mut connection = get_connection(connection);
    PlayerQuest::get(id, &mut connection).expect("Failed to load quests")
}

#[tauri::command]
pub fn save_player_quest(
    data: PlayerQuest,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    PlayerQuest::save(data, &mut connection).expect("Failed to save quest")
}

#[tauri::command]
pub fn activate_player_quest(
    data: PlayerQuest,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    PlayerQuest::activate(data, &mut connection)
}

#[tauri::command]
pub fn validate_player_quest(
    data: PlayerQuest,
    xp: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    PlayerQuest::validate(data, xp, &mut connection)
}

#[tauri::command]
pub fn edit_player_quest(
    data: PlayerQuest,
    status: &str,
    value: bool,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    PlayerQuest::edit(data, status, value, &mut connection)
}
