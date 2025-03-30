use diesel::result::Error;
use diesel::{prelude::*, sqlite::Sqlite};
use serde::{Deserialize, Serialize};

use crate::backend::utils::models::FrustumCullingUtility;
use crate::events::models::{Event, EventType};
use crate::game::models::Game;
use crate::npcs::models::Npc;
use crate::objects::models::Object;
use crate::schema::storyline::dsl::storyline;
use crate::world::models::{Item, World};

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
    pub fn validate_act(&mut self) {
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

    pub fn save(&mut self, connection: &mut SqliteConnection) -> Result<(), Error> {
        for act in self.story.acts.iter_mut() {
            act.validate_act();
        }
        let updated_json = serde_json::to_string(&self.story.acts)
            .map_err(|e| Error::DeserializationError(Box::new(e)))?;

        let _ = diesel::update(storyline.find(self.id))
            .set(crate::schema::storyline::story.eq(updated_json.clone()))
            .execute(connection);

        Self::edit_existing_games(connection)?;
        Ok(())
    }

    fn find_tile<F>(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tiles: Vec<u32>,
        operation: F,
    ) -> Result<(), Error>
    where
        F: FnMut(&mut Item),
    {
        let mut story = Self::load(connection)?;

        if let Some(map) = story
            .story
            .acts
            .iter_mut()
            .find(|act| act.id == act_id)
            .and_then(|act| act.content.maps.iter_mut().find(|map| map.id == map_id))
        {
            map.content
                .iter_mut()
                .filter(|tile| tiles.contains(&tile.id))
                .for_each(operation);
            map.compute_directions();
            story.save(connection)?;
        };
        Ok(())
    }

    pub fn edit_tiles(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tiles: Vec<u32>,
        object_id: i32,
    ) -> Result<(), Error> {
        let object = Object::get(object_id, connection)?;

        Self::find_tile(connection, act_id, map_id, tiles, |tile| {
            if let Some(value) = &object.value {
                tile.value = value.to_string();
            }
            tile.walkable = object.walkable;
        })?;

        Ok(())
    }

    pub fn register_gateway(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        gateway: (Option<i32>, bool),
    ) -> Result<(), Error> {
        Self::find_tile(connection, act_id, map_id, [tile_id].to_vec(), |tile| {
            if let Some(gateway_id) = gateway.0 {
                let gateway_event = Event::get_gateway(gateway_id, gateway.1);
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
        })?;
        Ok(())
    }

    pub fn register_checkpoint(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        checkpoint: Option<i32>,
    ) -> Result<(), Error> {
        Self::find_tile(connection, act_id, map_id, [tile_id].to_vec(), |tile| {
            if let Some(checkpoint_id) = checkpoint {
                let checkpoint_event = Event::get_checkpoint(checkpoint_id);
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
        })?;
        Ok(())
    }

    pub fn register_object(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        object_id: i32,
        enable: bool,
    ) -> Result<(), Error> {
        let mut story = Self::load(connection)?;

        let map = story
            .story
            .acts
            .iter_mut()
            .find(|act| act.id == act_id)
            .and_then(|act| act.content.maps.iter_mut().find(|map| map.id == map_id))
            .ok_or(Error::NotFound)?;

        let obj = Object::get(object_id, connection)?;

        if !obj.interactive {
            return Err(Error::SerializationError(
                format!("Object: {} is not registrable", object_id).into(),
            ));
        }
        // Use FrustumCullingUtility to filter tiles based on object's area instead of expanding from tile
        let neighbours_ids = FrustumCullingUtility::cull(
            tile_id as i32,
            map.size,
            obj.area.x as usize,
            obj.area.y as usize,
        );

        for _tile in map
            .content
            .iter_mut()
            .filter(|t| neighbours_ids.contains(&(t.id as i32)))
        {
            if enable {
                _tile.value = if _tile.id == tile_id {
                    obj.value.clone().unwrap_or_else(|| String::from("#"))
                } else {
                    String::from("#")
                };
                _tile.walkable = false;
                _tile.events = [].to_vec();
            } else {
                _tile.value = String::from("-");
                _tile.walkable = true;
            }
        }

        story.save(connection)?;
        Ok(())
    }

    /// Use FrustumCullingUtility to filter tiles based on object's area instead of expanding from tile
    pub fn get_neighbours_ids(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        object_id: i32,
    ) -> Result<Vec<i32>, Error> {
        let mut story = Self::load(connection)?;

        let map = story
            .story
            .acts
            .iter_mut()
            .find(|act| act.id == act_id)
            .and_then(|act| act.content.maps.iter_mut().find(|map| map.id == map_id))
            .ok_or(Error::NotFound)?;

        let obj = Object::get(object_id, connection)?;
        Ok(FrustumCullingUtility::cull(
            tile_id as i32,
            map.size,
            obj.area.x as usize,
            obj.area.y as usize,
        ))
    }

    fn edit_existing_games(connection: &mut SqliteConnection) -> Result<(), Error> {
        let mut games = Game::fetch(connection)?;
        let _games = games.iter_mut().filter(|g| g.visible);
        _games.for_each(|game| {
            let _ = game.patch_game_storyline(connection);
        });
        Ok(())
    }
}
