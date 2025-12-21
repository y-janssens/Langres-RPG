use std::error::Error;

use diesel::{r2d2::ConnectionManager, sqlite::Sqlite, SqliteConnection};
use diesel_migrations::MigrationHarness;
use r2d2::{Pool, PooledConnection};
use serde::Serialize;

use super::response::Response;
use super::settings::database::*;
use super::settings::errors::{PERMISSION_DENIED, POOL_ERROR, VALIDATION_ERROR};
use super::utils::errors::ValidationError;

use crate::backend::permissions::models::{Credentials, Permission};

use crate::functions::models::Function;
use crate::loot::models::Loot;
use crate::objects::models::Object;
use crate::quests::models::Quest;
use crate::storyline::models::Story;

pub fn get_connection(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> PooledConnection<ConnectionManager<diesel::SqliteConnection>> {
    connection.get().expect(DATABASE_CONNECTION_ERROR)
}

pub fn get_local_connection(
    db_path: String,
) -> Result<PooledConnection<ConnectionManager<SqliteConnection>>, r2d2::Error> {
    let manager = ConnectionManager::<SqliteConnection>::new(db_path);
    let pool = Pool::builder().build(manager).expect(POOL_ERROR);

    let mut connection = pool.get()?;
    connection
        .run_pending_migrations(MIGRATIONS_PATH)
        .expect(MIGRATION_ERROR);
    post_migrate(&mut connection).expect(INITIAL_DATAS_ERROR);
    Ok(connection)
}

fn post_migrate(connection: &mut SqliteConnection) -> Result<(), std::io::Error> {
    Story::get_and_insert_initial_datas(connection)?;
    Object::get_and_insert_initial_datas(connection)?;
    Function::get_and_insert_initial_datas(connection)?;
    Loot::get_and_insert_initial_datas(connection)?;
    Quest::get_and_insert_initial_datas(connection)?;

    Ok(())
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
    post_migrate(&mut conn).expect(INITIAL_DATAS_ERROR);

    Ok(pool)
}

pub fn authenticated_command<T, R>(
    permissions: Permission,
    func: T,
) -> Result<Response, ValidationError>
where
    T: FnOnce() -> Result<R, Box<dyn Error>>,
    R: Serialize,
{
    let credentials = Credentials::initialize()
        .map_err(|e| ValidationError(e.to_string()))?
        .config;

    if credentials.has_permission(permissions) {
        match func() {
            Ok(result) => match serde_json::to_value(result) {
                Ok(result) => Ok(Response::success(result)),
                Err(_) => Err(Response::error(VALIDATION_ERROR)),
            },
            Err(e) => Err(Response::error(&e.to_string())),
        }
    } else {
        Err(Response::error(PERMISSION_DENIED))
    }
}

pub async fn authenticated_thread<T, Fut, R>(
    permissions: Permission,
    func: T,
) -> Result<Response, ValidationError>
where
    T: FnOnce() -> Fut,
    Fut: std::future::Future<Output = Result<R, Box<dyn Error>>>,
    R: Serialize,
{
    let credentials = Credentials::initialize()
        .map_err(|e| ValidationError(e.to_string()))?
        .config;

    if credentials.has_permission(permissions) {
        match func().await {
            Ok(result) => match serde_json::to_value(result) {
                Ok(result) => Ok(Response::success(result)),
                Err(_) => Err(Response::error(VALIDATION_ERROR)),
            },
            Err(e) => Err(Response::error(&e.to_string())),
        }
    } else {
        Err(Response::error(PERMISSION_DENIED))
    }
}
