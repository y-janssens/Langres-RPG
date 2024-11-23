use super::models::{ApplicationMenu, ApplicationSettings};
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use crate::backend::database::{authenticated_command, get_connection};
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;

#[tauri::command]
pub fn load_app_datas(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::RegularUser, || {
        ApplicationSettings::load(&mut connection).expect("Failed to load app datas")
    })
}

#[tauri::command]
pub fn load_main_menu(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::RegularUser, || {
        ApplicationMenu::load_main_menu(&mut connection)
    })
}

#[tauri::command]
pub fn load_ingame_menu() -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        ApplicationMenu::load_ingame_menu()
    })
}

#[tauri::command]
pub fn save_app_datas(
    id: i32,
    data: ApplicationSettings,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::RegularUser, || {
        ApplicationSettings::save(id, data, &mut connection).expect("Failed to save app datas");
    })
}
