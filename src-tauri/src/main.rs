#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]
use crate::r2d2::Pool;
use diesel::{
    r2d2::{self, ConnectionManager},
    SqliteConnection,
};
// use std::env;

mod classes;
mod commands;
mod functions;
mod schema;

fn initialize_db() -> Pool<ConnectionManager<SqliteConnection>> {
    let database_url = "db.db";
    let manager = ConnectionManager::<SqliteConnection>::new(database_url);
    Pool::builder()
        .build(manager)
        .expect("Failed to create pool.")
}

fn main() {
    // env::set_var("RUST_BACKTRACE", "1");
    let pool = initialize_db();

    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![
            // Game commands
            commands::games::new,         // Ok
            commands::games::load_game,   // Ok
            commands::games::fetch_games, // Ok
            commands::games::save,        // Ok
            commands::games::delete,      // Ok
            // World building commands
            commands::world::generate,       // Ok
            commands::world::regenerate,     // Ok
            commands::world::populate_trees, // Ok
            // Storyline commands
            commands::story::save_storyline,  // Ok
            commands::story::fetch_storyline, // Ok
            // App settings commands
            commands::app::load_app_datas, // Ok
            commands::app::save_app_datas, // Ok
        ])
        .manage(pool)
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
