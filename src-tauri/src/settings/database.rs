use super::errors::messages::{MIGRATION_ERROR, POOL_ERROR};
use super::variables::vars::{DATABASE_URL, MIGRATIONS};

use diesel::{r2d2::ConnectionManager, sqlite::Sqlite, SqliteConnection};
use diesel_migrations::MigrationHarness;
use r2d2::Pool;
use std::error::Error;

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
