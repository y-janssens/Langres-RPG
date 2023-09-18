use crate::{classes, functions};

#[tauri::command]
pub fn load_app_datas() -> classes::app::app::App {
    let _load = functions::app::load_app();
    _load.unwrap()
}

#[tauri::command]
pub fn save_app_datas(data: classes::app::app::App) {
    println!("trying to save");
    let _save = functions::app::save_app(data);
}
