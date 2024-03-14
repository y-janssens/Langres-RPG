use super::models::Game;
use crate::config::fetcher::get_connection;
use diesel::{r2d2::ConnectionManager, SqliteConnection};

#[tauri::command]
pub fn new_game(
    name: Option<String>,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Game {
    let mut connection = get_connection(connection);
    let _name = name.unwrap_or("name".into());
    Game::new(_name, &mut connection)
}

#[tauri::command]
pub fn load_games(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Game> {
    let mut connection = get_connection(connection);
    Game::fetch(&mut connection).expect("Failed to load games")
}

#[tauri::command]
pub fn load_game(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Game {
    let mut connection = get_connection(connection);
    Game::load(id, &mut connection).expect("Failed to load game")
}

#[tauri::command]
pub fn delete_game(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Game::delete(id, &mut connection).expect("Failed to delete game")
}

#[tauri::command]
pub fn save_game(
    data: Game,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);
    Game::save(data, &mut connection).expect("Failed to save game")
}
