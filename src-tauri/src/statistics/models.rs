use crate::config::factory::factory_models::AbstractModel;
use crate::schema::statistics::dsl::*;
use crate::utils::functions::generate_id;
use crate::{schema::statistics, translations::models::Translations};
use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, QueryResult, RunQueryDsl, Selectable,
    SqliteConnection,
};
use serde::{Deserialize, Serialize};

impl AbstractModel for Statistic {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::statistics)]
#[diesel(check_for_backend(Sqlite))]
pub struct Statistic {
    pub id: i32,
    pub name: Translations,
    pub value: String,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::statistics)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableStatistic {
    name: String,
    value: String,
}

impl Statistic {
    pub fn new() -> Statistic {
        Statistic {
            id: generate_id(),
            name: Translations {
                fr: "".into(),
                en: "".into(),
            },
            value: "".into(),
        }
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Statistic>> {
        let _load = crate::schema::statistics::table.load(connection)?;
        Ok(_load)
    }

    pub fn save(
        stat: Statistic,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let name_json = serde_json::to_string(&stat.name).expect("error");

        let insertable = InsertableStatistic {
            name: name_json,
            value: stat.value,
        };
        let exists = statistics
            .filter(id.eq(stat.id))
            .first::<Statistic>(connection)
            .is_ok();

        if exists {
            diesel::update(statistics.find(stat.id))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(statistics::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn delete(_id: i32, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(statistics.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
