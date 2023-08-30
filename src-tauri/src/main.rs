#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]
use std::env;

mod functions {
    pub mod load_game;
    pub mod new_game;
    pub mod save_game;
}

mod classes {
    pub mod character;
    pub mod game;
    pub mod inventory;
}

#[tauri::command]
fn load_saves() -> Vec<classes::game::game::Game> {
    let _load = functions::load_game::load_saved_games();
    _load.unwrap()
}

#[tauri::command]
fn new(name: String) -> classes::game::game::Game {
    let _new = functions::new_game::new_game(name);
    _new.unwrap()
}

#[tauri::command]
fn delete(id: u32) {
    let _delete = functions::load_game::delete_saved_game(id);
}

#[tauri::command]
fn save(data: classes::game::game::Game) {
    let _save = functions::save_game::save_game(data);
}

fn main() {
    // env::set_var("RUST_BACKTRACE", "1");
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![load_saves, new, delete, save])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
