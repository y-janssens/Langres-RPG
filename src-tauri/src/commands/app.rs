use crate::models::time::time::Environment;
use crate::{functions, models};
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

#[tauri::command]
pub fn load_app_datas(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> models::app::app::App {
    let _load = functions::app::load_app(connection);
    _load.unwrap()
}

#[tauri::command]
pub fn save_app_datas(
    id: i32,
    data: models::app::app::App,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) {
    let _save = functions::app::save_app(id, data, connection);
}

#[tauri::command]
pub fn load_env(date: &str) -> Environment {
    println!("{}", date);
    let _env = functions::app::load_env(date);
    _env.unwrap()
}
