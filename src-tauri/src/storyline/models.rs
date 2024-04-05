use crate::config::factory::factory_models::AbstractModel;
use crate::npcs::models::Npc;
use crate::schema::storyline::dsl::storyline;
use crate::world::models::World;
use diesel::deserialize::{self, FromSql};
use diesel::sql_types::Text;
use diesel::sqlite::SqliteValue;
use diesel::{prelude::*, sqlite::Sqlite};
use serde::{Deserialize, Serialize};

impl AbstractModel for Story {}
impl AbstractModel for Acts {}
impl AbstractModel for Act {}
impl AbstractModel for Content {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::storyline)]
#[diesel(check_for_backend(Sqlite))]
pub struct Story {
    pub id: i32,
    pub name: String,
    pub created: String,
    pub modified: String,
    pub story: Acts,
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

    fn build(row: Acts) -> Result<Acts, Box<(dyn serde::ser::StdError + Send + Sync + 'static)>> {
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
    pub acts: Vec<Act>,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Act {
    pub id: i32,
    pub order: u32,
    pub name: String,
    pub title: String,
    pub date: String,
    pub content: Content,
    pub complete: bool,
}

impl Act {
    pub fn validate_acts(&mut self) {
        let all_primary_maps_complete = self
            .content
            .maps
            .iter()
            .filter_map(|map_option| map_option.as_ref())
            .filter(|map| map.primary)
            .all(|map| map.complete);

        if all_primary_maps_complete {
            self.complete = true;
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Content {
    pub maps: Vec<Option<World>>,
}

impl Story {
    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Story> {
        let mut _storyline: Story = crate::schema::storyline::table.first(connection)?;

        for act in _storyline.story.acts.iter_mut() {
            for map in act.content.maps.iter_mut().flatten() {
                map.npcs = Npc::get_for_map(map.id);
            }
        }
        Ok(_storyline)
    }

    pub fn save(
        connection: &mut SqliteConnection,
        id: i32,
        data: &mut Story,
    ) -> QueryResult<usize> {
        for act in data.story.acts.iter_mut() {
            act.validate_acts();
        }
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
