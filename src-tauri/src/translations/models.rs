use serde::{Deserialize, Serialize};

use crate::settings::errors::messages::NOT_SUPPORTED_LANGUAGE_ERROR;

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Translations {
    pub fr: String,
    pub en: String,
}

#[allow(dead_code)]
impl Translations {
    pub fn resolve(self, owned: bool, language: &str) -> String {
        if !owned {
            return "???".into();
        }
        match language {
            "fr" => self.fr,
            "en" => self.en,
            _ => String::from(NOT_SUPPORTED_LANGUAGE_ERROR),
        }
    }
}
