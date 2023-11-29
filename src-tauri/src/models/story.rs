#[allow(dead_code)]

pub mod story {
    use crate::models::world::world::World;
    use crate::schema::storyline::dsl::storyline;
    use diesel::deserialize::{self, FromSql};
    use diesel::sql_types::Text;
    use diesel::sqlite::SqliteValue;
    use diesel::{prelude::*, sqlite::Sqlite};
    use serde::{Deserialize, Serialize};

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
    #[diesel(table_name = crate::schema::storyline)]
    #[diesel(check_for_backend(Sqlite))]
    pub struct Story {
        id: i32,
        story: Acts,
    }

    impl FromSql<Text, Sqlite> for Story {
        fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
            let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
            serde_json::from_str(&tstr)
                .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
        }
    }

    impl Queryable<Text, Sqlite> for Story {
        type Row = String;
        fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
            serde_json::from_str(&row)
                .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
        }
    }

    impl Queryable<Text, Sqlite> for Acts {
        type Row = Acts;

        fn build(
            row: Acts,
        ) -> Result<Acts, Box<(dyn serde::ser::StdError + Send + Sync + 'static)>> {
            Ok(row)
        }
    }

    impl FromSql<Text, Sqlite> for Acts {
        fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
            let t = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
            let acts: Vec<Act> = serde_json::from_str(&t)
                .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)?;
            Ok(Acts { acts })
        }
    }

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
    pub struct Acts {
        acts: Vec<Act>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
    pub struct Act {
        id: i32,
        order: u32,
        name: String,
        title: String,
        content: Content,
        complete: bool,
    }

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
    pub struct Content {
        maps: Vec<Option<World>>,
    }

    impl Story {
        pub fn load(connection: &mut SqliteConnection) -> QueryResult<Story> {
            let _load = crate::schema::storyline::table.first(connection)?;
            Ok(_load)
        }

        pub fn save(
            connection: &mut SqliteConnection,
            id: i32,
            data: &Story,
        ) -> QueryResult<usize> {
            let updated_json = serde_json::to_string(&data.story.acts).map_err(|e| {
                diesel::result::Error::DatabaseError(
                    diesel::result::DatabaseErrorKind::UnableToSendCommand,
                    Box::new(e.to_string()),
                )
            })?;
            diesel::update(storyline.find(id))
                .set(crate::schema::storyline::story.eq(updated_json))
                .execute(connection)
        }
    }
}
