use crate::schema::playerquests;
use crate::schema::playerquests::dsl::*;
use diesel::result::Error;
use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, RunQueryDsl, Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::backend::translations::models::Translations;
use crate::game::models::Game;
use crate::quests::models::{Quest, Status};

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

impl PlayerQuest {
    pub fn generate(_id: String, connection: &mut SqliteConnection) -> Result<(), Error> {
        println!("Generating game quests...");
        let base_quests = Quest::load(connection)?;
        let mut _quests: Vec<PlayerQuest> = vec![];
        for quest in base_quests {
            let status_json = serde_json::to_string(&quest.status)
                .map_err(|e| Error::DeserializationError(Box::new(e)))?;
            let name_json = serde_json::to_string(&quest.name)
                .map_err(|e| Error::DeserializationError(Box::new(e)))?;
            let description_json = serde_json::to_string(&quest.description)
                .map_err(|e| Error::DeserializationError(Box::new(e)))?;
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
                .execute(connection)?;
        }
        Ok(())
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

    pub fn save(self, connection: &mut SqliteConnection) -> Result<(), Error> {
        let status_json = serde_json::to_string(&self.status)
            .map_err(|e| Error::DeserializationError(Box::new(e)))?;
        let name_json = serde_json::to_string(&self.name)
            .map_err(|e| Error::DeserializationError(Box::new(e)))?;
        let description_json = serde_json::to_string(&self.description)
            .map_err(|e| Error::DeserializationError(Box::new(e)))?;

        let insertable = InsertablePlayerQuest {
            id: Uuid::new_v4().to_string(),
            game_id: self.clone().game_id,
            quest_id: self.clone().id,
            name: name_json,
            description: description_json,
            primary: self.primary,
            status: status_json,
            visible: self.visible,
            reward: self.reward,
            next: self.next.clone(),
        };

        let exists = playerquests
            .filter(playerquests::id.eq(self.clone().id))
            .first::<PlayerQuest>(connection)
            .is_ok();

        if exists {
            diesel::update(playerquests.find(self.clone().id))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(playerquests::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn activate(mut self, connection: &mut SqliteConnection) {
        self.status.owned = true;
        let _ = self.save(connection);
    }

    pub fn validate(&mut self, xp: i32, connection: &mut SqliteConnection) -> Result<(), Error> {
        let mut player_game = Game::get(self.clone().game_id, connection)?;
        player_game.compute_character_xp(xp, connection);
        self.status.completed = true;
        self.clone().save(connection)?;

        if let Some(quest) = &self.next {
            let mut _next = Self::get(quest.clone(), connection)?;
            _next.activate(connection);
        }
        Ok(())
    }

    pub fn edit(
        mut self,
        _status: &str,
        value: bool,
        connection: &mut SqliteConnection,
    ) -> Result<(), Error> {
        match _status {
            "failed" => self.status.failed = value,
            "abandoned" => self.status.abandoned = value,
            _ => (),
        }
        self.save(connection)?;
        Ok(())
    }
}
