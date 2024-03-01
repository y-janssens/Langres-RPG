use super::fetcher::get_connection;
use crate::models::{character::characters::Character, game::games::Game, story::storyline::Story};
use diesel::{r2d2::ConnectionManager, SqliteConnection};

#[tauri::command]
pub fn new(
    name: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Game {
    let mut connection = get_connection(connection);
    let story = Story::load(&mut connection).expect("Failed to load storyline");
    Game::new(name, story)
}

#[tauri::command]
pub fn fetch_games(
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
pub fn delete(id: i32, connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>) {
    let mut connection = get_connection(connection);
    Game::delete(id, &mut connection).expect("Failed to delete game")
}

#[tauri::command]
pub fn save(data: Game, connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>) {
    let mut connection = get_connection(connection);
    Game::save(data, &mut connection).expect("Failed to save game")
}

#[tauri::command]
pub fn compute_xp(mut character: Character, xp: u32) -> Character {
    Character::compute_xp(&mut character, xp).clone()
}
