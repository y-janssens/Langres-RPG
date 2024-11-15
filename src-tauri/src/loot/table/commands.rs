use crate::backend::database::get_connection;
use crate::backend::permissions::models::Permission;
use crate::backend::database::authenticated_command;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;
use serde_json::Value;

use super::models::TableLoot;

#[tauri::command]
pub fn generate_loot_table(
    name: Option<String>,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        TableLoot::generate(name, &mut connection)
    })
}
