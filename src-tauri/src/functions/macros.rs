use std::io::{Error, ErrorKind::InvalidData};

use diesel::SqliteConnection;
use serde_yaml::{Sequence, Value};
use system_macros::functions_initial_datas;

use crate::backend::utils::parse::{get_numeric_value, get_string_value};
use crate::functions::models::Function;

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

    pub fn get_and_insert_initial_datas(connection: &mut SqliteConnection) -> Result<(), Error> {
        let functions: Vec<Self> = functions_initial_datas!()
            .map_err(|e| std::io::Error::new(InvalidData, e.to_string()))?;

        for function in functions {
            function
                .save(connection)
                .map_err(|e| std::io::Error::new(InvalidData, e.to_string()))?;
        }

        Ok(())
    }
}
