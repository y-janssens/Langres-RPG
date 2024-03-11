use super::models::Character;

#[tauri::command]
pub fn compute_xp(mut character: Character, xp: u32) -> Character {
    Character::compute_xp(&mut character, xp).clone()
}
