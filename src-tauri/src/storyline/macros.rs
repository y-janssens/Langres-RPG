use std::io::{Error, ErrorKind::InvalidData};

use diesel::{prelude::*, result::Error as DieselError, SqliteConnection};
use serde_yaml::Value;
use system_macros::storyline_initial_datas;

use crate::backend::utils::parse::{get_numeric_value, get_sequence, get_string_value};
use crate::storyline::models::{Act, Acts, InsertableStory, Story};

impl Story {
    pub fn from_value(content: Value) -> Result<Self, Error> {
        let story = Self {
            id: get_numeric_value(&content, "id") as i32,
            name: get_string_value(&content, "name"),
            created: get_string_value(&content, "created"),
            modified: get_string_value(&content, "modified"),
            acts: Acts(Act::parse(get_sequence(&content, "acts")?)?),
        };
        Ok(story)
    }

    pub fn insert_initial_datas(
        &self,
        connection: &mut SqliteConnection,
    ) -> Result<(), DieselError> {
        let acts_json = serde_json::to_string(&self.acts)
            .map_err(|e| DieselError::DeserializationError(Box::new(e)))?;

        let insertion = InsertableStory {
            id: self.id,
            name: self.name.clone(),
            created: self.created.clone(),
            modified: self.modified.clone(),
            acts: acts_json,
        };

        diesel::insert_or_ignore_into(crate::schema::storyline::table)
            .values(&insertion)
            .execute(connection)?;

        Ok(())
    }

    pub fn get_and_insert_initial_datas(connection: &mut SqliteConnection) -> Result<(), Error> {
        let story: Self = storyline_initial_datas!()
            .map_err(|e| std::io::Error::new(InvalidData, e.to_string()))?;

        story
            .insert_initial_datas(connection)
            .map_err(|e| std::io::Error::new(InvalidData, e.to_string()))
    }
}
