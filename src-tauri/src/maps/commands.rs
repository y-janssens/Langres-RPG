use super::options::GeneratorOptions;
use crate::{
    backend::{
        database::authenticated_command, permissions::models::Permission, response::Response,
        utils::errors::ValidationError,
    },
    world::models::{Options, World},
};

#[tauri::command]
pub fn generate_map_content(map: World, options: Options) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, || {
        World::generate_content(map, Some(options))
    })
}

#[tauri::command]
pub fn load_generator_options() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, GeneratorOptions::load)
}
