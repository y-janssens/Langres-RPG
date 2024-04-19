use crate::config::factory::factory_models::AbstractModel;
use crate::events::models::{Event, EventType};
use crate::npcs::models::Npc;
use crate::schema::storyline::dsl::storyline;
use crate::world::models::{Item, World};
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
            .filter_map(Some)
            .filter(|map| map.primary)
            .all(|map| map.complete);

        if !self.content.maps.is_empty() && all_primary_maps_complete {
            self.complete = true;
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Content {
    pub maps: Vec<World>,
}

impl Story {
    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Story> {
        let mut _storyline: Story = crate::schema::storyline::table.first(connection)?;

        for act in _storyline.story.acts.iter_mut() {
            for map in act.content.maps.iter_mut() {
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

    fn find_tile<F>(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        mut operation: F,
    ) where
        F: FnMut(&mut Item) + std::panic::UnwindSafe,
    {
        let mut story = Self::load(connection).expect("Failed to load Story");

        let result = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {
            story
                .story
                .acts
                .iter_mut()
                .find(|act| act.id == act_id)
                .and_then(|act| act.content.maps.iter_mut().find(|map| map.id == map_id))
                .and_then(|map| map.content.iter_mut().find(|tile| tile.id == tile_id))
                .map(&mut operation);
        }));

        Self::save(connection, story.id, &mut story).expect("Failed to save Story");

        if let Err(e) = result {
            std::panic::resume_unwind(e);
        }
    }

    pub fn register_gateway(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        gateway: (Option<i32>, bool),
    ) {
        Self::find_tile(connection, act_id, map_id, tile_id, |tile| {
            if let Some(gateway_id) = gateway.0 {
                let gateway_event = Event::get_gateway(Some(gateway_id), gateway.1);
                let pos = tile
                    .events
                    .iter()
                    .position(|event| matches!(event.r#type, EventType::GateWay(_, _)));
                match pos {
                    Some(idx) => tile.events[idx] = gateway_event,
                    None => tile.events.push(gateway_event),
                }
            } else {
                tile.events
                    .retain(|event| !matches!(event.r#type, EventType::GateWay(_, _)));
            }
        });
    }

    pub fn register_checkpoint(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        checkpoint: Option<i32>,
    ) {
        Self::find_tile(connection, act_id, map_id, tile_id, |tile| {
            if let Some(checkpoint_id) = checkpoint {
                let checkpoint_event = Event::get_checkpoint(Some(checkpoint_id));
                let pos = tile
                    .events
                    .iter()
                    .position(|event| matches!(event.r#type, EventType::CheckPoint(_)));
                match pos {
                    Some(idx) => tile.events[idx] = checkpoint_event,
                    None => tile.events.push(checkpoint_event),
                }
            } else {
                tile.events
                    .retain(|event| !matches!(event.r#type, EventType::CheckPoint(_)));
            }
        });
    }
}
