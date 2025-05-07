use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use crate::backend::{
    database::{authenticated_command, get_connection},
    permissions::models::Permission,
    response::Response,
    utils::errors::ValidationError,
};

use super::models::Quest;

#[tauri::command]
pub fn load_quests(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || Ok(Quest::load(&mut connection)?))
}

#[tauri::command]
pub fn new_quest() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || Ok(Quest::new()))
}

#[tauri::command]
pub fn save_quest(
    data: Quest,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || Ok(data.save(&mut connection)?))
}

#[tauri::command]
pub fn delete_quest(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || {
        Ok(Quest::delete(id, &mut connection)?)
    })
}
