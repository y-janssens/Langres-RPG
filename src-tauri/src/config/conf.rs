#[cfg(test)]
pub mod test_conf {
    use crate::settings::errors::messages::{
        DATABASE_ERROR, FLUSH_DATABASE_ERROR, MIGRATION_ERROR, POOL_ERROR,
    };
    use crate::settings::variables::MIGRATIONS;
    use diesel::{r2d2::ConnectionManager, sqlite::Sqlite, SqliteConnection};
    use diesel_migrations::MigrationHarness;

    use r2d2::{Pool, PooledConnection};
    use std::panic::{self, AssertUnwindSafe};
    use std::{error::Error, fs};
    use uuid::Uuid;

    /// Wrapper to allow unit tests to access local database
    pub fn allow_db_access<T>(unit_test: T)
    where
        T: FnOnce(&mut SqliteConnection) + panic::UnwindSafe,
    {
        let unique_test_db = format!("test_db_{}.db", Uuid::new_v4());
        let mut connection = get_local_connection(unique_test_db.clone());

        let result = panic::catch_unwind(AssertUnwindSafe(|| {
            unit_test(&mut connection);
        }));

        flush_local_db(unique_test_db).expect(FLUSH_DATABASE_ERROR);

        if let Err(e) = result {
            panic::resume_unwind(e);
        }
    }

    fn get_local_connection(
        unique_test_db: String,
    ) -> PooledConnection<ConnectionManager<diesel::SqliteConnection>> {
        let pool = initialize_local_db(unique_test_db).expect(DATABASE_ERROR);
        pool.get().unwrap()
    }

    fn initialize_local_db(
        unique_test_db: String,
    ) -> Result<Pool<ConnectionManager<SqliteConnection>>, Box<dyn Error>> {
        let manager = ConnectionManager::<SqliteConnection>::new(unique_test_db);
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
        unique_test_db: String,
    ) -> Result<(), Box<dyn Error + Send + Sync + 'static>> {
        fs::remove_file(unique_test_db)?;

        Ok(())
    }
}
