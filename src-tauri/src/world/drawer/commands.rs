use crate::{
    backend::{database::authenticated_command, permissions::models::Permission, response::Response, utils::errors::ValidationError},
    world::{
        drawer::{models::Drawer, types::Brush},
        models::World,
    },
};

#[tauri::command]
pub fn load_drawer_brushes() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, || Ok(Brush::get_brushes()))
}

#[tauri::command]
pub fn draw_map_content(
    map: World,
    tiles: Vec<u32>,
    brush: &str,
    overwrite: bool,
    density: Option<u8>,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, || {
        let content = Drawer::execute(map, tiles, brush, overwrite, density)?;
        Ok(content)
    })
}
