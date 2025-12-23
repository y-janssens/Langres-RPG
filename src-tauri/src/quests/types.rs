use diesel::{deserialize::Queryable, sql_types::Text, sqlite::Sqlite};

use super::models::Status;

impl Queryable<Text, Sqlite> for Status {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row).map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}
