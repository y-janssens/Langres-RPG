use crate::{
    backend::{
        database::authenticated_command, permissions::models::Permission, response::Response,
        utils::errors::ValidationError,
    },
    world::models::World,
};

#[tauri::command]
pub fn generate_map_analysis(map: World) -> Result<Response, ValidationError> {
    authenticated_command(Permission::Editor, || Ok(map.generate_report()?))
}
