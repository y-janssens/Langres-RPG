use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use crate::backend::database::authenticated_command;
use crate::backend::database::get_connection;
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;
use crate::collection::models::Collection;

#[tauri::command]
pub fn load_collections(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Collection::load(&mut connection).expect("Failed to load collections")
    })
}

#[tauri::command]
pub fn new_collection() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, Collection::new)
}

#[tauri::command]
pub fn save_collection(
    data: Collection,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Collection::save(data, &mut connection).expect("Failed to save collection")
    })
}

#[tauri::command]
pub fn delete_collection(
    id: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || {
        let mut connection = get_connection(connection);
        Collection::delete(id, &mut connection).expect("Failed to delete collection")
    })
}
