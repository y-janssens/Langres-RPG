use crate::backend::permissions::models::{Credentials, Permission};

use super::settings::errors::{MIGRATION_ERROR, POOL_ERROR};
use super::settings::variables::{DATABASE_URL, MIGRATIONS};

use diesel::{r2d2::ConnectionManager, sqlite::Sqlite, SqliteConnection};
use diesel_migrations::MigrationHarness;
use r2d2::{Pool, PooledConnection};
use serde::Serialize;
use serde_json::json;
use std::error::Error;

pub fn get_connection(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> PooledConnection<ConnectionManager<diesel::SqliteConnection>> {
    connection.get().expect("Failed to get DB connection")
}

fn run_migrations(
    connection: &mut impl MigrationHarness<Sqlite>,
) -> Result<(), Box<dyn Error + Send + Sync + 'static>> {
    connection.run_pending_migrations(MIGRATIONS)?;

    Ok(())
}

pub fn initialize_db() -> Result<Pool<ConnectionManager<SqliteConnection>>, Box<dyn Error>> {
    let database_url = DATABASE_URL;
    let manager = ConnectionManager::<SqliteConnection>::new(database_url);
    let pool = Pool::builder().build(manager).expect(POOL_ERROR);

    let mut conn = pool.get()?;
    run_migrations(&mut *conn).expect(MIGRATION_ERROR);

    Ok(pool)
}

pub fn authenticated_command<T, R>(permissions: Permission, func: T) -> serde_json::Value
where
    T: FnOnce() -> R,
    R: Serialize,
{
    let credentials = Credentials::initialize().config;

    if credentials.has_permission(permissions) {
        match serde_json::to_value(func()) {
            Ok(result) => result,
            Err(_) => json!({
                "error": "Failed to serialize the result"
            }),
        }
    } else {
        json!({
            "error": "Permission denied"
        })
    }
}
