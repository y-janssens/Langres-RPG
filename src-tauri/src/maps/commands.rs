use super::options::GeneratorOptions;
use crate::world::models::{Options, World};

#[tauri::command]
pub fn generate_map_content(map: World, options: Options) -> World {
    World::generate_content(map, Some(options))
}

#[tauri::command]
pub fn load_generator_options() -> GeneratorOptions<'static> {
    GeneratorOptions::load()
}
