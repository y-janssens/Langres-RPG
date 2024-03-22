use crate::config::factory::factory_models::AbstractModel;
use crate::schema::quests::dsl::*;
use crate::utils::functions::generate_id;
use crate::{schema::quests, translations::models::Translations};
use diesel::{
    deserialize::Queryable, prelude::*, sql_types::Text, sqlite::Sqlite, QueryResult, RunQueryDsl,
    Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};

impl AbstractModel for Quest {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Status {
    pub owned: bool,
    pub completed: bool,
    pub failed: bool,
    pub abandoned: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::quests)]
#[diesel(check_for_backend(Sqlite))]
pub struct Quest {
    pub id: i32,
    pub name: Translations,
    pub description: Translations,
    pub primary: bool,
    pub status: Status,
    pub visible: bool,
    pub reward: i32,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::quests)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableQuest {
    name: String,
    description: String,
    primary: bool,
    status: String,
    visible: bool,
    reward: i32,
}

impl Queryable<Text, Sqlite> for Translations {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}
impl Queryable<Text, Sqlite> for Status {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Quest {
    pub fn new() -> Quest {
        Quest {
            id: generate_id(),
            name: Translations {
                fr: "".into(),
                en: "".into(),
            },
            description: Translations {
                fr: "".into(),
                en: "".into(),
            },
            primary: true,
            status: Status {
                owned: false,
                completed: false,
                failed: false,
                abandoned: false,
            },
            visible: true,
            reward: 0,
        }
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Quest>> {
        let _load = crate::schema::quests::table.load(connection)?;
        Ok(_load)
    }

    pub fn get(_id: i32, connection: &mut SqliteConnection) -> QueryResult<Quest> {
        let _load = crate::schema::quests::table
            .filter(crate::schema::quests::id.eq(_id))
            .first::<Quest>(connection)?;
        Ok(_load)
    }

    pub fn save(
        quest: Quest,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let name_json = serde_json::to_string(&quest.name).expect("error");
        let description_json = serde_json::to_string(&quest.description).expect("error");
        let status_json = serde_json::to_string(&quest.status).expect("error");

        let insertable = InsertableQuest {
            name: name_json,
            description: description_json,
            primary: quest.primary,
            status: status_json,
            visible: quest.visible,
            reward: quest.reward,
        };
        let exists = quests
            .filter(id.eq(quest.id))
            .first::<Quest>(connection)
            .is_ok();

        if exists {
            diesel::update(quests.find(quest.id))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(quests::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn delete(_id: i32, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(quests.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
