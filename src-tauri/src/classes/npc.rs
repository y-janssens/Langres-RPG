#[allow(dead_code)]

pub mod npc {
    use serde::{Deserialize, Serialize};
    use std::fs;

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Npcs {
        npc: Vec<Option<Npc>>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Npc {
        id: u32,
        character_name: String,
        content: Vec<Item>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    struct Item {
        id: u32,
        quotes: Vec<String>,
        interactions: Interactions,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    struct Interactions {
        questions: Vec<Option<Questions>>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    struct Questions {
        id: u32,
        question: String,
        answer: String,
    }

    impl Npcs {
        pub fn get(name: String) -> Result<Npc, Box<dyn std::error::Error>> {
            let file_name = format!("../npcs/{}.json", { &name });
            let json_content = std::fs::read_to_string(file_name)?;
            let npc: Npc = serde_json::from_str(&json_content)?;
            Ok(npc)
        }

        pub fn load() -> Result<Option<Vec<Npc>>, Box<dyn std::error::Error>> {
            let paths = fs::read_dir("../npcs")?;
            let mut npcs: Vec<Npc> = Vec::new();

            for path in paths {
                let name = path?.file_name();
                let name_str = name.to_string_lossy();
                let npc_name = match name_str.find('.') {
                    Some(index) => &name_str[0..index],
                    None => &name_str,
                };
                let npc: Npc = Self::get(String::from(npc_name))?;
                npcs.push(npc);
            }
            Ok(Some(npcs))
        }
    }
}
