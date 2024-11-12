use crate::settings::security::{Config, Credentials};

#[tauri::command]
pub fn load_permissions() -> Config {
    Credentials::initialize().config
}
