use diesel::{
    deserialize::{self, FromSql},
    prelude::*,
    sql_types::Text,
    sqlite::{Sqlite, SqliteValue},
};
use serde::ser::StdError;

use super::models::Languages;

impl FromSql<Text, Sqlite> for Languages {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let string = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&string)
            .map(Languages)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Languages {
    type Row = Languages;

    fn build(row: Languages) -> Result<Languages, Box<(dyn StdError + Send + Sync + 'static)>> {
        Ok(row)
    }
}
