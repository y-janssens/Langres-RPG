use super::models::Story;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use crate::config::fetcher::get_connection;

#[tauri::command]
pub fn fetch_storyline(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Story {
    let mut connection = get_connection(connection);
    Story::load(&mut connection).expect("Failed to load storyline")
}

#[tauri::command]
pub fn save_storyline(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    mut data: Story,
    id: u32,
) {
    let mut connection = get_connection(connection);
    Story::save(&mut connection, id as i32, &mut data).expect("Failed to save storyline");
}
