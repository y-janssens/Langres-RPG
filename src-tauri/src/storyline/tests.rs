#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::{StoryLineFactory, WorldFactory};
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::conf_tests::database::{allow_db_access, with_permissions};
    use crate::backend::permissions::models::Permission;
    use crate::backend::settings::errors::BASE_ERROR;
    use crate::events::models::{Event, EventMode, EventStatus, EventType};
    use crate::game::models::{Game, Position};
    use crate::objects::models::Object;
    use crate::storyline::models::Story;
    use crate::world::builder::settings::DEFAULT_MAP_SIZE;
    use crate::world::commands::generate;
    use crate::world::models::{Item, World};

    #[test]
    fn test_load_storyline() {
        allow_db_access(|connection| {
            let response = Story::load(connection).unwrap();

            assert_eq!(response.acts.len(), 1);
            assert_eq!(response.acts[0].name, "Act I");
            assert_eq!(response.acts[0].title, "Rétribution");
            assert_eq!(response.acts[0].maps.len(), 1);
        });
    }

    #[test]
    fn test_patch_storyline() {
        allow_db_access(|connection| {
            let response = Story::load(connection).unwrap();

            let mut maps = vec![];
            maps.push(WorldFactory.generate());
            maps.push(WorldFactory.generate());

            let mut patch_story = response.clone();
            patch_story.acts[0].maps.0 = maps;
            patch_story.save(connection).expect(BASE_ERROR);

            let patch_response = Story::load(connection).unwrap();

            assert_eq!(patch_response.acts.len(), 1);
            assert_eq!(patch_response.acts[0].name, "Act I");
            assert_eq!(patch_response.acts[0].title, "Rétribution");
            assert_eq!(patch_response.acts[0].maps.len(), 2);
        });
    }

    #[test]
    fn test_validate_act() {
        let mut storyline = StoryLineFactory.generate();

        assert!(!storyline.acts[0].complete);

        for map in storyline.acts[0].maps.iter_mut() {
            map.complete = true;
        }

        storyline.acts[0].validate_act();
        assert!(storyline.acts[0].complete);
    }

    #[test]
    fn test_edit_map_tiles() {
        allow_db_access(|connection| {
            let story = Story::load(connection).unwrap();

            let act = story.acts[0].clone();
            let map = act.maps[0].clone();

            let objects = Object::load(connection).expect(BASE_ERROR);
            let object = objects.iter().find(|it| it.name == "tree").cloned().expect(BASE_ERROR);

            Story::edit_tiles(connection, act.id, map.id, [3, 4, 5].to_vec(), object.id).expect(BASE_ERROR);

            let response = Story::load(connection).unwrap();
            let _tiles: Vec<Item> = response.acts[0].maps[0]
                .content
                .iter()
                .filter(|t| [3, 4, 5].contains(&t.id))
                .cloned()
                .collect();

            for tile in _tiles.iter() {
                assert_eq!(tile.value, "T");
                assert!(!tile.walkable);
            }
        });
    }

    #[test]
    fn test_reset_map_tile() {
        allow_db_access(|connection| {
            let story = Story::load(connection).unwrap();

            let objects = Object::load(connection).expect(BASE_ERROR);
            let object = objects.iter().find(|it| it.name == "water").cloned().expect(BASE_ERROR);

            let act = story.acts[0].clone();
            let map = act.maps[0].clone();

            Story::edit_tiles(connection, act.id, map.id, vec![1, 2, 3], object.id).expect(BASE_ERROR);

            let response = Story::load(connection).unwrap();
            let _tiles: Vec<Item> = response.acts[0].maps[0]
                .content
                .iter()
                .filter(|t| [1, 2, 3].contains(&t.id))
                .cloned()
                .collect();

            for tile in _tiles.iter() {
                assert_eq!(tile.value, "W");
                assert!(!tile.walkable);
            }

            Story::reset_tiles(connection, act.id, map.id, vec![1]).expect(BASE_ERROR);

            let response = Story::load(connection).unwrap();
            let _tiles: Vec<Item> = response.acts[0].maps[0]
                .content
                .iter()
                .filter(|t| [1].contains(&t.id))
                .cloned()
                .collect();

            for tile in _tiles.iter() {
                assert_eq!(tile.value, "-");
                assert!(tile.walkable);
            }
        });
    }

    #[test]
    fn test_delete_map_npc() {
        allow_db_access(|connection| {
            let mut story = Story::load(connection).unwrap();

            let act = story.acts[0].clone();
            let mut map = act.maps[0].clone();
            map.npcs = map.generate_npcs(connection).expect(BASE_ERROR);

            let _ = story.save(connection);

            let initial_npcs_count = map.npcs.len();
            let npc_to_delete = map.npcs[0].clone();

            let _ = Story::delete_tiles_npcs(connection, act.id, map.id, vec![npc_to_delete.starting_point.id]);
            let response = Story::load(connection).unwrap();

            let _act = response.acts[0].clone();
            let _map = _act.maps[0].clone();
            assert!(_map.npcs.len() == initial_npcs_count - 1)
        });
    }

    #[test]
    fn test_compute_map_tile_direction() {
        allow_db_access(|connection| {
            let story = Story::load(connection).unwrap();

            let objects = Object::load(connection).expect(BASE_ERROR);
            let water = objects.iter().find(|it| it.name == "water").cloned().expect(BASE_ERROR);
            let grass = objects.iter().find(|it| it.name == "shore").cloned().expect(BASE_ERROR);

            let act = story.acts[0].clone();
            let map = act.maps[0].clone();
            let tile = map.content.iter().find(|t| t.id == 50).unwrap();

            Story::edit_tiles(connection, act.id.clone(), map.id.clone(), tile.neighbours_ids.clone(), water.id).expect(BASE_ERROR);

            Story::edit_tiles(connection, act.id.clone(), map.id.clone(), vec![tile.id], grass.id).expect(BASE_ERROR);

            let response = Story::load(connection).unwrap();
            let _tiles: Vec<Item> = response.acts[0].maps[0]
                .content
                .iter()
                .filter(|t| [tile.id].contains(&t.id))
                .cloned()
                .collect();

            for tile in _tiles.iter() {
                assert!(tile.display_direction.is_none());
            }

            Story::compute_tiles_directions(connection, act.id, map.id, vec![tile.id]).expect(BASE_ERROR);

            let response = Story::load(connection).unwrap();
            let _tiles: Vec<Item> = response.acts[0].maps[0]
                .content
                .iter()
                .filter(|t| [tile.id].contains(&t.id))
                .cloned()
                .collect();

            for tile in _tiles.iter() {
                assert!(tile.display_direction.is_some());
            }
        });
    }

    #[test]
    fn test_register_gateway() {
        allow_db_access(|connection| {
            let story = Story::load(connection).unwrap();

            let act = story.acts[0].clone();
            let map = act.maps[0].clone();

            Story::register_gateway(connection, act.id, map.id, 3, (Some(5325235), true)).expect(BASE_ERROR);

            let response = Story::load(connection).unwrap();
            let tile = &response.acts[0].maps[0].content[3];
            let event = tile.events[0].clone();

            assert_eq!(tile.events.len(), 1);
            assert_eq!(
                event,
                Event {
                    id: event.id.clone(),
                    r#type: EventType::GateWay(5325235, true),
                    mode: EventMode::Automatic,
                    status: EventStatus::None,
                    destination: EventType::None
                }
            )
        });
    }

    #[test]
    fn test_unregister_gateway() {
        allow_db_access(|connection| {
            let story = Story::load(connection).unwrap();

            let act = story.acts[0].clone();
            let map = act.maps[0].clone();

            Story::register_gateway(connection, act.id, map.id, 3, (Some(5325235), true)).expect(BASE_ERROR);

            let response = Story::load(connection).unwrap();
            let tile = &response.acts[0].maps[0].content[3];
            assert_eq!(tile.events.len(), 1);

            Story::register_gateway(connection, act.id, map.id, 3, (None, true)).expect(BASE_ERROR);

            let patched_ = Story::load(connection).unwrap();
            let patched_tile = &patched_.acts[0].maps[0].content[3];
            assert_eq!(patched_tile.events.len(), 0);
        });
    }

    #[test]
    fn test_register_checkpoint() {
        allow_db_access(|connection| {
            let story = Story::load(connection).unwrap();

            let act = story.acts[0].clone();
            let map = act.maps[0].clone();

            Story::register_checkpoint(connection, act.id, map.id, 3, Some(3)).expect(BASE_ERROR);

            let response = Story::load(connection).unwrap();
            let tile = &response.acts[0].maps[0].content[3];
            let event = tile.events[0].clone();

            assert_eq!(tile.events.len(), 1);
            assert_eq!(
                event,
                Event {
                    id: event.id.clone(),
                    r#type: EventType::CheckPoint(3),
                    mode: EventMode::Automatic,
                    status: EventStatus::None,
                    destination: EventType::None
                }
            )
        });
    }

    #[test]
    fn test_unregister_checkpoint() {
        allow_db_access(|connection| {
            let story = Story::load(connection).unwrap();

            let act = story.acts[0].clone();
            let map = act.maps[0].clone();
            Story::register_checkpoint(connection, act.id, map.id, 3, Some(3)).expect(BASE_ERROR);

            let response = Story::load(connection).unwrap();
            let tile = &response.acts[0].maps[0].content[3];
            assert_eq!(tile.events.len(), 1);

            Story::register_checkpoint(connection, act.id, map.id, 3, None).expect(BASE_ERROR);

            let patched_ = Story::load(connection).unwrap();
            let patched_tile = &patched_.acts[0].maps[0].content[3];
            assert_eq!(patched_tile.events.len(), 0);
        });
    }

    #[test]
    fn test_register_object() {
        allow_db_access(|connection| {
            with_permissions(Permission::Admin, || {
                let mut story = Story::load(connection).unwrap();

                let act = story.acts[0].clone();

                let objects = Object::load(connection).expect(BASE_ERROR);
                let object = objects
                    .iter()
                    .find(|it| it.value == Some("H_2".to_string()))
                    .cloned()
                    .expect(BASE_ERROR);

                // Clear base map content for readability purposes
                let map = generate(DEFAULT_MAP_SIZE.clone(), "test".to_string(), 0, true).expect(BASE_ERROR);
                story.acts[0].maps[0] = serde_json::from_value(map.0).expect(BASE_ERROR);
                story.save(connection).expect(BASE_ERROR);

                let _ = Story::register_object(connection, act.id, story.acts[0].maps[0].id, 1369, object.id, true);

                let response = Story::load(connection).unwrap();
                let _map = response.acts[0].maps[0].clone();
                let expected_tiles = [
                    1267, 1268, 1269, 1270, 1271, 1317, 1318, 1319, 1320, 1321, 1367, 1368, 1370, 1371, 1417, 1418, 1419, 1420, 1421, 1467,
                    1468, 1469, 1470, 1471,
                ];

                let _tiles: Vec<Item> = _map.content.iter().filter(|t| expected_tiles.contains(&t.id)).cloned().collect();

                for tile in _tiles.iter() {
                    assert_eq!(tile.value, "#");
                    assert!(!tile.walkable);
                }
            });
        });
    }

    #[test]
    fn test_unregister_object() {
        allow_db_access(|connection| {
            with_permissions(Permission::Admin, || {
                let mut story = Story::load(connection).unwrap();

                let act = story.acts[0].clone();

                let objects = Object::load(connection).expect(BASE_ERROR);
                let object = objects.iter().find(|it| it.name == "house").cloned().expect(BASE_ERROR);

                // // Clear base map content for readability purposes
                let map = World::new(DEFAULT_MAP_SIZE.clone(), "test".to_string(), 0, true);
                story.acts[0].maps[0] = map.clone();
                story.save(connection).expect(BASE_ERROR);

                let _ = Story::register_object(connection, act.id, map.id, 1369, object.id, false);

                let response = Story::load(connection).unwrap();
                let _map = response.acts[0].maps[0].clone();
                let expected_tiles = [
                    1267, 1268, 1269, 1270, 1271, 1317, 1318, 1319, 1320, 1321, 1367, 1368, 1370, 1371, 1417, 1418, 1419, 1420, 1421, 1467,
                    1468, 1469, 1470, 1471,
                ];

                let _tiles: Vec<Item> = _map.content.iter().filter(|t| expected_tiles.contains(&t.id)).cloned().collect();

                for tile in _tiles.iter() {
                    assert_eq!(tile.value, "-");
                    assert!(tile.walkable);
                }
            });
        });
    }

    #[test]
    fn test_register_wrong_object() {
        allow_db_access(|connection| {
            let story = Story::load(connection).unwrap();

            let act = story.acts[0].clone();
            let map = act.maps[0].clone();

            let objects = Object::load(connection).expect(BASE_ERROR);
            let object = objects.iter().find(|it| it.name == "road").cloned().expect(BASE_ERROR);

            let response = Story::register_object(connection, act.id, map.id, 3, object.id, true);
            assert!(response.is_err());
        });
    }

    #[test]
    fn test_patch_storyline_and_edit_existing_games() {
        allow_db_access(|connection| {
            // Setup initial storyline and game
            let storyline = Story::load(connection).unwrap();
            let mut game = Game::new("test".to_string(), connection).expect(BASE_ERROR);
            game.last_known_position = Position::resolve((19.0, 14.0, 709));
            game.save(connection).unwrap();

            // Patch storyline
            let mut maps = storyline.acts[0].maps.clone();
            let map = storyline.acts[0].maps[0].content.clone();
            let tile = maps[0].content.iter_mut().find(|tile| tile.id == 709).unwrap();

            tile.value = "W".to_string();
            tile.display_value = "water".to_string();
            tile.walkable = false;

            assert_eq!(map[709].value, "-".to_string());
            assert_eq!(map[709].display_value, "grass".to_string());

            let mut patch_story = storyline.clone();
            patch_story.acts[0].maps = maps;
            patch_story.save(connection).expect(BASE_ERROR);

            // Retrieve patched storyline and check datas consistency
            let _act = Story::load(connection).unwrap().acts[0].clone();
            assert_eq!(&_act.maps[0].content[709].value, "W");
            assert_eq!(&_act.maps[0].content[709].display_value, "water");

            // Retrieve games and ensure that character has been properly moved
            let games = Game::fetch(connection).expect("Failed to fetch games");
            assert_eq!(games.len(), 1);
            assert!(games.iter().all(|game| game.last_known_position.id != 709));
            assert!(games[0].storyline.acts[0].maps[0].content[games[0].last_known_position.id as usize].walkable);
            assert_eq!(games[0].storyline.acts[0].maps[0].content[709].value, "W");
            assert_eq!(games[0].storyline.acts[0].maps[0].content[709].display_value, "water");
        });
    }
}
