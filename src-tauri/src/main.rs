#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]
use std::env;

mod functions {
    pub mod games;
    pub mod world;
}

mod classes {
    pub mod character;
    pub mod game;
    pub mod inventory;
    pub mod npc;
    pub mod world;
}

mod commands {
    pub mod games;
    pub mod npcs;
    pub mod world;
}

fn main() {
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![
            commands::games::new,
            commands::games::load_game,
            commands::games::load_saves,
            commands::games::save,
            commands::games::delete,
            commands::world::regenerate,
            commands::npcs::get_npcs,
        ])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
