#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]
use std::env;
mod functions {
    pub mod app;
    pub mod codes;
    pub mod games;
    pub mod world;
}

mod classes {
    pub mod app;
    pub mod character;
    pub mod codes;
    pub mod game;
    pub mod inventory;
    pub mod npc;
    pub mod story;
    pub mod world;
}

mod commands {
    pub mod app;
    pub mod codes;
    pub mod games;
    pub mod npcs;
    pub mod story;
    pub mod world;
}

fn main() {
    env::set_var("RUST_BACKTRACE", "1");
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![
            commands::games::new,
            commands::games::load_game,
            commands::games::load_saves,
            commands::games::save,
            commands::games::delete,
            commands::world::regenerate,
            commands::world::generate,
            commands::world::populate_trees,
            commands::npcs::get_npcs,
            commands::codes::load_codes_datas,
            commands::app::load_app_datas,
            commands::app::save_app_datas,
            commands::story::load_storyline,
            commands::story::save_storyline,
        ])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
