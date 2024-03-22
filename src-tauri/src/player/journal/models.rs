use diesel::{QueryResult, SqliteConnection};
use serde::{Deserialize, Serialize};

use crate::config::factory::factory_models::AbstractModel;
use crate::player::achievements::models::PlayerAchievement;
use crate::player::quests::models::PlayerQuest;

impl AbstractModel for PlayerJournal {}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct PlayerJournal {
    pub achievements: Vec<PlayerAchievement>,
    pub quests: Vec<PlayerQuest>,
}

impl PlayerJournal {
    pub fn load(_id: i32, connection: &mut SqliteConnection) -> QueryResult<PlayerJournal> {
        let achievements = PlayerAchievement::load(_id, connection)?;
        let quests = PlayerQuest::load(_id, connection)?;
        let journal = PlayerJournal {
            achievements,
            quests,
        };
        Ok(journal)
    }
}
