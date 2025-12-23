use std::io::{Error, ErrorKind::InvalidData};

use diesel::SqliteConnection;
use serde_yaml::{Sequence, Value};
use system_macros::quests_initial_datas;

use crate::backend::translations::models::Translations;
use crate::backend::utils::parse::{get_boolean_value, get_mapping, get_numeric_value, get_optional_string_value, get_string_value};
use crate::quests::models::{Quest, Status};

impl Quest {
    pub fn from_value(content: Sequence) -> Result<Vec<Self>, Error> {
        content.into_iter().map(Self::parse).collect()
    }

    fn parse(content: Value) -> Result<Self, Error> {
        Ok(Self {
            id: get_string_value(&content, "id"),
            name: Translations::from_value(get_mapping(&content, "name")?)?,
            description: Translations::from_value(get_mapping(&content, "description")?)?,
            primary: get_boolean_value(&content, "primary"),
            status: Status::from_value(get_mapping(&content, "status")?)?,
            visible: get_boolean_value(&content, "visible"),
            reward: get_numeric_value(&content, "reward") as i32,
            next: get_optional_string_value(&content, "next"),
        })
    }

    pub fn get_and_insert_initial_datas(connection: &mut SqliteConnection) -> Result<(), Error> {
        let quests: Vec<Self> = quests_initial_datas!().map_err(|e| Error::new(InvalidData, e.to_string()))?;

        for quest in quests {
            quest.save(connection).map_err(|e| Error::new(InvalidData, e.to_string()))?;
        }

        Ok(())
    }
}
