// Prevents additional console window on Windows in release, DO NOT REMOVE!!
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

// use functions::load_game::load_saved_games;
// use functions::new_game::new_game;

mod functions {
    pub mod load_game;
    pub mod new_game;
}

mod classes {
    pub mod game;
}

// Learn more about Tauri commands at https://tauri.app/v1/guides/features/command
// #[tauri::command]
// fn greet(name: &str) -> String {
//     format!("Hello, {}! You've been greeted from Rust!", name)
// }

#[tauri::command]
fn load() -> std::string::String {
    let _load = functions::load_game::load_saved_games();
    format!("{:?}", _load)
}

fn main() {
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![load])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
