#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]
use std::env;
use tauri::{utils::config::AppUrl, WindowUrl};

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
    let port = portpicker::pick_unused_port().expect("failed to find unused port");

    let mut context = tauri::generate_context!();
    let url = format!("http://localhost:{}", port).parse().unwrap();
    let window_url = WindowUrl::External(url);
    context.config_mut().build.dist_dir = AppUrl::Url(window_url.clone());

    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![load_saves, new, delete, save])
        .run(context)
        .expect("error while running tauri application");
}
