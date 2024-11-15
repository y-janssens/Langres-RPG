use crate::backend::conf::factories::factories_definitions::WorldFactory;
use crate::backend::conf::factory::factory_models::AbstractModel;
use crate::backend::conf::factory::factory_models::Factory;
use crate::backend::conf::faker::faker_definitions::{Faker, IdFaker};
use crate::schema::maps::dsl::*;
use crate::world::models::World;

use chrono::{DateTime, Local};
use diesel::{
    deserialize::{self, FromSql, Queryable},
    prelude::*,
    sql_types::Text,
    sqlite::{Sqlite, SqliteValue},
    QueryResult, RunQueryDsl, Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};

impl AbstractModel for Collection {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::maps)]
#[diesel(check_for_backend(Sqlite))]
pub struct Collection {
    pub id: i32,
    pub map: World,
    pub created: String,
    pub modified: String,
    pub visible: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::maps)]
pub struct InsertableCollection {
    pub map: String,
    pub created: String,
    pub modified: String,
    pub visible: bool,
}

impl FromSql<Text, Sqlite> for World {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for World {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Collection {
    pub fn new() -> Collection {
        Collection {
            id: IdFaker.generate().value(),
            created: Self::get_date(),
            modified: Self::get_date(),
            map: WorldFactory.generate(),
            visible: true,
        }
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Collection>> {
        let mut _load: Vec<Collection> = crate::schema::maps::table.load(connection)?;
        Ok(_load)
    }

    pub fn save(
        data: Collection,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let map_json = serde_json::to_string(&data.map).expect("error");

        let insertable = InsertableCollection {
            map: map_json,
            created: data.created,
            modified: Self::get_date(),
            visible: data.visible,
        };

        let exists = maps
            .filter(id.eq(data.id))
            .first::<Collection>(connection)
            .is_ok();

        if exists {
            diesel::update(maps.find(data.id))
                .set(insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(crate::schema::maps::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn delete(_id: i32, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(maps.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }

    fn get_date() -> String {
        let local: DateTime<Local> = Local::now();
        local.to_string()
    }
}
