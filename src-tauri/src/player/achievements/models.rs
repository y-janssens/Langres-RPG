use crate::config::factory::factory_models::AbstractModel;
use crate::schema::playerachievements;
use crate::schema::playerachievements::dsl::*;

use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, RunQueryDsl, Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};

use crate::achievements::models::Achievement;

impl AbstractModel for PlayerAchievement {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::playerachievements)]
#[diesel(check_for_backend(Sqlite))]
pub struct PlayerAchievement {
    pub id: i32,
    pub achievement_id: i32,
    pub game_id: i32,
    pub name: String,
    pub description: String,
    pub completed: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::playerachievements)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertablePlayerAchievement {
    pub game_id: i32,
    pub achievement_id: i32,
    pub name: String,
    pub description: String,
    pub completed: bool,
}

impl PlayerAchievement {
    pub fn generate(_id: i32, language: &str, connection: &mut SqliteConnection) {
        let base_achievements = Achievement::load(connection).expect("Failed to load achievements");
        let mut _achievements: Vec<PlayerAchievement> = vec![];
        for achievement in base_achievements {
            let _achievement = InsertablePlayerAchievement {
                achievement_id: achievement.id,
                game_id: _id,
                name: achievement.name.resolve(true, language),
                description: achievement.description.resolve(true, language),
                completed: achievement.completed,
            };
            diesel::insert_into(playerachievements::table)
                .values(&_achievement)
                .execute(connection)
                .expect("Failed to save achievement");
        }
    }

    pub fn load(
        _id: i32,
        connection: &mut SqliteConnection,
    ) -> QueryResult<Vec<PlayerAchievement>> {
        let _load = crate::schema::playerachievements::table
            .filter(crate::schema::playerachievements::game_id.eq(_id))
            .load::<PlayerAchievement>(connection)?;
        Ok(_load)
    }

    pub fn get(_id: i32, connection: &mut SqliteConnection) -> QueryResult<PlayerAchievement> {
        let _load = crate::schema::playerachievements::table
            .filter(crate::schema::playerachievements::id.eq(_id))
            .first::<PlayerAchievement>(connection)?;
        Ok(_load)
    }

    pub fn save(
        achievement: PlayerAchievement,
        _id: i32,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let insertable = InsertablePlayerAchievement {
            game_id: _id,
            achievement_id: achievement.id,
            name: achievement.name,
            description: achievement.description,
            completed: achievement.completed,
        };

        let exists = playerachievements
            .filter(playerachievements::id.eq(achievement.id))
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

    pub fn activate(
        mut achievement: PlayerAchievement,
        _id: i32,
        language: &str,
        connection: &mut SqliteConnection,
    ) {
        let base_achievement = Achievement::get(achievement.achievement_id, connection)
            .expect("Failed to load achievement");
        achievement.completed = true;
        achievement.name = base_achievement.name.resolve(true, language);
        achievement.description = base_achievement.description.resolve(true, language);
        let _ = PlayerAchievement::save(achievement, _id, connection);
    }
}
