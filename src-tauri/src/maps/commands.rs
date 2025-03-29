use super::options::GeneratorOptions;
use crate::{
    backend::{
        database::{authenticated_command, authenticated_thread},
        permissions::models::Permission,
        response::Response,
        utils::errors::ValidationError,
    },
    world::models::{Options, World},
};

#[tauri::command]
pub async fn generate_map_content(
    mut map: World,
    options: Options,
) -> Result<Response, ValidationError> {
    authenticated_thread(Permission::Editor, || map.generate_content(Some(options))).await
}

#[tauri::command]
pub fn load_generator_options() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, GeneratorOptions::load)
}
