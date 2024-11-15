use diesel::{QueryResult, SqliteConnection};
use serde::{Deserialize, Serialize};

use crate::player::achievements::models::PlayerAchievement;
use crate::player::quests::models::PlayerQuest;
use crate::player::statistics::models::PlayerStatistic;
use crate::settings::factory::factory_models::AbstractModel;

impl AbstractModel for PlayerJournal {}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct PlayerJournal {
    pub game_id: String,
    pub achievements: Vec<PlayerAchievement>,
    pub quests: Vec<PlayerQuest>,
    pub statistics: Vec<PlayerStatistic>,
}

impl PlayerJournal {
    pub fn load(_id: String, connection: &mut SqliteConnection) -> QueryResult<PlayerJournal> {
        let achievements = PlayerAchievement::load(_id.clone(), connection)?;
        let quests = PlayerQuest::load(_id.clone(), connection)?;
        let statistics = PlayerStatistic::load(_id.clone(), connection)?;
        let journal = PlayerJournal {
            game_id: _id,
            quests,
            achievements,
            statistics,
        };
        Ok(journal)
    }
}
