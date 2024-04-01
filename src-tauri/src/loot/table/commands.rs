use crate::config::fetcher::get_connection;
use crate::loot::models::Loot;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::TableLoot;

#[tauri::command]
pub fn generate_loot_table(
    name: Option<String>,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Loot> {
    let mut connection = get_connection(connection);
    TableLoot::generate(name, &mut connection)
}
