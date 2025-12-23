use crate::schema::collections::dsl::*;
use chrono::{DateTime, Local};
use diesel::result::Error;
use diesel::{deserialize::Queryable, prelude::*, sqlite::Sqlite, QueryResult, RunQueryDsl, Selectable, SqliteConnection};
use serde::{Deserialize, Serialize};

use crate::backend::conf::factories::factories_definitions::WorldFactory;
use crate::backend::conf::factory::factory_models::Factory;
use crate::backend::conf::faker::faker_definitions::{Faker, IdFaker};
use crate::world::models::World;

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::collections)]
#[diesel(check_for_backend(Sqlite))]
pub struct Collection {
    pub id: i32,
    pub map: World,
    pub created: String,
    pub modified: String,
    pub visible: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::collections)]
pub struct InsertableCollection {
    pub map: String,
    pub created: String,
    pub modified: String,
    pub visible: bool,
}

impl Default for Collection {
    fn default() -> Self {
        Self::new()
    }
}

impl Collection {
    pub fn new() -> Self {
        Self {
            id: IdFaker.generate().value(),
            created: Self::get_date(),
            modified: Self::get_date(),
            map: WorldFactory.generate(),
            visible: true,
        }
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Self>> {
        let mut _load: Vec<Self> = crate::schema::collections::table.load(connection)?;
        Ok(_load)
    }

    pub fn save(self, connection: &mut SqliteConnection) -> Result<(), Error> {
        let map_json = serde_json::to_string(&self.map).map_err(|e| Error::DeserializationError(Box::new(e)))?;

        let insertable = InsertableCollection {
            map: map_json,
            created: self.created,
            modified: Self::get_date(),
            visible: self.visible,
        };

        let exists = collections.filter(id.eq(self.id)).first::<Self>(connection).is_ok();

        if exists {
            diesel::update(collections.find(self.id)).set(insertable).execute(connection)?;
        } else {
            diesel::insert_into(crate::schema::collections::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn delete(_id: i32, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(collections.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }

    fn get_date() -> String {
        let local: DateTime<Local> = Local::now();
        local.to_string()
    }
}
