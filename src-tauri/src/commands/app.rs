use crate::models::app::application::App;
use crate::models::time::env::Environment;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::fetcher::get_connection;

#[tauri::command]
pub fn load_app_datas(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> App {
    let mut connection = get_connection(connection);
    App::load(&mut connection).expect("Failed to load app datas")
}

#[tauri::command]
pub fn save_app_datas(
    id: i32,
    data: App,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let mut connection = get_connection(connection);

    App::save(id, data, &mut connection).expect("Failed to save app datas");
}

#[tauri::command]
pub fn load_env(date: &str) -> Environment {
    Environment::initialize(date)
}
