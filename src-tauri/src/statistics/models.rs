use crate::schema::statistics::dsl::*;
use crate::{backend::translations::models::Translations, schema::statistics};
use diesel::result::Error;
use diesel::{deserialize::Queryable, prelude::*, sqlite::Sqlite, QueryResult, RunQueryDsl, Selectable, SqliteConnection};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::statistics)]
#[diesel(check_for_backend(Sqlite))]
pub struct Statistic {
    pub id: String,
    pub name: Translations,
    pub description: Translations,
    pub value: String,
    pub visible: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::statistics)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableStatistic {
    pub id: String,
    name: String,
    description: String,
    value: String,
    pub visible: bool,
}

impl Default for Statistic {
    fn default() -> Self {
        Self::new()
    }
}

impl Statistic {
    pub fn new() -> Self {
        Self {
            id: Uuid::new_v4().to_string(),
            name: Translations::new(),
            description: Translations::new(),
            value: "0".into(),
            visible: true,
        }
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Self>> {
        let _load = crate::schema::statistics::table.load(connection)?;
        Ok(_load)
    }

    pub fn save(self, connection: &mut SqliteConnection) -> Result<(), Error> {
        let name_json = serde_json::to_string(&self.name).map_err(|e| Error::DeserializationError(Box::new(e)))?;
        let description_json = serde_json::to_string(&self.description).map_err(|e| Error::DeserializationError(Box::new(e)))?;

        let insertable = InsertableStatistic {
            id: Uuid::new_v4().to_string(),
            name: name_json,
            description: description_json,
            value: self.clone().value,
            visible: self.clone().visible,
        };
        let exists = statistics.filter(id.eq(self.clone().id)).first::<Self>(connection).is_ok();

        if exists {
            diesel::update(statistics.find(self.id)).set(&insertable).execute(connection)?;
        } else {
            diesel::insert_into(statistics::table).values(&insertable).execute(connection)?;
        }
        Ok(())
    }

    pub fn delete(_id: String, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(statistics.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
