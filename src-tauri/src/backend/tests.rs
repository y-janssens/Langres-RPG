#[cfg(test)]
pub mod database {
    use crate::backend::permissions::models::Permission;
    use crate::backend::settings::database::{
        DATABASE_ERROR, FLUSH_DATABASE_ERROR, MIGRATION_ERROR,
    };
    use crate::backend::settings::errors::POOL_ERROR;
    use crate::backend::settings::variables::{
        MIGRATIONS_PATH, TEST_ADMIN_KEY, TEST_SECRET_KEY, TEST_USER_KEY,
    };
    use diesel::{r2d2::ConnectionManager, sqlite::Sqlite, SqliteConnection};
    use diesel_migrations::MigrationHarness;

    use dotenv::dotenv;
    use r2d2::{Pool, PooledConnection};
    use std::env;
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

    /// Wrapper to abtract permissions handling and environment variables initialization and cleanup
    pub fn with_permissions<T>(permission: Permission, unit_test: T)
    where
        T: FnOnce(),
    {
        match permission {
            Permission::Admin => {
                env::set_var("USER_KEY", TEST_ADMIN_KEY);
            }
            Permission::RegularUser
            | Permission::Dashboard
            | Permission::DevSettings
            | Permission::DevTools
            | Permission::Editor => {
                env::set_var("USER_KEY", TEST_USER_KEY);
            }
        }
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        dotenv().ok();
        unit_test();

        env::remove_var("SECRET_KEY");
        env::remove_var("USER_KEY");
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
        connection.run_pending_migrations(MIGRATIONS_PATH)?;

        Ok(())
    }

    fn flush_local_db(
        unique_test_db: String,
    ) -> Result<(), Box<dyn Error + Send + Sync + 'static>> {
        fs::remove_file(unique_test_db)?;

        Ok(())
    }
}
