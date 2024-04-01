use crate::loot::models::Loot;

use super::models::{Character, Inventory};

#[tauri::command]
pub fn compute_xp(mut character: Character, xp: u32) -> Character {
    Character::compute_xp(&mut character, xp).clone()
}

#[tauri::command]
pub fn add_gold(mut inventory: Inventory, loot: Loot) {
    Inventory::add_gold(&mut inventory, loot);
}

#[tauri::command]
pub fn remove_gold(mut inventory: Inventory, gold: i32) {
    Inventory::remove_gold(&mut inventory, gold);
}

#[tauri::command]
pub fn add_objects(mut inventory: Inventory, loot: Vec<Loot>) {
    Inventory::add_objects(&mut inventory, loot);
}

#[tauri::command]
pub fn remove_object(mut inventory: Inventory, id: String) {
    Inventory::remove_object(&mut inventory, id);
}
