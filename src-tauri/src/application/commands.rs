use super::models::ApplicationSettings;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use crate::backend::database::get_connection;

#[tauri::command]
pub fn load_app_datas(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> ApplicationSettings {
    let mut connection = get_connection(connection);
    ApplicationSettings::load(&mut connection).expect("Failed to load app datas")
}

#[tauri::command]
pub fn save_app_datas(
    id: i32,
    data: ApplicationSettings,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);

    ApplicationSettings::save(id, data, &mut connection).expect("Failed to save app datas");
}
