use crate::{classes, functions};

#[tauri::command]
pub fn new(name: String) -> classes::game::game::Game {
    let _new = functions::games::new_game(name);
    _new.unwrap()
}

#[tauri::command]
pub fn load_saves() -> Vec<classes::game::game::Game> {
    let _load = functions::games::load_saved_games();
    _load.unwrap()
}

#[tauri::command]
pub fn load_game(id: i32) -> classes::game::game::Game {
    let _load = functions::games::load_saved_game(id);
    _load.unwrap()
}

#[tauri::command]
pub fn delete(id: i32) {
    let _delete = functions::games::delete_saved_game(id);
}

#[tauri::command]
pub fn save(data: classes::game::game::Game) {
    let _save = functions::games::save_game(data);
}
