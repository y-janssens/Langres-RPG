use crate::{classes, functions};

#[tauri::command]
pub fn load_objects() -> classes::objects::objects::Objects {
    let _load = functions::objects::load_objects();
    _load.unwrap()
}
