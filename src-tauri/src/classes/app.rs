#[allow(dead_code)]

pub mod app {
    use serde::{Deserialize, Serialize};
    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct App {
        language: String,
        sound: bool,
        volume: u32,
        music: u32,
    }

    impl App {
        pub fn new() -> App {
            println!("Generating application datas...");
            App {
                language: String::from("en"),
                sound: true,
                volume: 100,
                music: 100,
            }
        }

        pub fn save(&mut self) -> Result<(), Box<dyn std::error::Error>> {
            let json = serde_json::to_string_pretty(&self)?;
            let mut file_path = std::path::PathBuf::new();
            file_path.push("../datas/app.json");
            std::fs::write(&file_path, json)?;
            Ok(())
        }

        pub fn load() -> Result<App, Box<dyn std::error::Error>> {
            let file_name = String::from("../datas/app.json");
            let json_content = std::fs::read_to_string(file_name)?;
            let saved_datas: App = serde_json::from_str(&json_content)?;
            Ok(saved_datas)
        }
    }
}
