use crate::{
    backend::{database::authenticated_command, permissions::models::Permission, response::Response, utils::errors::ValidationError},
    world::drawer::types::Brush,
};

#[tauri::command]
pub fn load_drawer_brushes() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, || Ok(Brush::get_brushes()))
}
