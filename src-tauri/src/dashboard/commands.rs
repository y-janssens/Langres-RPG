use super::models::AdminDashboard;
use crate::settings::security::Credentials;
use serde_json::{json, Value};

#[tauri::command]
pub fn load_admin_dashboard() -> Value {
    let is_admin = Credentials::initialize().config.is_admin;
    match is_admin {
        true => AdminDashboard::get().unwrap_or_else(|err| {
            json!({
                "error": format!("Failed to load admin dashboard: {}", err)
            })
        }),
        _ => json!({
            "error": "Environment variable is not set."
        }),
    }
}
