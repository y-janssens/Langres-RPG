use crate::schema::playerquests;
use crate::schema::playerquests::dsl::*;
use crate::{config::factory::factory_models::AbstractModel, game::models::Game};

use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, RunQueryDsl, Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};

use crate::quests::models::{Quest, Status};

impl AbstractModel for PlayerQuest {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::playerquests)]
#[diesel(check_for_backend(Sqlite))]
pub struct PlayerQuest {
    pub id: i32,
    pub quest_id: i32,
    pub game_id: i32,
    pub name: String,
    pub description: String,
    pub primary: bool,
    pub status: Status,
    pub visible: bool,
    pub reward: i32,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::playerquests)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertablePlayerQuest {
    pub game_id: i32,
    pub quest_id: i32,
    pub name: String,
    pub description: String,
    pub primary: bool,
    pub status: String,
    pub visible: bool,
    pub reward: i32,
}

impl PlayerQuest {
    pub fn generate(_id: i32, language: &str, connection: &mut SqliteConnection) {
        let base_quests = Quest::load(connection).expect("Failed to load quests");
        let mut _quests: Vec<PlayerQuest> = vec![];
        for quest in base_quests {
            let status_json = serde_json::to_string(&quest.status).expect("error");
            let _quest = InsertablePlayerQuest {
                quest_id: quest.id,
                game_id: _id,
                name: quest.name.resolve(false, language),
                description: quest.description.resolve(false, language),
                primary: quest.primary,
                status: status_json,
                visible: quest.visible,
                reward: quest.reward,
            };
            diesel::insert_into(playerquests::table)
                .values(&_quest)
                .execute(connection)
                .expect("Failed to save quest");
        }
    }

    pub fn load(_id: i32, connection: &mut SqliteConnection) -> QueryResult<Vec<PlayerQuest>> {
        let _load = crate::schema::playerquests::table
            .filter(crate::schema::playerquests::game_id.eq(_id))
            .load::<PlayerQuest>(connection)?;
        Ok(_load)
    }

    pub fn get(_id: i32, connection: &mut SqliteConnection) -> QueryResult<PlayerQuest> {
        let _load = crate::schema::playerquests::table
            .filter(crate::schema::playerquests::id.eq(_id))
            .first::<PlayerQuest>(connection)?;
        Ok(_load)
    }

    pub fn save(
        quest: PlayerQuest,
        _id: i32,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let status_json = serde_json::to_string(&quest.status).expect("error");

        let insertable = InsertablePlayerQuest {
            game_id: _id,
            quest_id: quest.id,
            name: quest.name,
            description: quest.description,
            primary: quest.primary,
            status: status_json,
            visible: quest.visible,
            reward: quest.reward,
        };

        let exists = playerquests
            .filter(playerquests::id.eq(quest.id))
            .first::<PlayerQuest>(connection)
            .is_ok();

        if exists {
            diesel::update(playerquests.find(quest.id))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(playerquests::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn activate(
        mut quest: PlayerQuest,
        _id: i32,
        language: &str,
        connection: &mut SqliteConnection,
    ) {
        let base_quest = Quest::get(quest.quest_id, connection)
            .unwrap_or_else(|_| panic!("Failed to activate quest {}", quest.quest_id));
        quest.status.owned = true;
        quest.name = base_quest.name.resolve(true, language);
        quest.description = base_quest.description.resolve(true, language);
        let _ = PlayerQuest::save(quest, _id, connection);
    }

    pub fn validate(mut quest: PlayerQuest, _id: i32, xp: i32, connection: &mut SqliteConnection) {
        let player_game =
            Game::load(_id, connection).unwrap_or_else(|_| panic!("Failed to load game {}", _id));
        Game::compute_character_xp(xp, player_game, connection);
        quest.status.completed = true;
        let _ = PlayerQuest::save(quest, _id, connection);
    }

    pub fn edit(
        mut quest: PlayerQuest,
        _id: i32,
        _status: &str,
        value: bool,
        connection: &mut SqliteConnection,
    ) {
        match _status {
            "completed" => quest.status.completed = value,
            "failed" => quest.status.failed = value,
            "abandoned" => quest.status.abandoned = value,
            _ => (),
        }
        let _ = PlayerQuest::save(quest, _id, connection);
    }
}
