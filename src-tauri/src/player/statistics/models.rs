use diesel::result::Error;
use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, RunQueryDsl, Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::backend::translations::models::Translations;
use crate::schema::playerstatistics;
use crate::schema::playerstatistics::dsl::*;
use crate::statistics::models::Statistic;

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::playerstatistics)]
#[diesel(check_for_backend(Sqlite))]
pub struct PlayerStatistic {
    pub id: String,
    pub game_id: String,
    pub statistic_id: String,
    pub name: Translations,
    pub value: String,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::playerstatistics)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertablePlayerStatistic {
    pub id: String,
    pub game_id: String,
    pub statistic_id: String,
    pub name: String,
    pub value: String,
}

impl PlayerStatistic {
    pub fn generate(_id: String, connection: &mut SqliteConnection) -> Result<(), Error> {
        println!("Generating game statistics...");
        let base_statistics = Statistic::load(connection)?;
        for statistic in base_statistics {
            let name_json = serde_json::to_string(&statistic.name)
                .map_err(|e| Error::DeserializationError(Box::new(e)))?;
            let _statistic = InsertablePlayerStatistic {
                id: Uuid::new_v4().to_string(),
                game_id: _id.clone(),
                statistic_id: statistic.id,
                name: name_json,
                value: statistic.value,
            };
            diesel::insert_into(playerstatistics::table)
                .values(&_statistic)
                .execute(connection)?;
        }
        Ok(())
    }

    pub fn load(
        _id: String,
        connection: &mut SqliteConnection,
    ) -> QueryResult<Vec<PlayerStatistic>> {
        let _load = crate::schema::playerstatistics::table
            .filter(crate::schema::playerstatistics::game_id.eq(_id))
            .load::<PlayerStatistic>(connection)?;
        Ok(_load)
    }

    pub fn get(_id: String, connection: &mut SqliteConnection) -> QueryResult<PlayerStatistic> {
        let _load = crate::schema::playerstatistics::table
            .filter(crate::schema::playerstatistics::id.eq(_id))
            .first::<PlayerStatistic>(connection)?;
        Ok(_load)
    }

    pub fn save(self, connection: &mut SqliteConnection) -> Result<(), Error> {
        let name_json = serde_json::to_string(&self.name)
            .map_err(|e| Error::DeserializationError(Box::new(e)))?;

        let insertable = InsertablePlayerStatistic {
            id: Uuid::new_v4().to_string(),
            game_id: self.clone().game_id,
            statistic_id: self.clone().id,
            name: name_json,
            value: self.clone().value,
        };

        let exists = playerstatistics
            .filter(playerstatistics::id.eq(self.clone().id))
            .first::<PlayerStatistic>(connection)
            .is_ok();

        if exists {
            diesel::update(playerstatistics.find(self.id))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(playerstatistics::table)
                .values(&insertable)
                .execute(connection)?;
        }
        Ok(())
    }
}
