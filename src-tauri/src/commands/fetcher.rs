use diesel::{r2d2::ConnectionManager, SqliteConnection};
use r2d2::PooledConnection;

pub fn get_connection(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> PooledConnection<ConnectionManager<diesel::SqliteConnection>> {
    connection.get().expect("Failed to get DB connection")
}
