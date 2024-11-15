use crate::{
    schema::objects::dsl::*,
    settings::{
        factory::factory_models::AbstractModel,
        faker::faker_definitions::{Faker, IdFaker},
    },
};
use diesel::{
    deserialize::{self, FromSql, Queryable},
    prelude::*,
    sql_types::Text,
    sqlite::{Sqlite, SqliteValue},
    QueryResult, RunQueryDsl, Selectable, SqliteConnection,
};
use serde::{Deserialize, Serialize};

impl AbstractModel for Object {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::objects)]
#[diesel(check_for_backend(Sqlite))]
pub struct Object {
    pub id: i32,
    pub name: String,
    pub value: Option<String>,
    pub area: Area,
    pub walkable: bool,
    pub interactive: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::objects)]
pub struct InsertableObject {
    name: String,
    value: Option<String>,
    area: String,
    walkable: bool,
    interactive: bool,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Area {
    pub x: i32,
    pub y: i32,
}

impl FromSql<Text, Sqlite> for Area {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Area {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Object {
    pub fn new() -> Object {
        Object {
            id: IdFaker.generate().value(),
            name: String::from(""),
            value: None,
            area: Area { x: 0, y: 0 },
            walkable: false,
            interactive: false,
        }
    }

    pub fn save(
        data: Object,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let area_json = serde_json::to_string(&data.area).expect("error");

        let insertable = InsertableObject {
            name: data.name,
            value: data.value,
            area: area_json,
            walkable: data.walkable,
            interactive: data.interactive,
        };

        let exists = objects
            .filter(id.eq(data.id))
            .first::<Object>(connection)
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

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Object>> {
        let _load = crate::schema::objects::table.load(connection)?;
        Ok(_load)
    }

    pub fn get(_id: i32, connection: &mut SqliteConnection) -> QueryResult<Object> {
        let object: Self = objects.find(_id).first(connection)?;
        Ok(object)
    }

    pub fn delete(_id: i32, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(objects.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
