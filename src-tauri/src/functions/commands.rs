use diesel::{r2d2::ConnectionManager, SqliteConnection};

use crate::backend::{
    database::{authenticated_command, get_connection},
    permissions::models::Permission,
    response::Response,
    utils::errors::ValidationError,
};

use super::models::Function;

#[tauri::command]
pub fn load_functions(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Ok(Function::load(&mut connection)?)
    })
}

#[tauri::command]
pub fn new_function() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || Ok(Function::new()))
}

#[tauri::command]
pub fn save_function(
    data: Function,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Ok(data.save(&mut connection)?)
    })
}

#[tauri::command]
pub fn delete_function(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Ok(Function::delete(id, &mut connection)?)
    })
}
