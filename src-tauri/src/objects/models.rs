use crate::schema::objects::dsl::*;
use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, QueryResult, RunQueryDsl, Selectable,
    SqliteConnection,
};
use serde::{Deserialize, Serialize};

use crate::backend::conf::faker::faker_definitions::{Faker, IdFaker};
use crate::backend::settings::errors::BASE_ERROR;

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::objects)]
#[diesel(check_for_backend(Sqlite))]
pub struct Object {
    pub id: i32,
    pub name: String,
    pub value: Option<String>,
    pub display_value: Option<String>,
    pub display_color: Option<String>,
    pub area: Area,
    pub walkable: bool,
    pub interactive: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::objects)]
pub struct InsertableObject {
    name: String,
    value: Option<String>,
    display_value: Option<String>,
    display_color: Option<String>,
    area: String,
    walkable: bool,
    interactive: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Area {
    pub x: i32,
    pub y: i32,
}

impl Default for Object {
    fn default() -> Self {
        Self::new()
    }
}

impl Object {
    pub fn new() -> Self {
        Self {
            id: IdFaker.generate().value(),
            name: String::from(""),
            value: None,
            display_value: None,
            display_color: None,
            area: Area { x: 0, y: 0 },
            walkable: false,
            interactive: false,
        }
    }

    pub fn save(
        data: Self,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let area_json = serde_json::to_string(&data.area).expect(BASE_ERROR);

        let insertable = InsertableObject {
            name: data.name,
            value: data.value,
            display_value: data.display_value,
            display_color: data.display_color,
            area: area_json,
            walkable: data.walkable,
            interactive: data.interactive,
        };

        let exists = objects
            .filter(id.eq(data.id))
            .first::<Self>(connection)
            .is_ok();

        if exists {
            diesel::update(objects.find(data.id))
                .set(insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(crate::schema::objects::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Self>> {
        let _load = crate::schema::objects::table.load(connection)?;
        Ok(_load)
    }

    pub fn get(_id: i32, connection: &mut SqliteConnection) -> QueryResult<Self> {
        let object: Self = objects.find(_id).first(connection)?;
        Ok(object)
    }

    pub fn delete(_id: i32, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(objects.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
