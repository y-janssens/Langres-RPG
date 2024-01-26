use crate::{functions, models::world::maps::Item};

#[tauri::command]
pub fn generate_maps_batch(kind: String) -> Vec<Item> {
    let batch = functions::maps::generate_map_batch(kind);
    batch.unwrap()
}
