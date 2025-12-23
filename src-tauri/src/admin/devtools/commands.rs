use crate::backend::{
    database::authenticated_command, permissions::models::Permission, response::Response, utils::errors::ValidationError,
};

use super::models::DevSettings;

#[tauri::command]
pub fn load_dev_settings() -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || Ok(DevSettings::get()))
}
