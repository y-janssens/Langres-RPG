use std::io::{Error, ErrorKind::InvalidData};

use core_macros::settings_initial_datas;
use diesel::SqliteConnection;
use serde_yaml::{Sequence, Value};

use crate::application::models::{ApplicationSettings, Languages, Values};
use crate::backend::utils::parse::{get_boolean_value, get_numeric_value, get_sequence, get_string_value};

impl ApplicationSettings {
    pub fn from_value(content: Value) -> Result<Self, Error> {
        let story = Self {
            id: get_numeric_value(&content, "id") as i32,
            language: get_string_value(&content, "language"),
            languages: Languages::parse(get_sequence(&content, "languages")?)?,
            sound: get_boolean_value(&content, "sound"),
            volume: get_numeric_value(&content, "volume") as i32,
            music: get_numeric_value(&content, "music") as i32,
            difficulty: get_numeric_value(&content, "difficulty") as i32,
            battle_realtime: get_boolean_value(&content, "battle_realtime"),
            battle_automatic: get_boolean_value(&content, "battle_automatic"),
        };
        Ok(story)
    }

    pub fn get_and_insert_initial_datas(connection: &mut SqliteConnection) -> Result<(), Error> {
        let settings: Self = settings_initial_datas!().map_err(|e| std::io::Error::new(InvalidData, e.to_string()))?;

        settings
            .save(connection)
            .map_err(|e| std::io::Error::new(InvalidData, e.to_string()))
    }
}

impl Languages {
    pub fn parse(content: &Sequence) -> Result<Self, Error> {
        let languages = content
            .iter()
            .map(|c| Values {
                key: get_string_value(c, "key"),
                value: get_string_value(c, "value"),
            })
            .collect::<Vec<Values>>();

        Ok(Self(languages))
    }
}
