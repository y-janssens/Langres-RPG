use crate::app::models::App;
use crate::config::factory::factory_models::AbstractModel;
use crate::schema::playerstatistics;
use crate::schema::playerstatistics::dsl::*;
use crate::statistics::models::Statistic;

use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, RunQueryDsl, Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};

impl AbstractModel for PlayerStatistic {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::playerstatistics)]
#[diesel(check_for_backend(Sqlite))]
pub struct PlayerStatistic {
    pub id: i32,
    pub game_id: i32,
    pub statistic_id: i32,
    pub name: String,
    pub value: String,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::playerstatistics)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertablePlayerStatistic {
    pub game_id: i32,
    pub statistic_id: i32,
    pub name: String,
    pub value: String,
}

impl PlayerStatistic {
    pub fn generate(_id: i32, _language: &str, connection: &mut SqliteConnection) {
        let base_statistics = Statistic::load(connection).expect("Failed to load statistics");
        for statistic in base_statistics {
            let _statistic = InsertablePlayerStatistic {
                game_id: _id,
                statistic_id: statistic.id,
                name: statistic.name.resolve(true, _language),
                value: statistic.value,
            };
            diesel::insert_into(playerstatistics::table)
                .values(&_statistic)
                .execute(connection)
                .expect("Failed to save statistic");
        }
    }

    pub fn load(_id: i32, connection: &mut SqliteConnection) -> QueryResult<Vec<PlayerStatistic>> {
        let _load = crate::schema::playerstatistics::table
            .filter(crate::schema::playerstatistics::game_id.eq(_id))
            .load::<PlayerStatistic>(connection)?;
        println!("{:?}", _load);
        Ok(_load)
    }

    pub fn get(_id: i32, connection: &mut SqliteConnection) -> QueryResult<PlayerStatistic> {
        let _load = crate::schema::playerstatistics::table
            .filter(crate::schema::playerstatistics::id.eq(_id))
            .first::<PlayerStatistic>(connection)?;
        Ok(_load)
    }

    pub fn save(
        statistic: PlayerStatistic,
        _id: i32,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let _language = App::load(connection).expect("Error").language;
        let base_statistic = Statistic::get(statistic.statistic_id, connection).expect("Error");
        let insertable = InsertablePlayerStatistic {
            game_id: _id,
            statistic_id: statistic.id,
            name: base_statistic.name.resolve(true, &_language),
            value: statistic.value,
        };

        let exists = playerstatistics
            .filter(playerstatistics::id.eq(statistic.id))
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
