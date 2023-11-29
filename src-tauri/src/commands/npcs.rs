use crate::models::npc::npc::Npc;
use crate::models::npc::npc::Npcs;

#[tauri::command]
pub fn get_npcs() -> Option<Vec<Npc>> {
    let npcs = Npcs::load();
    npcs.unwrap()
}
