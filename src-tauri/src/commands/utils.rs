use crate::{functions, models::utils::utils::Dice};

#[tauri::command]
pub fn throw_dice(value: u32, cap: u32) -> Dice {
    let throw = functions::utils::throw_dice(value, cap);
    throw.unwrap()
}
