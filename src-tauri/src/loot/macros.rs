use std::io::{Error, ErrorKind::InvalidData};

use diesel::SqliteConnection;
use serde_yaml::{Sequence, Value};
use system_macros::loot_initial_datas;

use crate::backend::translations::models::Translations;
use crate::backend::utils::parse::{get_mapping, get_optional_numeric_value, get_string_value};
use crate::loot::models::{ItemTypes, Loot};

impl Loot {
    pub fn from_value(content: Sequence) -> Result<Vec<Self>, Error> {
        content.into_iter().map(Self::parse).collect()
    }

    pub fn try_parse(content: Option<&Value>) -> Result<Option<Self>, Error> {
        match content {
            Some(c) => Ok(Some(Self::parse(c.clone())?)),
            None => Ok(None),
        }
    }

    pub fn parse(content: Value) -> Result<Self, Error> {
        Ok(Self {
            id: get_string_value(&content, "id"),
            item_type: ItemTypes::resolve(&get_string_value(&content, "item_type").to_lowercase()),
            name: Translations::from_value(get_mapping(&content, "name")?)?,
            description: Translations::from_value(get_mapping(&content, "description")?)?,
            armor: get_optional_numeric_value(&content, "armor").map(|v| v as i32),
            damage: get_optional_numeric_value(&content, "damage").map(|v| v as i32),
            random: get_optional_numeric_value(&content, "random").map(|v| v as i32),
            parade: get_optional_numeric_value(&content, "parade").map(|v| v as i32),
            price: get_optional_numeric_value(&content, "price").map(|v| v as i32),
            weight: get_optional_numeric_value(&content, "weight").map(|v| v as i32),
        })
    }

    pub fn get_and_insert_initial_datas(connection: &mut SqliteConnection) -> Result<(), Error> {
        let functions: Vec<Self> = loot_initial_datas!().map_err(|e| Error::new(InvalidData, e.to_string()))?;

        for function in functions {
            function.save(connection).map_err(|e| Error::new(InvalidData, e.to_string()))?;
        }

        Ok(())
    }
}
