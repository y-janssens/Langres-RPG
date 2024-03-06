use serde_json::{json, Value};
use std::env;

use crate::models::admin::dashboard::admin_dashboard::AdminDashboard;

#[tauri::command]
pub fn load_admin_dashboard() -> Value {
    match env::var("ADMIN_DASHBOARD_ENABLED") {
        Ok(dashboard_enabled_str) => {
            let dashboard_enabled: Result<bool, _> = dashboard_enabled_str.parse();
            match dashboard_enabled {
                Ok(true) => AdminDashboard::get().unwrap_or_else(|err| {
                    json!({
                        "error": format!("Failed to load admin dashboard: {}", err)
                    })
                }),
                Ok(false) | Err(_) => json!({
                    "error": "Admin dashboard is disabled or configuration is invalid."
                }),
            }
        }
        Err(_) => json!({
            "error": "Environment variable is not set."
        }),
    }
}
