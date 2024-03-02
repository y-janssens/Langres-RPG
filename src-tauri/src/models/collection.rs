#[allow(dead_code)]

pub mod collections {
    use crate::models::world::maps::World;

    use diesel::deserialize::{self, FromSql};
    use diesel::sql_types::Text;
    use diesel::sqlite::SqliteValue;
    use diesel::{prelude::*, sqlite::Sqlite};
    use serde::{Deserialize, Serialize};

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
    #[diesel(table_name = crate::schema::maps)]
    #[diesel(check_for_backend(Sqlite))]
    pub struct Collection {
        pub collection: Option<Elements>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Elements {
        pub maps: Vec<World>,
    }

    impl FromSql<Text, Sqlite> for Elements {
        fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
            let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
            serde_json::from_str(&tstr)
                .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
        }
    }

    impl Queryable<Text, Sqlite> for Elements {
        type Row = String;
        fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
            serde_json::from_str(&row)
                .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
        }
    }
}
