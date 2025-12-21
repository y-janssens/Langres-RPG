use std::ops::{Deref, DerefMut};

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

use super::utils::StoryUtils;

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::storyline)]
#[diesel(check_for_backend(Sqlite))]
pub struct Story {
    pub id: i32,
    pub name: String,
    pub created: String,
    pub modified: String,
    pub acts: Acts,
}

#[derive(Debug, Insertable)]
#[diesel(table_name = crate::schema::storyline)]
pub struct InsertableStory {
    pub id: i32,
    pub name: String,
    pub created: String,
    pub modified: String,
    pub acts: String,
}

impl Default for Story {
    fn default() -> Self {
        Self {
            id: 0,
            name: String::new(),
            created: String::new(),
            modified: String::new(),
            acts: Acts(vec![]),
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Acts(pub Vec<Act>);

impl Deref for Acts {
    type Target = Vec<Act>;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl DerefMut for Acts {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Act {
    pub id: i32,
    pub order: u32,
    pub name: String,
    pub title: String,
    pub date: String,
    pub maps: Content,
    pub complete: bool,
}

impl Act {
    pub fn validate_act(&mut self) {
        let all_primary_maps_complete = self
            .maps
            .iter()
            .filter_map(Some)
            .filter(|map| map.primary)
            .all(|map| map.complete);

        if !self.maps.is_empty() && all_primary_maps_complete {
            self.complete = true;
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Content(pub Vec<World>);

impl Deref for Content {
    type Target = Vec<World>;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl DerefMut for Content {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

impl Story {
    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Story> {
        let mut _storyline: Story = crate::schema::storyline::table.first(connection)?;

        for act in _storyline.acts.iter_mut() {
            for map in act.maps.iter_mut() {
                map.npcs = Npc::get_for_map(map.id, connection)?;
            }
        }
        Ok(_storyline)
    }

    pub fn fetch(connection: &mut SqliteConnection) -> QueryResult<Vec<Self>> {
        let mut _storyline: Vec<Self> = crate::schema::storyline::table.load(connection)?;
        Ok(_storyline)
    }

    pub fn save(&mut self, connection: &mut SqliteConnection) -> Result<(), Error> {
        for act in self.acts.iter_mut() {
            act.validate_act();
        }
        let updated_json = serde_json::to_string(&self.acts)
            .map_err(|e| Error::DeserializationError(Box::new(e)))?;

        let _ = diesel::update(storyline.find(self.id))
            .set(crate::schema::storyline::acts.eq(updated_json.clone()))
            .execute(connection);

        Self::edit_existing_games(connection)?;
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

        StoryUtils::get_tile(act_id, map_id, tiles, false, connection, |tile, _| {
            if let Some(value) = &object.value {
                tile.edit(value.clone());
            }
        })
    }

    pub fn reset_tiles(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tiles: Vec<u32>,
    ) -> Result<(), Error> {
        StoryUtils::get_tile(act_id, map_id, tiles, false, connection, |tile, _| {
            tile.reset();
        })?;

        Ok(())
    }

    pub fn delete_tiles_npcs(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tiles: Vec<u32>,
    ) -> Result<(), Error> {
        let mut npcs = vec![];
        StoryUtils::get_map(act_id, map_id, false, connection, |map| {
            for npc in map.npcs.clone() {
                if tiles.contains(&npc.starting_point.id) {
                    npcs.push(npc);
                }
            }
        })?;

        for npc in npcs {
            npc.delete(connection)?;
        }

        Ok(())
    }

    pub fn compute_tiles_directions(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tiles: Vec<u32>,
    ) -> Result<(), Error> {
        StoryUtils::get_tile(act_id, map_id, tiles, false, connection, |tile, map| {
            let original_content = map.content.clone();
            let neighbours: Vec<Item> = original_content
                .iter()
                .filter(|it| tile.neighbours_ids.contains(&it.id))
                .cloned()
                .collect();

            tile.get_display_direction(&neighbours);
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
        StoryUtils::get_tile(
            act_id,
            map_id,
            [tile_id].to_vec(),
            false,
            connection,
            |tile, _| {
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
            },
        )?;
        Ok(())
    }

    pub fn register_checkpoint(
        connection: &mut SqliteConnection,
        act_id: i32,
        map_id: i32,
        tile_id: u32,
        checkpoint: Option<i32>,
    ) -> Result<(), Error> {
        StoryUtils::get_tile(
            act_id,
            map_id,
            [tile_id].to_vec(),
            false,
            connection,
            |tile, _| {
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
            },
        )?;
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
        let obj = Object::get(object_id, connection)?;
        if !obj.interactive {
            return Err(Error::SerializationError(
                format!("Object: {} is not registrable", object_id).into(),
            ));
        }
        StoryUtils::get_map(act_id, map_id, false, connection, |map| {
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
        })?;

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
        let obj = Object::get(object_id, connection)?;
        let mut result = Vec::new();
        StoryUtils::get_map(act_id, map_id, true, connection, |map| {
            result = FrustumCullingUtility::cull(
                tile_id as i32,
                map.size,
                obj.area.x as usize,
                obj.area.y as usize,
            )
        })?;
        Ok(result)
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
