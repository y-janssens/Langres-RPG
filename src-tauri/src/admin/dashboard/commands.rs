use super::models::AdminDashboard;
use crate::backend::{
    database::authenticated_command, permissions::models::Permission, response::Response,
    utils::errors::ValidationError,
};

#[tauri::command]
pub fn load_admin_dashboard() -> Result<Response, ValidationError> {
    authenticated_command(Permission::Dashboard, || {
        AdminDashboard::get().expect("Failed to load admin dashboard")
    })
}
