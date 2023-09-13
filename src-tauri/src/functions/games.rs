#[allow(dead_code)]
use crate::classes::game::game::Game;
use std::fs;

pub fn new_game(name: String) -> Result<Game, Box<dyn std::error::Error>> {
    let mut start = Game::new();
    start.initiate(String::from(name));
    Ok(start)
}

pub fn load_saved_games() -> Result<Vec<Game>, Box<dyn std::error::Error>> {
    let paths = fs::read_dir("../datas/saved")?;
    let mut json_contents = Vec::new();

    for path in paths {
        let name = path?.path();
        let json_content = std::fs::read_to_string(&name)?;
        let saved_game: Game = serde_json::from_str(&json_content)?;
        json_contents.push(saved_game);
    }
    Ok(json_contents)
}

pub fn load_saved_game(id: i32) -> Result<Game, Box<dyn std::error::Error>> {
    let load = Game::load(id)?;
    Ok(load)
}

pub fn delete_saved_game(id: i32) -> std::io::Result<()> {
    let mut file_path = std::path::PathBuf::new();
    file_path.push("../datas/saved");
    file_path.push(format!("{}.json", id));
    fs::remove_file(file_path)?;
    Ok(())
}

pub fn save_game(data: Game) -> Result<(), Box<dyn std::error::Error>> {
    let mut _data = data;
    _data.save()?;
    Ok(())
}
