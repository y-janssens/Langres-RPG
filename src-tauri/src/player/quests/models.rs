use crate::schema::playerquests;
use crate::schema::playerquests::dsl::*;
use crate::translations::models::Translations;
use crate::{game::models::Game, settings::factory::factory_models::AbstractModel};

use diesel::sql_types::Text;
use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, RunQueryDsl, Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::quests::models::{Quest, Status};

impl AbstractModel for PlayerQuest {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::playerquests)]
#[diesel(check_for_backend(Sqlite))]
pub struct PlayerQuest {
    pub id: String,
    pub quest_id: String,
    pub game_id: String,
    pub name: Translations,
    pub description: Translations,
    pub primary: bool,
    pub status: Status,
    pub visible: bool,
    pub reward: i32,
    pub next: Option<String>,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::playerquests)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertablePlayerQuest {
    pub id: String,
    pub game_id: String,
    pub quest_id: String,
    pub name: String,
    pub description: String,
    pub primary: bool,
    pub status: String,
    pub visible: bool,
    pub reward: i32,
    pub next: Option<String>,
}

impl Queryable<Text, Sqlite> for Translations {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl PlayerQuest {
    pub fn generate(_id: String, connection: &mut SqliteConnection) {
        println!("Generating game quests...");
        let base_quests = Quest::load();
        let mut _quests: Vec<PlayerQuest> = vec![];
        for quest in base_quests {
            let status_json = serde_json::to_string(&quest.status).expect("error");
            let name_json = serde_json::to_string(&quest.name).expect("error");
            let description_json = serde_json::to_string(&quest.description).expect("error");
            let _quest = InsertablePlayerQuest {
                id: Uuid::new_v4().to_string(),
                quest_id: quest.id,
                game_id: _id.clone(),
                name: name_json,
                description: description_json,
                primary: quest.primary,
                status: status_json,
                visible: quest.visible,
                reward: quest.reward,
                next: quest.next,
            };
            diesel::insert_into(playerquests::table)
                .values(&_quest)
                .execute(connection)
                .expect("Failed to save quest");
        }
    }

    pub fn load(_id: String, connection: &mut SqliteConnection) -> QueryResult<Vec<PlayerQuest>> {
        let _load = crate::schema::playerquests::table
            .filter(crate::schema::playerquests::game_id.eq(_id))
            .load::<PlayerQuest>(connection)?;
        Ok(_load)
    }

    pub fn get(_id: String, connection: &mut SqliteConnection) -> QueryResult<PlayerQuest> {
        let _load = crate::schema::playerquests::table
            .filter(crate::schema::playerquests::quest_id.eq(_id))
            .first::<PlayerQuest>(connection)?;
        Ok(_load)
    }

    pub fn save(
        quest: PlayerQuest,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let status_json = serde_json::to_string(&quest.status).expect("error");
        let name_json = serde_json::to_string(&quest.name).expect("error");
        let description_json = serde_json::to_string(&quest.description).expect("error");

        let insertable = InsertablePlayerQuest {
            id: Uuid::new_v4().to_string(),
            game_id: quest.clone().game_id,
            quest_id: quest.clone().id,
            name: name_json,
            description: description_json,
            primary: quest.primary,
            status: status_json,
            visible: quest.visible,
            reward: quest.reward,
            next: quest.next.clone(),
        };

        let exists = playerquests
            .filter(playerquests::id.eq(quest.clone().id))
            .first::<PlayerQuest>(connection)
            .is_ok();

        if exists {
            diesel::update(playerquests.find(quest.clone().id))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(playerquests::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn activate(mut quest: PlayerQuest, connection: &mut SqliteConnection) {
        quest.status.owned = true;
        let _ = PlayerQuest::save(quest, connection);
    }

    pub fn validate(mut quest: PlayerQuest, xp: i32, connection: &mut SqliteConnection) {
        let mut player_game = Game::get(quest.clone().game_id, connection)
            .unwrap_or_else(|_| panic!("Failed to load game {}", quest.clone().game_id));
        Game::compute_character_xp(&mut player_game, xp, connection);
        quest.status.completed = true;
        let _ = PlayerQuest::save(quest.clone(), connection);

        if quest.next.is_some() {
            let mut _next =
                Self::get(quest.next.unwrap(), connection).expect("Failed to get quest");
            Self::activate(_next, connection);
        }
    }

    pub fn edit(
        mut quest: PlayerQuest,
        _status: &str,
        value: bool,
        connection: &mut SqliteConnection,
    ) {
        match _status {
            "failed" => quest.status.failed = value,
            "abandoned" => quest.status.abandoned = value,
            _ => (),
        }
        let _ = PlayerQuest::save(quest, connection);
    }
}
