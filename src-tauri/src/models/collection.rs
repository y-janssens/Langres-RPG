#[allow(dead_code)]

pub mod collections {
    use crate::schema::maps::dsl::*;
    use crate::{models::world::maps::World, utils::factory::factory_models::AbstractModel};

    use diesel::{
        deserialize::{self, FromSql, Queryable},
        prelude::*,
        sql_types::Text,
        sqlite::{Sqlite, SqliteValue},
        QueryResult, RunQueryDsl, Selectable, SqliteConnection,
    };
    use serde::{Deserialize, Serialize};

    impl AbstractModel for InsertableCollection {}

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

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
    #[diesel(table_name = crate::schema::maps)]
    pub struct InsertableCollection {
        pub map: World,
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
        pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Collection>> {
            let mut _load: Vec<Collection> = crate::schema::maps::table.load(connection)?;
            Ok(_load)
        }

        pub fn patch(
            _id: i32,
            data: Collection,
            connection: &mut SqliteConnection,
        ) -> Result<(), diesel::result::Error> {
            let updated_json = serde_json::to_string(&data.map).map_err(|e| {
                diesel::result::Error::DatabaseError(
                    diesel::result::DatabaseErrorKind::UnableToSendCommand,
                    Box::new(e.to_string()),
                )
            })?;
            diesel::update(maps.find(_id))
                .set(crate::schema::maps::map.eq(&updated_json))
                .execute(connection)?;

            Ok(())
        }

        pub fn save(
            data: InsertableCollection,
            connection: &mut SqliteConnection,
        ) -> Result<(), diesel::result::Error> {
            let updated_json = serde_json::to_string(&data.map).map_err(|e| {
                diesel::result::Error::DatabaseError(
                    diesel::result::DatabaseErrorKind::UnableToSendCommand,
                    Box::new(e.to_string()),
                )
            })?;

            diesel::insert_into(crate::schema::maps::table)
                .values((crate::schema::maps::columns::map.eq(updated_json),))
                .execute(connection)?;

            Ok(())
        }

        pub fn delete(_id: i32, connection: &mut SqliteConnection) -> QueryResult<()> {
            diesel::delete(maps.filter(id.eq(_id))).execute(connection)?;
            Ok(())
        }
    }
}
