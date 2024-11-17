use super::models::AdminDashboard;
use crate::{backend::database::authenticated_command, backend::permissions::models::Permission};
use serde_json::{json, Value};

#[tauri::command]
pub fn load_admin_dashboard() -> Value {
    authenticated_command(Permission::Dashboard, || {
        AdminDashboard::get().unwrap_or_else(|err| {
            json!({
                "error": format!("Failed to load admin dashboard: {}", err)
            })
        })
    })
}
