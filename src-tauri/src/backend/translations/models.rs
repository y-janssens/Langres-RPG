use std::io::Error;

use diesel::{deserialize::Queryable, sql_types::Text, sqlite::Sqlite};
use serde::{Deserialize, Serialize};
use serde_yaml::Mapping;

use crate::backend::utils::parse::get_str_value;

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

impl Queryable<Text, Sqlite> for Translations {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row).map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
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

    pub fn from_value(mapping: &Mapping) -> Result<Self, Error> {
        Ok(Self {
            fr: Some(get_str_value(mapping, "fr")?),
            en: Some(get_str_value(mapping, "en")?),
        })
    }
}
