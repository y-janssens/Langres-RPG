use crate::classes;

#[tauri::command]
pub fn load_storyline() -> classes::story::story::Story {
    let _load = classes::story::story::Story::load_default();
    _load.unwrap()
}

#[tauri::command]
pub fn save_storyline(data: classes::story::story::Story) {
    let _save = classes::story::story::Story::save(data);
}
