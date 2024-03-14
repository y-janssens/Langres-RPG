#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use dotenv::dotenv;
use settings::database::initialize_db;
use settings::errors::messages::{DATABASE_ERROR, RUNTIME_ERROR};
use std::env;

mod app;
mod character;
mod collection;
mod config;
mod dashboard;
mod functions;
mod game;
mod maps;
mod objects;
mod schema;
mod settings;
mod storyline;
mod time;
mod utils;
mod world;

fn main() {
    dotenv().ok();
    let pool = initialize_db().expect(DATABASE_ERROR);

    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![
            // Admin Dashboard
            dashboard::commands::load_admin_dashboard,
            // Application settings
            time::commands::load_env,
            app::commands::load_app_datas,
            app::commands::save_app_datas,
            // Permissions
            config::commands::load_permissions,
            // Character commands
            character::commands::compute_xp,
            // Collections
            collection::commands::new_collection,
            collection::commands::load_collections,
            collection::commands::save_collection,
            collection::commands::delete_collection,
            // Functions commands
            functions::commands::new_function,
            functions::commands::load_functions,
            functions::commands::save_function,
            functions::commands::delete_function,
            // Game commands
            game::commands::new_game,
            game::commands::load_game,
            game::commands::load_games,
            game::commands::save_game,
            game::commands::delete_game,
            // Map generator commands
            maps::commands::generate_maps_batch,
            // Objects commands
            objects::commands::new_object,
            objects::commands::load_objects,
            objects::commands::save_object,
            objects::commands::delete_object,
            // Storyline commands
            storyline::commands::save_storyline,
            storyline::commands::load_storylines,
            // Utils
            utils::commands::throw_dice,
            utils::commands::frustum_cull_ids,
            utils::commands::frustum_cull_filter,
            // World building commands
            world::commands::generate,
            world::commands::regenerate,
            world::commands::generate_forest,
        ])
        .manage(pool)
        .run(tauri::generate_context!())
        .expect(RUNTIME_ERROR);
}
