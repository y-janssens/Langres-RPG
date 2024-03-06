#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use std::error::Error;
use dotenv::dotenv;

use diesel_migrations::{embed_migrations, EmbeddedMigrations, MigrationHarness};
pub const MIGRATIONS: EmbeddedMigrations = embed_migrations!("./migrations/");

use crate::r2d2::Pool;
use diesel::{
    r2d2::{self, ConnectionManager},
    sqlite::Sqlite,
    SqliteConnection,
};
use std::env;

mod commands;
mod models;
mod schema;
mod tests;
mod utils;

fn run_migrations(
    connection: &mut impl MigrationHarness<Sqlite>,
) -> Result<(), Box<dyn Error + Send + Sync + 'static>> {
    connection.run_pending_migrations(MIGRATIONS)?;

    Ok(())
}

fn initialize_db() -> Result<Pool<ConnectionManager<SqliteConnection>>, Box<dyn Error>> {
    let database_url = "langres.db";
    let manager = ConnectionManager::<SqliteConnection>::new(database_url);
    let pool = Pool::builder()
        .build(manager)
        .expect("Failed to create pool.");

    let mut conn = pool.get()?;
    run_migrations(&mut *conn).expect("Error while migrating...");

    Ok(pool)
}

fn main() {
    dotenv().ok();
    env::set_var("RUST_BACKTRACE", "1");
    let pool = initialize_db().expect("Failed to initialize database");

    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![
            // Game commands
            commands::games::new,
            commands::games::load_game,
            commands::games::fetch_games,
            commands::games::save,
            commands::games::delete,
            commands::games::compute_xp,
            // World building commands
            commands::world::generate,
            commands::world::regenerate,
            commands::world::generate_forest,
            // Storyline commands
            commands::story::save_storyline,
            commands::story::fetch_storyline,
            // App settings commands
            commands::app::load_env,
            commands::app::load_app_datas,
            commands::app::save_app_datas,
            commands::objects::load_objects,
            commands::objects::load_functions,
            // Map generator commands
            commands::maps::generate_maps_batch,
            // Collections
            commands::collections::load_collections,
            commands::collections::save_collections,
            // Utils
            commands::utils::throw_dice,
            commands::utils::frustum_cull_ids,
            commands::utils::frustum_cull_filter,
            // Dashboard
            commands::dashboard::load_admin_dashboard
        ])
        .manage(pool)
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
