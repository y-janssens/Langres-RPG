use serde::{Deserialize, Serialize};

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct Translations {
    pub fr: Option<String>,
    pub en: Option<String>,
}

impl Translations {
    pub fn default() -> Translations {
        Translations {
            fr: Some("".to_string()),
            en: Some("".to_string()),
        }
    }

    pub fn blank() -> Translations {
        Translations { fr: None, en: None }
    }

    pub fn generate(_fr: &str, _en: &str) -> Translations {
        Translations {
            fr: Some(_fr.to_string()),
            en: Some(_en.to_string()),
        }
    }
}
