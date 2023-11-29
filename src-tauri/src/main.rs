#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use std::error::Error;

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
mod functions;
mod models;
mod schema;

fn run_migrations(
    connection: &mut impl MigrationHarness<Sqlite>,
) -> Result<(), Box<dyn Error + Send + Sync + 'static>> {
    // This will run the necessary migrations.
    //
    // See the documentation for `MigrationHarness` for
    // all available methods.
    connection.run_pending_migrations(MIGRATIONS)?;

    Ok(())
}

fn initialize_db() -> Result<Pool<ConnectionManager<SqliteConnection>>, Box<dyn Error>> {
    let database_url = "langres.db";
    let manager = ConnectionManager::<SqliteConnection>::new(database_url);
    let pool = Pool::builder()
        .build(manager)
        .expect("Failed to create pool.");

    // Get a connection from the pool
    let mut conn = pool.get()?;

    // Run migrations
    run_migrations(&mut *conn).expect("Error while migrating...");

    Ok(pool)
}

fn main() {
    env::set_var("RUST_BACKTRACE", "1");
    let pool = initialize_db().expect("Failed to initialize database");

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
            commands::app::load_app_datas,     // Ok
            commands::app::save_app_datas,     // Ok
            commands::objects::load_objects,   // Ok
            commands::objects::load_functions, // Ok
        ])
        .manage(pool)
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
