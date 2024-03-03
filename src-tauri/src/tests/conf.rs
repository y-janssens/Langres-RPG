#[cfg(test)]
pub mod test_conf {
    use diesel::{r2d2::ConnectionManager, sqlite::Sqlite, SqliteConnection};
    use diesel_migrations::{embed_migrations, EmbeddedMigrations, MigrationHarness};
    use r2d2::{Pool, PooledConnection};
    use std::{error::Error, fs};

    pub const MIGRATIONS: EmbeddedMigrations = embed_migrations!("./migrations/");
    pub const TEST_DATABASE_URL: &str = "test_db.db";

    /// Wrapper to allow unit tests to access local database
    pub fn allow_db_access<T>(unit_test: T)
    where
        T: FnOnce(&mut SqliteConnection),
    {
        let mut connection = get_local_connection();
        // Run unit test
        unit_test(&mut connection);
        flush_local_db(&mut connection).expect("Failed to flush test database");
    }

    fn get_local_connection() -> PooledConnection<ConnectionManager<diesel::SqliteConnection>> {
        let pool = initialize_local_db().unwrap();
        pool.get().unwrap()
    }

    fn initialize_local_db() -> Result<Pool<ConnectionManager<SqliteConnection>>, Box<dyn Error>> {
        let manager = ConnectionManager::<SqliteConnection>::new(TEST_DATABASE_URL);
        let pool = Pool::builder()
            .build(manager)
            .expect("Failed to create pool.");

        let mut connection = pool.get()?;
        run_local_migrations(&mut connection).expect("Error while migrating...");

        Ok(pool)
    }

    fn run_local_migrations(
        connection: &mut impl MigrationHarness<Sqlite>,
    ) -> Result<(), Box<dyn Error + Send + Sync + 'static>> {
        connection.run_pending_migrations(MIGRATIONS)?;

        Ok(())
    }

    fn flush_local_db(
        connection: &mut impl MigrationHarness<Sqlite>,
    ) -> Result<(), Box<dyn Error + Send + Sync + 'static>> {
        connection.revert_all_migrations(MIGRATIONS)?;
        fs::remove_file(TEST_DATABASE_URL)?;

        Ok(())
    }
}
