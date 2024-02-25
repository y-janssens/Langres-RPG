use diesel::{r2d2::ConnectionManager, SqliteConnection};

use crate::{functions, models};

#[tauri::command]
pub fn new(
    name: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> models::game::games::Game {
    let _story = functions::story::fetch_storyline(connection).expect("error");
    let _new = functions::games::new_game(name, _story);
    _new.unwrap()
}

#[tauri::command]
pub fn fetch_games(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Vec<models::game::games::Game>, String> {
    functions::games::fetch_games(connection)
}

#[tauri::command]
pub fn load_game(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> models::game::games::Game {
    let _load = functions::games::load_saved_game(id, connection);
    _load.unwrap()
}

#[tauri::command]
pub fn delete(id: i32, connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>) {
    let _delete = functions::games::delete_saved_game(id, connection);
}

#[tauri::command]
pub fn save(
    data: models::game::games::Game,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let _save = functions::games::save_game(connection, data);
}

#[tauri::command]
pub fn compute_xp(
    character: models::character::characters::Character,
    xp: u32,
) -> models::character::characters::Character {
    let _compute = functions::games::compute_xp(character, xp);
    _compute.unwrap()
}
