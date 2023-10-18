#[allow(dead_code)]

pub mod story {
    use crate::classes::world::world::World;
    use serde::{Deserialize, Serialize};
    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Story {
        story: Acts,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Acts {
        acts: Vec<Act>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Act {
        id: u32,
        name: String,
        title: String,
        content: Content,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Content {
        maps: Vec<Option<World>>,
    }

    impl Story {
        pub fn load_default() -> Result<Story, Box<dyn std::error::Error>> {
            let file_name = String::from("../datas/storyline.json");
            let json_content = std::fs::read_to_string(file_name)?;
            let default_data: Story = serde_json::from_str(&json_content)?;
            Ok(default_data)
        }

        pub fn save(self) -> Result<(), Box<dyn std::error::Error>> {
            let json = serde_json::to_string_pretty(&self)?;
            let mut file_path = std::path::PathBuf::new();
            file_path.push("../datas/storyline.json");
            std::fs::write(&file_path, json)?;
            Ok(())
        }
    }
}
