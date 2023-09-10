use crate::classes::npc::npc::Npc;
use crate::classes::npc::npc::Npcs;

#[tauri::command]
pub fn get_npcs() -> Option<Vec<Npc>> {
    let npcs = Npcs::load();
    npcs.unwrap()
}
