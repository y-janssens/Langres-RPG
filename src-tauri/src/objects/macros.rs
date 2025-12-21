use std::io::{Error, ErrorKind::InvalidData};

use diesel::{prelude::*, result::Error as DieselError, SqliteConnection};
use serde_yaml::{Mapping, Sequence, Value};
use system_macros::objects_initial_datas;

use crate::backend::utils::parse::{
    get_boolean_value, get_mapping, get_numeric_value, get_optional_string_value, get_string_value,
    get_value,
};
use crate::objects::models::{Area, InsertableObject, Object};

impl Object {
    pub fn from_value(content: Sequence) -> Result<Vec<Self>, Error> {
        content.into_iter().map(Self::parse).collect()
    }

    fn parse(content: Value) -> Result<Self, Error> {
        Ok(Self {
            id: get_numeric_value(&content, "id") as i32,
            name: get_string_value(&content, "name"),
            value: get_optional_string_value(&content, "value"),
            display_value: get_optional_string_value(&content, "display_value"),
            display_color: get_optional_string_value(&content, "display_color"),
            area: Area::parse(get_mapping(&content, "area")?)?,
            walkable: get_boolean_value(&content, "walkable"),
            interactive: get_boolean_value(&content, "interactive"),
        })
    }

    pub fn insert_initial_datas(
        &self,
        connection: &mut SqliteConnection,
    ) -> Result<(), DieselError> {
        let area = serde_json::to_string(&self.area)
            .map_err(|e| DieselError::DeserializationError(Box::new(e)))?;

        let insertion = InsertableObject {
            area,
            walkable: self.walkable,
            name: self.name.clone(),
            value: self.value.clone(),
            interactive: self.interactive,
            display_value: self.display_value.clone(),
            display_color: self.display_color.clone(),
        };

        diesel::insert_or_ignore_into(crate::schema::objects::table)
            .values(&insertion)
            .execute(connection)?;

        Ok(())
    }

    pub fn get_and_insert_initial_datas(connection: &mut SqliteConnection) -> Result<(), Error> {
        let objects: Vec<Self> = objects_initial_datas!()
            .map_err(|e| std::io::Error::new(InvalidData, e.to_string()))?;

        for object in objects {
            object
                .insert_initial_datas(connection)
                .map_err(|e| std::io::Error::new(InvalidData, e.to_string()))?;
        }

        Ok(())
    }
}

impl Area {
    pub fn parse(starting_point: &Mapping) -> Result<Self, Error> {
        let area = Self {
            x: get_value(starting_point, "x")? as i32,
            y: get_value(starting_point, "y")? as i32,
        };
        Ok(area)
    }
}
