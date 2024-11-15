use crate::schema::playerstatistics;
use crate::schema::playerstatistics::dsl::*;
use crate::backend::conf::factory::factory_models::AbstractModel;
use crate::statistics::models::Statistic;
use crate::backend::translations::models::Translations;

use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, RunQueryDsl, Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

impl AbstractModel for PlayerStatistic {}

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
    pub fn generate(_id: String, connection: &mut SqliteConnection) {
        println!("Generating game statistics...");
        let base_statistics = Statistic::load(connection).expect("Failed to load statistics");
        for statistic in base_statistics {
            let name_json = serde_json::to_string(&statistic.name).expect("error");
            let _statistic = InsertablePlayerStatistic {
                id: Uuid::new_v4().to_string(),
                game_id: _id.clone(),
                statistic_id: statistic.id,
                name: name_json,
                value: statistic.value,
            };
            diesel::insert_into(playerstatistics::table)
                .values(&_statistic)
                .execute(connection)
                .expect("Failed to save statistic");
        }
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

    pub fn save(
        statistic: PlayerStatistic,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let name_json = serde_json::to_string(&statistic.name).expect("error");

        let insertable = InsertablePlayerStatistic {
            id: Uuid::new_v4().to_string(),
            game_id: statistic.clone().game_id,
            statistic_id: statistic.clone().id,
            name: name_json,
            value: statistic.clone().value,
        };

        let exists = playerstatistics
            .filter(playerstatistics::id.eq(statistic.clone().id))
            .first::<PlayerStatistic>(connection)
            .is_ok();

        if exists {
            diesel::update(playerstatistics.find(statistic.id))
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
