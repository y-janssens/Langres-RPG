use crate::{classes, functions};

#[tauri::command]
pub fn regenerate(data: classes::game::game::Game) {
    let _regenerate = functions::world::regenerate_world(data);
}
