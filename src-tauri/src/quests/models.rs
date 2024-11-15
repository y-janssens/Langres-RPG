use crate::settings::factory::factory_models::AbstractModel;

use crate::translations::models::Translations;
use diesel::{deserialize::Queryable, sql_types::Text, sqlite::Sqlite};
use serde::{Deserialize, Serialize};

use super::definitions::get_all;

impl AbstractModel for Quest {}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, Queryable)]
pub struct Status {
    pub owned: bool,
    pub completed: bool,
    pub failed: bool,
    pub abandoned: bool,
}

impl Status {
    pub fn base() -> Status {
        Status {
            owned: true,
            completed: false,
            failed: false,
            abandoned: false,
        }
    }

    pub fn default() -> Status {
        Status {
            owned: false,
            completed: false,
            failed: false,
            abandoned: false,
        }
    }
}

impl Queryable<Text, Sqlite> for Status {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

#[derive(Debug, Serialize, Deserialize, PartialEq, Clone)]
pub struct Quest {
    pub id: String,
    pub name: Translations,
    pub description: Translations,
    pub primary: bool,
    pub status: Status,
    pub visible: bool,
    pub reward: i32,
    pub next: Option<String>,
}

impl Quest {
    pub fn load() -> Vec<Quest> {
        get_all()
    }
}
