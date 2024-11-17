use crate::backend::database::{authenticated_command, get_connection};
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use super::models::PlayerStatistic;

#[tauri::command]
pub fn load_player_statistics(
    game_id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        PlayerStatistic::load(game_id, &mut connection).expect("Failed to load statistics")
    })
}

#[tauri::command]
pub fn load_player_statistic(
    id: String,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        PlayerStatistic::get(id, &mut connection).expect("Failed to load statistics")
    })
}

#[tauri::command]
pub fn save_player_statistic(
    data: PlayerStatistic,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        PlayerStatistic::save(data, &mut connection).expect("Failed to save statistic")
    })
}
