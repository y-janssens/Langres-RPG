use crate::classes::game::game::Game;
#[allow(dead_code)]

pub fn regenerate_world(data: Game) -> Result<(), Box<dyn std::error::Error>> {
    let mut _data = data;
    _data.regenerate_world()?;
    Ok(())
}
