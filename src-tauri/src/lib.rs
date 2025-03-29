#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use backend::database::initialize_db;
use backend::settings::database::DATABASE_ERROR;
use backend::settings::errors::RUNTIME_ERROR;
use dotenv::dotenv;
use std::env;

pub mod achievements;
pub mod admin;
pub mod application;
pub mod backend;
pub mod character;
pub mod collection;
pub mod events;
pub mod functions;
pub mod game;
pub mod loot;
pub mod maps;
pub mod npcs;
pub mod objects;
pub mod player;
pub mod quests;
pub mod schema;
pub mod statistics;
pub mod storyline;
pub mod time;
pub mod world;

pub fn run() {
    dotenv().ok();
    let pool = initialize_db().expect(DATABASE_ERROR);

    tauri::Builder::default()
        .plugin(tauri_plugin_global_shortcut::Builder::new().build())
        .plugin(tauri_plugin_os::init())
        .plugin(tauri_plugin_notification::init())
        .plugin(tauri_plugin_clipboard_manager::init())
        .plugin(tauri_plugin_fs::init())
        .plugin(tauri_plugin_shell::init())
        .plugin(tauri_plugin_http::init())
        .plugin(tauri_plugin_dialog::init())
        .plugin(tauri_plugin_process::init())
        .invoke_handler(tauri::generate_handler![
            // Achievements commands
            achievements::commands::new_achievement,
            achievements::commands::load_achievements,
            achievements::commands::save_achievement,
            achievements::commands::delete_achievement,
            // Admin Dashboard
            admin::dashboard::commands::load_admin_dashboard,
            // Application settings
            time::commands::load_env,
            application::commands::load_app_datas,
            application::commands::save_app_datas,
            application::commands::load_main_menu,
            application::commands::load_ingame_menu,
            admin::devtools::commands::load_dev_settings,
            // Permissions
            backend::permissions::commands::load_permissions,
            // Character commands
            character::commands::compute_xp,
            character::commands::add_gold,
            character::commands::remove_gold,
            character::commands::add_objects,
            character::commands::remove_object,
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
            maps::commands::generate_map_content,
            maps::commands::load_generator_options,
            // Loot commands
            loot::commands::new_loot,
            loot::commands::load_loots,
            loot::commands::save_loot,
            loot::commands::delete_loot,
            loot::table::commands::generate_loot_table,
            // Objects commands
            objects::commands::new_object,
            objects::commands::load_objects,
            objects::commands::save_object,
            objects::commands::delete_object,
            // Player achievements commands
            player::achievements::commands::load_player_achievements,
            player::achievements::commands::load_player_achievement,
            player::achievements::commands::save_player_achievement,
            player::achievements::commands::activate_player_achievement,
            // Player journal commands
            player::journal::commands::load_player_journal,
            // Player quests commands
            player::quests::commands::load_player_quests,
            player::quests::commands::load_player_quest,
            player::quests::commands::save_player_quest,
            player::quests::commands::activate_player_quest,
            player::quests::commands::validate_player_quest,
            player::quests::commands::edit_player_quest,
            // Player statistics commands
            player::statistics::commands::load_player_statistics,
            player::statistics::commands::load_player_statistic,
            player::statistics::commands::save_player_statistic,
            // Storyline commands
            storyline::commands::save_storyline,
            storyline::commands::load_storyline,
            storyline::commands::edit_tiles,
            storyline::commands::register_gateway,
            storyline::commands::register_checkpoint,
            storyline::commands::register_object,
            storyline::commands::get_neighbours_ids,
            // Statistics commands
            statistics::commands::new_statistic,
            statistics::commands::load_statistics,
            statistics::commands::save_statistic,
            statistics::commands::delete_statistic,
            // Utils
            backend::utils::commands::throw_dice,
            backend::utils::commands::frustum_cull_ids,
            backend::utils::commands::get_neighbours,
            backend::utils::commands::frustum_cull_filter,
            // World building commands
            world::commands::clear,
            world::commands::generate,
            world::commands::regenerate,
            world::commands::generate_forest,
            world::commands::compute_map_directions,
        ])
        .manage(pool)
        .run(tauri::generate_context!())
        .expect(RUNTIME_ERROR);
}
