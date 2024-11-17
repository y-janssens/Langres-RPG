use crate::backend::conf::factory::factory_models::AbstractModel;
use crate::schema::achievements::dsl::*;
use crate::{schema::achievements, backend::translations::models::Translations};
use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, QueryResult, RunQueryDsl, Selectable,
    SqliteConnection,
};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

impl AbstractModel for Achievement {}

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

impl Achievement {
    pub fn new() -> Achievement {
        Achievement {
            id: Uuid::new_v4().to_string(),
            name: Translations::default(),
            description: Translations::default(),
            completed: false,
            visible: true,
        }
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Achievement>> {
        let _load = crate::schema::achievements::table.load(connection)?;
        Ok(_load)
    }

    pub fn save(
        achievement: Achievement,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let name_json = serde_json::to_string(&achievement.name).expect("error");
        let description_json = serde_json::to_string(&achievement.description).expect("error");

        let insertable = InsertableAchievement {
            id: Uuid::new_v4().to_string(),
            name: name_json,
            description: description_json,
            completed: achievement.completed,
            visible: achievement.visible,
        };
        let exists = achievements
            .filter(id.eq(achievement.clone().id))
            .first::<Achievement>(connection)
            .is_ok();

        if exists {
            diesel::update(achievements.find(achievement.id))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(achievements::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn delete(_id: String, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(achievements.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
