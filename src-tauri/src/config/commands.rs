use serde_json::{json, Value};
use std::env;

#[tauri::command]
pub fn load_permissions() -> Value {
    let is_admin = env::var("ADMIN_USER")
        .ok()
        .and_then(|val| val.parse().ok())
        .unwrap_or(false);

    json!({"is_admin": is_admin})
}
