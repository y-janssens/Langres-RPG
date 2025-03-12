use serde::{Deserialize, Serialize};

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct Translations {
    pub fr: Option<String>,
    pub en: Option<String>,
}

impl Default for Translations {
    fn default() -> Self {
        Self::new()
    }
}

impl Translations {
    pub fn new() -> Self {
        Self {
            fr: Some("".to_string()),
            en: Some("".to_string()),
        }
    }

    pub fn blank() -> Self {
        Self { fr: None, en: None }
    }

    pub fn generate(_fr: &str, _en: &str) -> Self {
        Self {
            fr: Some(_fr.to_string()),
            en: Some(_en.to_string()),
        }
    }
}
