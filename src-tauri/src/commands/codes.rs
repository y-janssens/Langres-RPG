use crate::{classes, functions};

#[tauri::command]
pub fn load_codes_datas() -> classes::codes::codes::Codes {
    let _load = functions::codes::load_codes();
    _load.unwrap()
}
