mod functions {
    pub mod new_game;
}

mod classes {
    pub mod game;
}

fn main() {
    let start = functions::new_game::new_game(String::from("Adam de Corveil"));
    match start {
        Ok(game) => game.log(),
        Err(err) => {
            println!("Error loading game: {:?}", err);
        }
    }
}
