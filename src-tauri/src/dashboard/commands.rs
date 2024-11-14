use super::models::AdminDashboard;
use crate::{permissions::models::Permission, views::models::authenticated_command};
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
