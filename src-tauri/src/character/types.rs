use diesel::{
    deserialize::{self, FromSql},
    prelude::Queryable,
    sql_types::Text,
    sqlite::{Sqlite, SqliteValue},
};

use super::models::{Character, Inventory};

impl FromSql<Text, Sqlite> for Character {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr).map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Character {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row).map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl FromSql<Text, Sqlite> for Inventory {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr).map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Inventory {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row).map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}
