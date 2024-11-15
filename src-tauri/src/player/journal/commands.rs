use crate::backend::database::get_connection;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::PlayerJournal;

#[tauri::command]
pub fn load_player_journal(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> PlayerJournal {
    let mut connection = get_connection(connection);
    PlayerJournal::load(id, &mut connection).expect("Failed to load journal")
}
