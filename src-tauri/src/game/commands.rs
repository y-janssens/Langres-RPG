use diesel::{r2d2::ConnectionManager, SqliteConnection};

use super::models::Game;
use crate::backend::{
    database::{authenticated_command, get_connection},
    permissions::models::Permission,
    response::Response,
    utils::errors::ValidationError,
};

#[tauri::command]
pub fn new_game(
    name: Option<String>,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        let _name = name.unwrap_or("name".into());
        Ok(Game::new(_name, &mut connection)?)
    })
}

#[tauri::command]
pub fn load_games(connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        Ok(Game::fetch(&mut connection)?)
    })
}

#[tauri::command]
pub fn load_game(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        Ok(Game::load(id, &mut connection)?)
    })
}

#[tauri::command]
pub fn delete_game(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        Ok(Game::delete(id, &mut connection)?)
    })
}

#[tauri::command]
pub fn save_game(
    mut data: Game,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        Ok(data.save(&mut connection)?)
    })
}
