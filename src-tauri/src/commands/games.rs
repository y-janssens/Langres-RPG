use diesel::{r2d2::ConnectionManager, SqliteConnection};

use crate::{functions, models};

#[tauri::command]
pub fn new(
    name: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> models::game::game::Game {
    let _story = functions::story::fetch_storyline(connection).expect("error");
    let _new = functions::games::new_game(name, _story);
    _new.unwrap()
}

#[tauri::command]
pub fn fetch_games(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Vec<models::game::game::Game>, String> {
    let _load = functions::games::fetch_games(connection);
    _load
}

#[tauri::command]
pub fn load_game(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> models::game::game::Game {
    let _load = functions::games::load_saved_game(id, connection);
    _load.unwrap()
}

#[tauri::command]
pub fn delete(id: i32, connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>) {
    let _delete = functions::games::delete_saved_game(id, connection);
}

#[tauri::command]
pub fn save(
    data: models::game::game::Game,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let _save = functions::games::save_game(connection, data);
}

#[tauri::command]
pub fn compute_xp(
    character: models::character::character::Character,
    xp: u32,
) -> models::character::character::Character {
    let _compute = functions::games::compute_xp(character, xp);
    _compute.unwrap()
}
