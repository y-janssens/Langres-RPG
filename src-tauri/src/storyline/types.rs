use diesel::deserialize::{self, FromSql};
use diesel::sql_types::Text;
use diesel::sqlite::SqliteValue;
use diesel::{prelude::*, sqlite::Sqlite};

use super::models::{Act, Acts, Story};

impl FromSql<Text, Sqlite> for Story {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Story {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Acts {
    type Row = Acts;

    fn build(row: Acts) -> Result<Acts, Box<(dyn serde::ser::StdError + Send + Sync + 'static)>> {
        Ok(row)
    }
}

impl FromSql<Text, Sqlite> for Acts {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let t = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        let acts: Vec<Act> = serde_json::from_str(&t)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)?;
        Ok(Acts(acts))
    }
}
