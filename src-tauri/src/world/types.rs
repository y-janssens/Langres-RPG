use diesel::backend::Backend;
use diesel::deserialize::{self, FromSql};
use diesel::serialize::{self, Output, ToSql};
use diesel::sql_types::Text;
use diesel::sqlite::SqliteValue;
use diesel::{prelude::*, sqlite::Sqlite};
use serde::{Deserialize, Serialize};
use std::ops::{Deref, DerefMut};

use super::models::{Item, Options};
use crate::npcs::models::Npc;

#[derive(Debug, Serialize, Deserialize, Clone, AsChangeset)]
#[diesel(table_name = crate::schema::maps)]
#[diesel(check_for_backend(Sqlite))]
pub struct Content(#[diesel(column_name = "content")] Vec<Item>);

impl Deref for Content {
    type Target = Vec<Item>;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl DerefMut for Content {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

impl Queryable<Text, Sqlite> for Content {
    type Row = Content;

    fn build(
        row: Content,
    ) -> Result<Content, Box<(dyn serde::ser::StdError + Send + Sync + 'static)>> {
        Ok(row)
    }
}

impl FromSql<Text, Sqlite> for Content {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let t = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        let items: Vec<Item> = serde_json::from_str(&t)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)?;
        Ok(Content { 0: items })
    }
}

impl ToSql<Text, Sqlite> for Content {
    fn to_sql(&self, out: &mut Output<'_, '_, Sqlite>) -> serialize::Result {
        let json = serde_json::to_string(self)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)?;
        out.set_value(json);
        Ok(serialize::IsNull::No)
    }
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Npcs(Vec<Npc>);

impl FromSql<Text, Sqlite> for Npcs {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Npcs {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl ToSql<Text, Sqlite> for Npcs {
    fn to_sql(&self, out: &mut Output<'_, '_, Sqlite>) -> serialize::Result {
        let json = serde_json::to_string(self)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)?;
        out.set_value(json);
        Ok(serialize::IsNull::No)
    }
}

impl FromSql<Text, Sqlite> for Options {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Options {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl ToSql<Text, Sqlite> for Options {
    fn to_sql(&self, out: &mut Output<'_, '_, Sqlite>) -> serialize::Result {
        let json = serde_json::to_string(self)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)?;
        out.set_value(json);
        Ok(serialize::IsNull::No)
    }
}
