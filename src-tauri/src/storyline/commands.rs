use super::models::Story;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;
use serde_json::Value;

use crate::backend::database::authenticated_command;
use crate::backend::database::get_connection;
use crate::backend::permissions::models::Permission;
use crate::backend::utils::errors::ValidationError;

#[tauri::command]
pub fn load_storyline(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Story {
    let mut connection = get_connection(connection);
    Story::load(&mut connection).expect("Failed to load storyline")
}

#[tauri::command]
pub fn save_storyline(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    mut data: Story,
    id: u32,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::save(&mut connection, id as i32, &mut data).expect("Failed to save storyline");
    })
}

#[tauri::command]
pub fn edit_tiles(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tiles: Vec<u32>,
    object_id: i32,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::edit_tiles(&mut connection, act_id, map_id, tiles, object_id)
    })
}

#[tauri::command]
pub fn register_gateway(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tile_id: u32,
    gateway: (Option<i32>, bool),
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::register_gateway(&mut connection, act_id, map_id, tile_id, gateway)
    })
}

#[tauri::command]
pub fn register_checkpoint(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tile_id: u32,
    checkpoint: Option<i32>,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::register_checkpoint(&mut connection, act_id, map_id, tile_id, checkpoint)
    })
}

#[tauri::command]
pub fn register_object(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tile_id: u32,
    object_id: i32,
    enable: bool,
) -> Value {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::register_object(&mut connection, act_id, map_id, tile_id, object_id, enable)
    })
}

#[tauri::command]
pub fn get_neighbours_ids(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tile_id: u32,
    object_id: i32,
) -> Result<Vec<i32>, ValidationError> {
    let mut connection = get_connection(connection);
    Ok(Story::get_neighbours_ids(
        &mut connection,
        act_id,
        map_id,
        tile_id,
        object_id,
    ))
}
