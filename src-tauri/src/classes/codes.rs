#[allow(dead_code)]

pub mod codes {
    use serde::{Deserialize, Serialize};
    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Codes {
        codes: Vec<Code>,
    }
    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Code {
        key: String,
    }

    impl Codes {
        pub fn load() -> Result<Codes, Box<dyn std::error::Error>> {
            let file_name = String::from("../datas/codes.json");
            let json_content = std::fs::read_to_string(file_name)?;
            let saved_codes: Codes = serde_json::from_str(&json_content)?;
            Ok(saved_codes)
        }
    }
}
