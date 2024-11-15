use crate::schema::playerachievements;
use crate::schema::playerachievements::dsl::*;
use crate::{backend::conf::factory::factory_models::AbstractModel, backend::translations::models::Translations};

use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, RunQueryDsl, Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::achievements::models::Achievement;

impl AbstractModel for PlayerAchievement {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::playerachievements)]
#[diesel(check_for_backend(Sqlite))]
pub struct PlayerAchievement {
    pub id: String,
    pub achievement_id: String,
    pub game_id: String,
    pub name: Translations,
    pub description: Translations,
    pub completed: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::playerachievements)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertablePlayerAchievement {
    pub id: String,
    pub game_id: String,
    pub achievement_id: String,
    pub name: String,
    pub description: String,
    pub completed: bool,
}

impl PlayerAchievement {
    pub fn generate(_id: String, connection: &mut SqliteConnection) {
        println!("Generating game achievements...");
        let base_achievements = Achievement::load(connection).expect("Failed to load achievements");
        let mut _achievements: Vec<PlayerAchievement> = vec![];
        for achievement in base_achievements {
            let name_json = serde_json::to_string(&achievement.name).expect("error");
            let description_json = serde_json::to_string(&achievement.description).expect("error");
            let _achievement = InsertablePlayerAchievement {
                id: Uuid::new_v4().to_string(),
                achievement_id: achievement.id,
                game_id: _id.clone(),
                name: name_json,
                description: description_json,
                completed: achievement.completed,
            };
            diesel::insert_into(playerachievements::table)
                .values(&_achievement)
                .execute(connection)
                .expect("Failed to save achievement");
        }
    }

    pub fn load(
        _id: String,
        connection: &mut SqliteConnection,
    ) -> QueryResult<Vec<PlayerAchievement>> {
        let _load = crate::schema::playerachievements::table
            .filter(crate::schema::playerachievements::game_id.eq(_id))
            .load::<PlayerAchievement>(connection)?;
        Ok(_load)
    }

    pub fn get(_id: String, connection: &mut SqliteConnection) -> QueryResult<PlayerAchievement> {
        let _load = crate::schema::playerachievements::table
            .filter(crate::schema::playerachievements::id.eq(_id))
            .first::<PlayerAchievement>(connection)?;
        Ok(_load)
    }

    pub fn save(
        achievement: PlayerAchievement,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let name_json = serde_json::to_string(&achievement.name).expect("error");
        let description_json = serde_json::to_string(&achievement.description).expect("error");
        let insertable = InsertablePlayerAchievement {
            id: Uuid::new_v4().to_string(),
            game_id: achievement.clone().game_id,
            achievement_id: achievement.clone().id,
            name: name_json,
            description: description_json,
            completed: achievement.completed,
        };

        let exists = playerachievements
            .filter(playerachievements::id.eq(achievement.clone().id))
            .first::<PlayerAchievement>(connection)
            .is_ok();

        if exists {
            diesel::update(playerachievements.find(achievement.id))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(playerachievements::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn activate(mut achievement: PlayerAchievement, connection: &mut SqliteConnection) {
        achievement.completed = true;
        let _ = PlayerAchievement::save(achievement, connection);
    }
}
