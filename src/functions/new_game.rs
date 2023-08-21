use crate::classes::game::game::Game;

pub fn new_game(name: String) -> Result<Game, Box<dyn std::error::Error>> {
    let mut start = Game::new();
    start.initiate(String::from(name));
    let _ = start.save();
    Ok(start)
}
