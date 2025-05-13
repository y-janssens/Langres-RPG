use crate::backend::{translations::models::Translations, utils::functions::to_json};
use crate::schema::quests;
use crate::schema::quests::dsl::*;
use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, QueryResult, RunQueryDsl, Selectable,
    SqliteConnection,
};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Status {
    pub owned: bool,
    pub completed: bool,
    pub failed: bool,
    pub abandoned: bool,
}

impl Default for Status {
    fn default() -> Self {
        Self::new()
    }
}

impl Status {
    pub fn base() -> Self {
        Self {
            owned: true,
            completed: false,
            failed: false,
            abandoned: false,
        }
    }

    pub fn new() -> Self {
        Self {
            owned: false,
            completed: false,
            failed: false,
            abandoned: false,
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::quests)]
#[diesel(check_for_backend(Sqlite))]
pub struct Quest {
    pub id: String,
    pub name: Translations,
    pub description: Translations,
    pub primary: bool,
    pub status: Status,
    pub visible: bool,
    pub reward: i32,
    pub next: Option<String>,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::quests)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableQuest {
    id: String,
    name: String,
    description: String,
    primary: bool,
    status: String,
    visible: bool,
    reward: i32,
    next: Option<String>,
}

impl Default for Quest {
    fn default() -> Self {
        Self::new()
    }
}

impl Quest {
    pub fn new() -> Self {
        Self {
            id: Uuid::new_v4().to_string(),
            name: Translations::blank(),
            description: Translations::blank(),
            primary: true,
            status: Status {
                owned: false,
                completed: false,
                failed: false,
                abandoned: false,
            },
            visible: true,
            reward: 0,
            next: None,
        }
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Quest>> {
        let _load = quests::table.load(connection)?;
        Ok(_load)
    }

    pub fn get(_id: String, connection: &mut SqliteConnection) -> QueryResult<Quest> {
        let _load = crate::schema::quests::table
            .filter(quests::id.eq(_id))
            .first::<Quest>(connection)?;
        Ok(_load)
    }

    pub fn save(self, connection: &mut SqliteConnection) -> Result<(), diesel::result::Error> {
        let name_json = to_json(&self.name)?;
        let description_json = to_json(&self.description)?;
        let status_json = to_json(&self.status)?;

        let insertable = InsertableQuest {
            id: self.id.clone(),
            name: name_json,
            description: description_json,
            primary: self.primary,
            status: status_json,
            visible: self.visible,
            reward: self.reward,
            next: self.next.clone(),
        };
        let exists = quests
            .filter(id.eq(self.id.clone()))
            .first::<Quest>(connection)
            .is_ok();

        if exists {
            diesel::update(quests.find(&self.id.clone()))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(quests::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn delete(_id: String, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(quests.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
