use crate::schema::settings::dsl::*;
use diesel::{
    deserialize::{self, FromSql},
    prelude::*,
    sql_types::Text,
    sqlite::{Sqlite, SqliteValue},
};
use serde::{ser::StdError, Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize, Queryable)]
pub struct Values {
    pub key: String,
    pub value: String,
}

#[derive(Debug, Clone, Serialize, Deserialize, Queryable)]
pub struct Languages(pub Vec<Values>);

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

impl FromSql<Text, Sqlite> for Values {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::settings)]
#[diesel(check_for_backend(Sqlite))]
pub struct App {
    pub id: i32,
    pub language: String,
    pub languages: Languages,
    pub sound: bool,
    pub volume: i32,
    pub music: i32,
}

impl App {
    pub fn load(connection: &mut SqliteConnection) -> QueryResult<App> {
        let _load = crate::schema::settings::table.first(connection)?;
        Ok(_load)
    }

    pub fn save(_id: i32, data: App, connection: &mut SqliteConnection) -> QueryResult<usize> {
        let languages_json = serde_json::to_string(&data.languages.0).map_err(|e| {
            diesel::result::Error::DatabaseError(
                diesel::result::DatabaseErrorKind::UnableToSendCommand,
                Box::new(e.to_string()),
            )
        })?;

        diesel::update(settings.find(_id))
            .set((
                id.eq(_id),
                language.eq(&data.language),
                languages.eq(&languages_json),
                sound.eq(data.sound),
                volume.eq(data.volume),
                music.eq(data.music),
            ))
            .execute(connection)
    }
}
