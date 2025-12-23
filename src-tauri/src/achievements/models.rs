use crate::schema::achievements;
use crate::schema::achievements::dsl::*;
use diesel::result::Error;
use diesel::{deserialize::Queryable, prelude::*, sqlite::Sqlite, QueryResult, RunQueryDsl, Selectable, SqliteConnection};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::backend::translations::models::Translations;

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::achievements)]
#[diesel(check_for_backend(Sqlite))]
pub struct Achievement {
    pub id: String,
    pub name: Translations,
    pub description: Translations,
    pub completed: bool,
    pub visible: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::achievements)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableAchievement {
    pub id: String,
    pub name: String,
    pub description: String,
    pub completed: bool,
    pub visible: bool,
}

impl Default for Achievement {
    fn default() -> Self {
        Self::new()
    }
}

impl Achievement {
    pub fn new() -> Self {
        Self {
            id: Uuid::new_v4().to_string(),
            name: Translations::new(),
            description: Translations::new(),
            completed: false,
            visible: true,
        }
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Self>> {
        let _load = crate::schema::achievements::table.load(connection)?;
        Ok(_load)
    }

    pub fn save(self, connection: &mut SqliteConnection) -> Result<(), Error> {
        let name_json = serde_json::to_string(&self.name).map_err(|e| Error::DeserializationError(Box::new(e)))?;
        let description_json = serde_json::to_string(&self.description).map_err(|e| Error::DeserializationError(Box::new(e)))?;

        let insertable = InsertableAchievement {
            id: Uuid::new_v4().to_string(),
            name: name_json,
            description: description_json,
            completed: self.completed,
            visible: self.visible,
        };
        let exists = achievements.filter(id.eq(self.clone().id)).first::<Achievement>(connection).is_ok();

        if exists {
            diesel::update(achievements.find(self.id)).set(&insertable).execute(connection)?;
        } else {
            diesel::insert_into(achievements::table).values(&insertable).execute(connection)?;
        }

        Ok(())
    }

    pub fn delete(_id: String, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(achievements.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
