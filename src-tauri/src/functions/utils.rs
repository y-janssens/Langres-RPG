use crate::models::utils::utils::Dice;

pub fn throw_dice(value: u32, cap: u32) -> Result<Dice, String> {
    let dice = Dice::launch(value, cap);
    Ok(dice)
}
