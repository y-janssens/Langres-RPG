use crate::backend::{
    database::authenticated_command, permissions::models::Credentials, response::Response,
    utils::errors::ValidationError,
};

use super::models::Permission;

#[tauri::command]
pub fn load_permissions() -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let credentials = Credentials::initialize()
            .unwrap_or(Credentials::get_default())
            .config;
        Ok(credentials)
    })
}
