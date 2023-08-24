use crate::classes::game::game::Game;
#[allow(dead_code)]

pub fn save_game(data: Game) -> Result<(), Box<dyn std::error::Error>> {
    let mut _data = data;
    _data.save()?;
    Ok(())
}
