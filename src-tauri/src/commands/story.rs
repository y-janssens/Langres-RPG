use crate::{functions, models::story::storyline::Story};
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

#[tauri::command]
pub fn fetch_storyline(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Story, String> {
    functions::story::fetch_storyline(connection)
}

#[tauri::command]
pub fn save_storyline(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    data: Story,
    id: u32,
) {
    let _save = functions::story::save_storyline(connection, data, id);
}
