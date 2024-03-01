use crate::models::{
    utils::game_utils::{Dice, FrustumCullingUtility},
    world::maps::Item,
};

#[tauri::command]
pub fn throw_dice(value: u32, cap: u32) -> Dice {
    Dice::launch(value, cap)
}

#[tauri::command]
pub fn frustum_cull_ids(value: i32, size: u32, horizontal: usize, vertical: usize) -> Vec<i32> {
    FrustumCullingUtility::cull(value, size, horizontal, vertical)
}

#[tauri::command]
pub fn frustum_cull_filter(
    value: i32,
    size: u32,
    horizontal: usize,
    vertical: usize,
    content: Vec<Item>,
) -> Vec<Item> {
    FrustumCullingUtility::cull_filter(value, size, horizontal, vertical, content)
}
