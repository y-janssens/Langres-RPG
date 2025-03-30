use super::{
    errors::ValidationError,
    models::{Dice, FrustumCullingUtility},
};
use crate::{
    backend::{
        database::authenticated_command, permissions::models::Permission, response::Response,
    },
    world::models::Item,
};

#[tauri::command]
pub fn throw_dice(value: u32, cap: u32) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || Ok(Dice::launch(value, cap)))
}

#[tauri::command]
pub fn frustum_cull_ids(
    value: i32,
    size: u32,
    horizontal: usize,
    vertical: usize,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        Ok(FrustumCullingUtility::cull(
            value, size, horizontal, vertical,
        ))
    })
}

#[tauri::command]
pub fn frustum_cull_filter(
    value: i32,
    size: u32,
    horizontal: usize,
    vertical: usize,
    content: Vec<Item>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        Ok(FrustumCullingUtility::cull_filter(
            value, size, horizontal, vertical, content,
        ))
    })
}

#[tauri::command]
pub fn get_neighbours(size: u32, area: u32, tile_id: u32) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        Ok(FrustumCullingUtility::cull(
            tile_id as i32,
            size,
            area as usize,
            area as usize,
        ))
    })
}
