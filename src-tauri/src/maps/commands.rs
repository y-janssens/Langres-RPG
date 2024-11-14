use serde_json::Value;

use super::options::GeneratorOptions;
use crate::{
    permissions::models::Permission,
    views::models::authenticated_command,
    world::models::{Options, World},
};

#[tauri::command]
pub fn generate_map_content(map: World, options: Options) -> Value {
    authenticated_command(Permission::Editor, || {
        World::generate_content(map, Some(options))
    })
}

#[tauri::command]
pub fn load_generator_options() -> Value {
    authenticated_command(Permission::Editor, GeneratorOptions::load)
}
