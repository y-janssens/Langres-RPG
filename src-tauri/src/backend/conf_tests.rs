#[cfg(test)]
pub mod database {
    use diesel::{r2d2::ConnectionManager, result::Error, Connection, SqliteConnection};
    use diesel_migrations::MigrationHarness;
    use dotenv::dotenv;
    use r2d2::{Pool, PooledConnection};
    use std::{
        env,
        panic::{self, AssertUnwindSafe},
    };

    use crate::backend::database::post_migrate;
    use crate::backend::permissions::models::Permission;
    use crate::backend::settings::{database::*, errors::POOL_ERROR, variables::*};

    /// Initiate local database connection
    pub fn get_test_connection(db_path: String) -> Result<PooledConnection<ConnectionManager<SqliteConnection>>, r2d2::Error> {
        let manager = ConnectionManager::<SqliteConnection>::new(db_path);
        let pool = Pool::builder().build(manager).expect(POOL_ERROR);

        let mut connection = pool.get()?;
        connection.run_pending_migrations(MIGRATIONS_PATH).expect(MIGRATION_ERROR);
        post_migrate(&mut connection).expect(INITIAL_DATAS_ERROR);
        Ok(connection)
    }

    /// Wrapper to allow unit tests to access local database and rollback transactions
    pub fn allow_db_access<T>(unit_test: T)
    where
        T: FnOnce(&mut SqliteConnection) + panic::UnwindSafe,
    {
        let db_path = TEST_DATABASE_URL.to_string();
        let mut connection = get_test_connection(db_path).expect(DATABASE_ERROR);

        let result = panic::catch_unwind(AssertUnwindSafe(|| {
            connection.test_transaction::<_, Error, _>(|conn| {
                unit_test(conn);
                Ok(())
            });
        }));

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
            Permission::Admin => env::set_var("USER_KEY", TEST_ADMIN_KEY),
            _ => env::set_var("USER_KEY", TEST_USER_KEY),
        }
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        dotenv().ok();
        unit_test();

        env::remove_var("SECRET_KEY");
        env::remove_var("USER_KEY");
    }
}
