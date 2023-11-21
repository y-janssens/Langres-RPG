#[allow(dead_code)]

pub mod objects {
    use diesel::{
        deserialize::{self, FromSql, Queryable},
        sql_types::Text,
        sqlite::{Sqlite, SqliteValue},
        QueryResult, RunQueryDsl, Selectable, SqliteConnection,
    };
    use serde::{Deserialize, Serialize};
    #[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
    #[diesel(table_name = crate::schema::objects)]
    #[diesel(check_for_backend(Sqlite))]
    pub struct Object {
        id: i32,
        name: String,
        value: Option<String>,
        area: Area,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Area {
        x: i32,
        y: i32,
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
        pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Object>> {
            let _load = crate::schema::objects::table.load(connection)?;
            Ok(_load)
        }
    }

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
    #[diesel(table_name = crate::schema::functions)]
    #[diesel(check_for_backend(Sqlite))]
    pub struct Function {
        id: i32,
        icon: String,
        label: String,
        command: String,
    }

    impl Function {
        pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Function>> {
            let _load = crate::schema::functions::table.load(connection)?;
            Ok(_load)
        }
    }
}
