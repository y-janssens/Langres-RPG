use super::models::Object;
use crate::backend::database::authenticated_command;
use crate::backend::database::get_connection;
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;

use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

#[tauri::command]
pub fn load_objects(connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || Ok(Object::load(&mut connection)?))
}

#[tauri::command]
pub fn new_object() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || Ok(Object::new()))
}

#[tauri::command]
pub fn save_object(
    data: Object,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || Ok(data.save(&mut connection)?))
}

#[tauri::command]
pub fn delete_object(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Dashboard, || Ok(Object::delete(id, &mut connection)?))
}
