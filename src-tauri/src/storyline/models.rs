use crate::schema::acts::dsl::*;
use crate::schema::storyline::dsl::*;
use diesel::{prelude::*, sqlite::Sqlite};
use serde::{Deserialize, Serialize};

use crate::backend::utils::errors::ValidationError;
use crate::backend::utils::models::FrustumCullingUtility;
use crate::events::models::{Event, EventType};
use crate::game::models::Game;
use crate::objects::models::Object;
use crate::world::models::{Item, World};

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, AsChangeset)]
#[diesel(table_name = crate::schema::storyline)]
#[diesel(check_for_backend(Sqlite))]
pub struct Story {
    pub id: i32,
    pub name: String,
    pub created: String,
    pub modified: String,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, AsChangeset)]
#[diesel(table_name = crate::schema::acts)]
#[diesel(check_for_backend(Sqlite))]
pub struct Act {
    pub id: i32,
    pub order: i32,
    pub name: String,
    pub title: String,
    pub date: String,
    pub complete: bool,
    pub storyline_id: i32,
}

impl Act {
    pub fn validate_acts(&mut self, connection: &mut SqliteConnection) {
        let maps: Vec<World> = crate::schema::maps::table
            .filter(crate::schema::maps::act_id.eq(self.id))
            .load(connection)
            .expect("Error loading maps");

        let all_primary_maps_complete = maps
            .iter()
            .filter_map(Some)
            .filter(|map| map.primary)
            .all(|map| map.complete);

        if !maps.is_empty() && all_primary_maps_complete {
            self.complete = true;
            self.clone().save(connection);
        }
    }

    pub fn save(self, connection: &mut SqliteConnection) {
        diesel::update(acts.find(self.id))
            .set(self)
            .execute(connection)
            .map(|_| ());
    }
}

impl Story {
    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Story> {
        let mut _storyline: Story = crate::schema::storyline::table.first(connection)?;

        // TODO FIX
        // for act in _storyline.story.acts.iter_mut() {
        //     for map in act.content.maps.iter_mut() {
        //         map.npcs = Npc::get_for_map(map.id);
        //     }
        // }
        Ok(_storyline)
    }

    pub fn save(connection: &mut SqliteConnection, _id: i32, data: Story) {
        let mut _acts: Vec<Act> = crate::schema::acts::table
            .filter(crate::schema::acts::storyline_id.eq(_id))
            .load(connection)
            .expect("Error loading acts");

        for act in _acts.iter_mut() {
            act.validate_acts(connection);
        }
        diesel::update(storyline.find(_id))
            .set(data)
            .execute(connection)
            .map(|_| ());

        Self::edit_existing_games(connection);
    }

    fn find_tile<F>(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tiles: Vec<u32>,
        operation: F,
    ) where
        F: FnMut(&mut Item),
    {
        let mut story = Self::load(connection).expect("Failed to load Story");
        let _acts: Vec<Act> = crate::schema::acts::table
            .filter(crate::schema::acts::storyline_id.eq(story.id))
            .load(connection)
            .expect("Error loading acts");

        let acts_ids: Vec<i32> = _acts.iter().map(|ac| ac.id).collect();

        let map: World = crate::schema::maps::table
            .find(map_id)
            .get_result(connection)
            .expect("Error loading map");

        map.content
            .iter_mut()
            .filter(|tile| tiles.contains(&tile.id))
            .for_each(operation);

        Self::save(connection, story.id, story).expect("Failed to save Story");
    }

    pub fn edit_tiles(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tiles: Vec<u32>,
        object_id: i32,
    ) {
        let object = Object::get(object_id, connection).expect("Failed to get object");

        Self::find_tile(connection, act_id, map_id, tiles, |tile| {
            if object.value.is_some() {
                tile.value = object.value.clone().unwrap();
            }
            tile.walkable = object.walkable;
        });
    }

    pub fn register_gateway(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        gateway: (Option<i32>, bool),
    ) {
        Self::find_tile(connection, act_id, map_id, [tile_id].to_vec(), |tile| {
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
        Self::find_tile(connection, act_id, map_id, [tile_id].to_vec(), |tile| {
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

    pub fn register_object(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        object_id: i32,
        enable: bool,
    ) -> Result<(), ValidationError> {
        let mut story = Self::load(connection).expect("Failed to load Story");

        let map = story
            .story
            .acts
            .iter_mut()
            .find(|act| act.id == act_id)
            .and_then(|act| act.content.maps.iter_mut().find(|map| map.id == map_id))
            .expect("Failed to get map");

        let obj = Object::get(object_id, connection).expect("Failed to get object");

        if !obj.interactive {
            return Err(ValidationError(format!(
                "Object: {} is not registrable",
                object_id
            )));
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
                    obj.value.clone().unwrap()
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

        Self::save(connection, story.id, &mut story).expect("Failed to save Story");
        Ok(())
    }

    /// Use FrustumCullingUtility to filter tiles based on object's area instead of expanding from tile
    pub fn get_neighbours_ids(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        object_id: i32,
    ) -> Vec<i32> {
        let story = Self::load(connection).expect("Failed to load Story");
        let map = story
            .story
            .acts
            .iter()
            .find(|act| act.id == act_id)
            .and_then(|act| act.content.maps.iter().find(|map| map.id == map_id))
            .expect("Failed to get map");

        let obj = Object::get(object_id, connection).expect("Failed to get object");
        FrustumCullingUtility::cull(
            tile_id as i32,
            map.size,
            obj.area.x as usize,
            obj.area.y as usize,
        )
    }

    fn edit_existing_games(connection: &mut SqliteConnection) {
        let mut games = Game::fetch(connection).expect("Failed to fetch games");
        let _games = games.iter_mut().filter(|g| g.visible);
        _games.for_each(|game| game.patch_game_storyline(connection));
    }
}
