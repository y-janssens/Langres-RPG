use crate::backend::database::{authenticated_command, get_connection};
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::PlayerAchievement;

#[tauri::command]
pub fn load_player_achievements(
    game_id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        PlayerAchievement::load(game_id, &mut connection).expect("Failed to load achievements")
    })
}

#[tauri::command]
pub fn load_player_achievement(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        PlayerAchievement::get(id, &mut connection).expect("Failed to load achievements")
    })
}

#[tauri::command]
pub fn save_player_achievement(
    data: PlayerAchievement,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        PlayerAchievement::save(data, &mut connection).expect("Failed to save achievement")
    })
}

#[tauri::command]
pub fn activate_player_achievement(
    data: PlayerAchievement,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        PlayerAchievement::activate(data, &mut connection)
    })
}
