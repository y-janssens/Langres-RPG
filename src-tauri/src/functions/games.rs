#[allow(dead_code)]
use crate::models::character::character::Character;
use crate::models::game::game::Game;
use crate::models::story::story::Story;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

pub fn fetch_games(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Vec<Game>, String> {
    let mut connection = connection.get().map_err(|e| e.to_string())?;
    match Game::fetch(&mut connection) {
        Ok(games) => Ok(games),
        Err(err) => Err(err.to_string()),
    }
}

pub fn new_game(name: String, story: Story) -> Result<Game, Box<dyn std::error::Error>> {
    let start = Game::new(name, story);
    Ok(start)
}

pub fn load_saved_game(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Game, String> {
    let mut connection = connection.get().map_err(|e| e.to_string())?;
    match Game::load(id, &mut connection) {
        Ok(story) => Ok(story),
        Err(err) => Err(err.to_string()),
    }
}

pub fn delete_saved_game(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<(), String> {
    let mut connection = connection.get().map_err(|e| e.to_string())?;
    match Game::delete(id, &mut connection) {
        Ok(()) => Ok(()),
        Err(err) => Err(err.to_string()),
    }
}

pub fn save_game(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    data: Game,
) -> Result<(), String> {
    let mut connection = connection.get().map_err(|e| e.to_string())?;
    let _save = Game::save(data, &mut connection).expect("Error");
    Ok(_save)
}

pub fn compute_xp(
    mut character: Character,
    xp: u32,
) -> Result<Character, Box<dyn std::error::Error>> {
    character.compute_xp(xp);
    Ok(character)
}
