use crate::backend::permissions::models::{Credentials, Permission};

use super::response::Response;
use super::settings::database::{
    APPLICATION_PATH_ERROR, DATABASE_CONNECTION_ERROR, DATABASE_PATH_ERROR, MIGRATION_ERROR,
};
use super::settings::errors::{PERMISSION_DENIED, POOL_ERROR, VALIDATION_ERROR};
use super::settings::variables::{DATABASE_URL, MIGRATIONS_PATH};
use super::utils::errors::ValidationError;

use diesel::{r2d2::ConnectionManager, sqlite::Sqlite, SqliteConnection};
use diesel_migrations::MigrationHarness;
use r2d2::{Pool, PooledConnection};
use serde::Serialize;
use std::error::Error;

pub fn get_connection(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> PooledConnection<ConnectionManager<diesel::SqliteConnection>> {
    connection.get().expect(DATABASE_CONNECTION_ERROR)
}

fn run_migrations(
    connection: &mut impl MigrationHarness<Sqlite>,
) -> Result<(), Box<dyn Error + Send + Sync + 'static>> {
    connection.run_pending_migrations(MIGRATIONS_PATH)?;

    Ok(())
}

fn get_db_path() -> String {
    let current_path = std::env::current_exe().expect(APPLICATION_PATH_ERROR);

    current_path
        .parent()
        .expect(DATABASE_PATH_ERROR)
        .join(DATABASE_URL)
        .to_string_lossy()
        .to_string()
}

pub fn initialize_db() -> Result<Pool<ConnectionManager<SqliteConnection>>, Box<dyn Error>> {
    let database_url = get_db_path();
    let manager = ConnectionManager::<SqliteConnection>::new(database_url);
    let pool = Pool::builder().build(manager).expect(POOL_ERROR);

    let mut conn = pool.get()?;
    run_migrations(&mut *conn).expect(MIGRATION_ERROR);

    Ok(pool)
}

pub fn authenticated_command<T, R>(
    permissions: Permission,
    func: T,
) -> Result<Response, ValidationError>
where
    T: FnOnce() -> R,
    R: Serialize,
{
    let credentials = Credentials::initialize().config;

    if credentials.has_permission(permissions) {
        match serde_json::to_value(func()) {
            Ok(result) => Ok(Response::success(result)),
            Err(_) => Err(Response::error(VALIDATION_ERROR)),
        }
    } else {
        Err(Response::error(PERMISSION_DENIED))
    }
}
