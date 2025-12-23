use super::models::Story;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

use crate::backend::database::authenticated_command;
use crate::backend::database::get_connection;
use crate::backend::permissions::models::Permission;
use crate::backend::response::Response;
use crate::backend::utils::errors::ValidationError;

#[tauri::command]
pub fn load_storyline(connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        Ok(Story::load(&mut connection)?)
    })
}

#[tauri::command]
pub fn save_storyline(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    mut story: Story,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        story.save(&mut connection)?;
        Ok(())
    })
}

#[tauri::command]
pub fn edit_tiles(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tiles: Vec<u32>,
    object_id: i32,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::edit_tiles(&mut connection, act_id, map_id, tiles, object_id)?;
        Ok(())
    })
}

#[tauri::command]
pub fn reset_tiles(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tiles: Vec<u32>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::reset_tiles(&mut connection, act_id, map_id, tiles)?;
        Ok(())
    })
}

#[tauri::command]
pub fn delete_tiles_npcs(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tiles: Vec<u32>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::delete_tiles_npcs(&mut connection, act_id, map_id, tiles)?;
        Ok(())
    })
}

#[tauri::command]
pub fn compute_tiles_directions(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tiles: Vec<u32>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::compute_tiles_directions(&mut connection, act_id, map_id, tiles)?;
        Ok(())
    })
}

#[tauri::command]
pub fn register_gateway(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tile_id: u32,
    gateway: (Option<i32>, bool),
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::register_gateway(&mut connection, act_id, map_id, tile_id, gateway)?;
        Ok(())
    })
}

#[tauri::command]
pub fn register_checkpoint(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tile_id: u32,
    checkpoint: Option<i32>,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::register_checkpoint(&mut connection, act_id, map_id, tile_id, checkpoint)?;
        Ok(())
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
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::Editor, || {
        Story::register_object(&mut connection, act_id, map_id, tile_id, object_id, enable)?;
        Ok(())
    })
}

#[tauri::command]
pub fn get_neighbours_ids(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    act_id: i32,
    map_id: i32,
    tile_id: u32,
    object_id: i32,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let mut connection = get_connection(connection);
        let ids = Story::get_neighbours_ids(&mut connection, act_id, map_id, tile_id, object_id)?;
        Ok(ids)
    })
}
