use crate::schema::statistics::dsl::*;
use crate::settings::factory::factory_models::AbstractModel;
use crate::{schema::statistics, translations::models::Translations};
use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, QueryResult, RunQueryDsl, Selectable,
    SqliteConnection,
};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

impl AbstractModel for Statistic {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::statistics)]
#[diesel(check_for_backend(Sqlite))]
pub struct Statistic {
    pub id: String,
    pub name: Translations,
    pub description: Translations,
    pub value: String,
    pub visible: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::statistics)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableStatistic {
    pub id: String,
    name: String,
    description: String,
    value: String,
    pub visible: bool,
}

impl Statistic {
    pub fn new() -> Statistic {
        Statistic {
            id: Uuid::new_v4().to_string(),
            name: Translations::default(),
            description: Translations::default(),
            value: "0".into(),
            visible: true,
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
        let description_json = serde_json::to_string(&stat.description).expect("error");

        let insertable = InsertableStatistic {
            id: Uuid::new_v4().to_string(),
            name: name_json,
            description: description_json,
            value: stat.clone().value,
            visible: stat.clone().visible,
        };
        let exists = statistics
            .filter(id.eq(stat.clone().id))
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

    pub fn delete(_id: String, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(statistics.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
