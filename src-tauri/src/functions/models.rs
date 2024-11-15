use crate::{
    backend::conf::{
        factory::factory_models::AbstractModel,
        faker::faker_definitions::{Faker, IdFaker},
    },
    schema::functions::dsl::*,
};
use diesel::{
    deserialize::Queryable, prelude::*, sqlite::Sqlite, QueryResult, RunQueryDsl, Selectable,
    SqliteConnection,
};
use serde::{Deserialize, Serialize};

impl AbstractModel for Function {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::functions)]
#[diesel(check_for_backend(Sqlite))]
pub struct Function {
    pub id: i32,
    pub icon: String,
    pub label: String,
    pub command: String,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::functions)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableFunction {
    icon: String,
    label: String,
    command: String,
}

impl Function {
    pub fn new() -> Function {
        Function {
            id: IdFaker.generate().value(),
            icon: String::from(""),
            label: String::from(""),
            command: String::from(""),
        }
    }

    pub fn save(
        data: Function,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let insertable = InsertableFunction {
            icon: data.icon,
            label: data.label,
            command: data.command,
        };

        let exists = functions
            .filter(id.eq(data.id))
            .first::<Function>(connection)
            .is_ok();

        if exists {
            diesel::update(functions.find(data.id))
                .set(insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(crate::schema::functions::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Function>> {
        let _load = crate::schema::functions::table.load(connection)?;
        Ok(_load)
    }

    pub fn delete(_id: i32, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(functions.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
