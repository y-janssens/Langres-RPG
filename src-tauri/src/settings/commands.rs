use super::models::DevSettings;

#[tauri::command]
pub fn load_dev_settings() -> DevSettings {
    DevSettings::get()
}
