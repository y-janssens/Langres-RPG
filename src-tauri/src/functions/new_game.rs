#[allow(dead_code)]
use crate::classes::game::game::Game;

pub fn new_game(name: String) -> Result<String, Box<dyn std::error::Error>> {
    let mut start = Game::new();
    start.initiate(String::from(name));
    let proper_json = serde_json::to_string(&start)?;
    Ok(proper_json)
}
