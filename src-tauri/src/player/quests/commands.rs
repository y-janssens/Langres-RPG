use crate::backend::database::{authenticated_command, get_connection};
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::PlayerQuest;

#[tauri::command]
pub fn load_player_quests(
    game_id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        Ok(PlayerQuest::load(game_id, &mut connection)?)
    })
}

#[tauri::command]
pub fn load_player_quest(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        Ok(PlayerQuest::get(id, &mut connection)?)
    })
}

#[tauri::command]
pub fn save_player_quest(
    data: PlayerQuest,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        Ok(data.save(&mut connection)?)
    })
}

#[tauri::command]
pub fn activate_player_quest(
    data: PlayerQuest,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        PlayerQuest::activate(data, &mut connection);
        Ok(())
    })
}

#[tauri::command]
pub fn validate_player_quest(
    mut data: PlayerQuest,
    xp: i32,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        PlayerQuest::validate(&mut data, xp, &mut connection)?;
        Ok(())
    })
}

#[tauri::command]
pub fn edit_player_quest(
    data: PlayerQuest,
    status: &str,
    value: bool,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        PlayerQuest::edit(data, status, value, &mut connection)?;
        Ok(())
    })
}
