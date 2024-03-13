#[cfg(test)]
pub mod test_conf {
    use crate::settings::errors::messages::{
        DATABASE_ERROR, FLUSH_DATABASE_ERROR, MIGRATION_ERROR, POOL_ERROR,
    };
    use crate::settings::variables::{MIGRATIONS, TEST_DATABASE_URL};
    use diesel::{r2d2::ConnectionManager, sqlite::Sqlite, SqliteConnection};
    use diesel_migrations::MigrationHarness;
    use r2d2::{Pool, PooledConnection};
    use std::{error::Error, fs};

    /// Wrapper to allow unit tests to access local database
    pub fn allow_db_access<T>(unit_test: T)
    where
        T: FnOnce(&mut SqliteConnection),
    {
        let mut connection = get_local_connection();
        // Run unit test
        unit_test(&mut connection);
        flush_local_db(&mut connection).expect(FLUSH_DATABASE_ERROR);
    }

    fn get_local_connection() -> PooledConnection<ConnectionManager<diesel::SqliteConnection>> {
        let pool = initialize_local_db().expect(DATABASE_ERROR);
        pool.get().unwrap()
    }

    fn initialize_local_db() -> Result<Pool<ConnectionManager<SqliteConnection>>, Box<dyn Error>> {
        let manager = ConnectionManager::<SqliteConnection>::new(TEST_DATABASE_URL);
        let pool = Pool::builder().build(manager).expect(POOL_ERROR);

        let mut connection = pool.get()?;
        run_local_migrations(&mut connection).expect(MIGRATION_ERROR);

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
