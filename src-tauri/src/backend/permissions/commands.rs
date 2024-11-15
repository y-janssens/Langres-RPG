use crate::backend::permissions::models::{Config, Credentials};

#[tauri::command]
pub fn load_permissions() -> Config {
    Credentials::initialize().config
}
