use crate::backend::{
    database::authenticated_command, permissions::models::Permission, response::Response,
    utils::errors::ValidationError,
};

use super::models::env::Environment;

#[tauri::command]
pub fn load_env(date: &str) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || Environment::initialize(date))
}
