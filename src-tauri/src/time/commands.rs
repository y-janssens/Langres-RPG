use super::models::env::Environment;

#[tauri::command]
pub fn load_env(date: &str) -> Environment {
    Environment::initialize(date)
}
