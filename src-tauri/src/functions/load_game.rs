use crate::classes::game::game::Game;
use std::fs;

// pub fn load_game() -> Result<Game, Box<dyn std::error::Error>> {
//     let load = Game::load(1529443370)?;
//     Ok(load)
// }

pub fn load_saved_games() -> Result<Vec<Game>, Box<dyn std::error::Error>> {
    let paths = fs::read_dir("./saved")?;
    let mut json_contents = Vec::new();

    for path in paths {
        let name = path?.path();
        let json_content = std::fs::read_to_string(&name)?;
        let saved_game: Game = serde_json::from_str(&json_content)?;
        // println!("{:?}", saved_game);
        json_contents.push(saved_game);
    }
    Ok(json_contents)
}
