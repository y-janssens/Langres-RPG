use std::io::{Error, ErrorKind::InvalidData};

use diesel::{prelude::*, result::Error as DieselError, SqliteConnection};
use serde_yaml::{Sequence, Value};
use system_macros::functions_initial_datas;

use crate::backend::utils::parse::{get_numeric_value, get_string_value};
use crate::functions::models::{Function, InsertableFunction};

impl Function {
    pub fn from_value(content: Sequence) -> Result<Vec<Self>, Error> {
        content.into_iter().map(Self::parse).collect()
    }

    fn parse(content: Value) -> Result<Self, Error> {
        Ok(Self {
            id: get_numeric_value(&content, "id") as i32,
            icon: get_string_value(&content, "icon"),
            label: get_string_value(&content, "label"),
            command: get_string_value(&content, "command"),
        })
    }

    pub fn insert_initial_datas(
        &self,
        connection: &mut SqliteConnection,
    ) -> Result<(), DieselError> {
        let insertion = InsertableFunction {
            icon: self.icon.clone(),
            label: self.label.clone(),
            command: self.command.clone(),
        };

        diesel::insert_or_ignore_into(crate::schema::functions::table)
            .values(&insertion)
            .execute(connection)?;

        Ok(())
    }

    pub fn get_and_insert_initial_datas(connection: &mut SqliteConnection) -> Result<(), Error> {
        let functions: Vec<Self> = functions_initial_datas!()
            .map_err(|e| std::io::Error::new(InvalidData, e.to_string()))?;

        for function in functions {
            function
                .insert_initial_datas(connection)
                .map_err(|e| std::io::Error::new(InvalidData, e.to_string()))?;
        }

        Ok(())
    }
}
