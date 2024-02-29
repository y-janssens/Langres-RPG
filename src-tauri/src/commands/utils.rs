use crate::{
    functions,
    models::utils::game_utils::{Dice, FrustumCullingUtility},
};

#[tauri::command]
pub fn throw_dice(value: u32, cap: u32) -> Dice {
    let throw = functions::utils::throw_dice(value, cap);
    throw.unwrap()
}

#[tauri::command]
pub fn filter_tiles(value: i32, size: u32, horizontal: usize, vertical: usize) -> Vec<i32> {
    FrustumCullingUtility::cull(value, size, horizontal, vertical)
}
