use diesel::{
    deserialize::{self, FromSql, Queryable},
    sql_types::Text,
    sqlite::{Sqlite, SqliteValue},
};

use super::models::Area;

impl FromSql<Text, Sqlite> for Area {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr).map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Area {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row).map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}
