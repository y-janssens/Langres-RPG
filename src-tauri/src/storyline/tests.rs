#[cfg(test)]
mod tests {
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::{StoryLineFactory, WorldFactory};
    use crate::config::factory::factory_models::Factory;
    use crate::events::models::{Event, EventMode, EventStatus, EventType};
    use crate::objects::models::Object;
    use crate::storyline::models::Story;
    use crate::world::commands::generate;
    use crate::world::models::Item;

    #[test]
    fn test_load_storyline() {
        allow_db_access(|connection| {
            let response = Story::load(connection).unwrap();

            assert_eq!(response.story.acts.len(), 2);
            assert_eq!(response.story.acts[0].name, "Act I");
            assert_eq!(response.story.acts[0].title, "Rétribution");
            assert_eq!(response.story.acts[0].content.maps.len(), 1);
        });
    }

    #[test]
    fn test_patch_storyline() {
        allow_db_access(|connection| {
            let response = Story::load(connection).unwrap();

            let mut maps = vec![];
            maps.push(WorldFactory.generate());
            maps.push(WorldFactory.generate());

            let mut patch_data = response.clone();
            patch_data.story.acts[0].content.maps = maps;

            let _ = Story::save(connection, response.id, &mut patch_data);
            let patch_response = Story::load(connection).unwrap();

            assert_eq!(patch_response.story.acts.len(), 2);
            assert_eq!(patch_response.story.acts[0].name, "Act I");
            assert_eq!(patch_response.story.acts[0].title, "Rétribution");
            assert_eq!(patch_response.story.acts[0].content.maps.len(), 2);
        });
    }

    #[test]
    fn test_validate_act() {
        let mut storyline = StoryLineFactory.generate();

        assert!(!storyline.story.acts[0].complete);

        for map in storyline.story.acts[0].content.maps.iter_mut() {
            map.complete = true;
        }

        storyline.story.acts[0].validate_acts();
        assert!(storyline.story.acts[0].complete);
    }

    #[test]
    fn test_edit_map_tiles() {
        allow_db_access(|connection| {
            let objects = Object::load(connection).expect("Error");
            let object = objects
                .iter()
                .find(|it| it.name == "tree")
                .cloned()
                .expect("Error");

            Story::edit_tiles(
                connection,
                1323375008,
                1302422795,
                [3, 4, 5].to_vec(),
                object.id,
            );

            let response = Story::load(connection).unwrap();
            let _tiles: Vec<Item> = response.story.acts[0].content.maps[0]
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
    fn test_register_gateway() {
        allow_db_access(|connection| {
            Story::register_gateway(connection, 1323375008, 1302422795, 3, (Some(5325235), true));

            let response = Story::load(connection).unwrap();
            let tile = &response.story.acts[0].content.maps[0].content[3];
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
            Story::register_gateway(connection, 1323375008, 1302422795, 3, (Some(5325235), true));

            let response = Story::load(connection).unwrap();
            let tile = &response.story.acts[0].content.maps[0].content[3];
            assert_eq!(tile.events.len(), 1);

            Story::register_gateway(connection, 1323375008, 1302422795, 3, (None, true));

            let patched_ = Story::load(connection).unwrap();
            let patched_tile = &patched_.story.acts[0].content.maps[0].content[3];
            assert_eq!(patched_tile.events.len(), 0);
        });
    }

    #[test]
    fn test_register_checkpoint() {
        allow_db_access(|connection| {
            Story::register_checkpoint(connection, 1323375008, 1302422795, 3, Some(3));

            let response = Story::load(connection).unwrap();
            let tile = &response.story.acts[0].content.maps[0].content[3];
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
            Story::register_checkpoint(connection, 1323375008, 1302422795, 3, Some(3));

            let response = Story::load(connection).unwrap();
            let tile = &response.story.acts[0].content.maps[0].content[3];
            assert_eq!(tile.events.len(), 1);

            Story::register_checkpoint(connection, 1323375008, 1302422795, 3, None);

            let patched_ = Story::load(connection).unwrap();
            let patched_tile = &patched_.story.acts[0].content.maps[0].content[3];
            assert_eq!(patched_tile.events.len(), 0);
        });
    }

    #[test]
    fn test_register_object() {
        allow_db_access(|connection| {
            let objects = Object::load(connection).expect("Error");
            let object = objects
                .iter()
                .find(|it| it.name == "house")
                .cloned()
                .expect("Error");

            let mut story = Story::load(connection).unwrap();
            // Clear base map content for readability purposes
            let map = generate(50, "test".to_string(), 0, true);
            story.story.acts[0].content.maps[0] = map;
            let _ = Story::save(connection, story.id, &mut story);

            let _ = Story::register_object(
                connection,
                1323375008,
                story.story.acts[0].content.maps[0].id,
                1369,
                object.id,
                true,
            );

            let response = Story::load(connection).unwrap();
            let _map = response.story.acts[0].content.maps[0].clone();
            let expected_tiles = [
                1267, 1268, 1269, 1270, 1271, 1317, 1318, 1319, 1320, 1321, 1367, 1368, 1370, 1371,
                1417, 1418, 1419, 1420, 1421, 1467, 1468, 1469, 1470, 1471,
            ];

            let _tiles: Vec<Item> = _map
                .content
                .iter()
                .filter(|t| expected_tiles.contains(&t.id))
                .cloned()
                .collect();

            for tile in _tiles.iter() {
                assert_eq!(tile.value, "#");
                assert!(!tile.walkable);
            }
        });
    }

    #[test]
    fn test_unregister_object() {
        allow_db_access(|connection| {
            let objects = Object::load(connection).expect("Error");
            let object = objects
                .iter()
                .find(|it| it.name == "house")
                .cloned()
                .expect("Error");

            let mut story = Story::load(connection).unwrap();
            // Clear base map content for readability purposes
            let map = generate(50, "test".to_string(), 0, true);
            story.story.acts[0].content.maps[0] = map;
            let _ = Story::save(connection, story.id, &mut story);

            let _ = Story::register_object(
                connection,
                1323375008,
                story.story.acts[0].content.maps[0].id,
                1369,
                object.id,
                false,
            );

            let response = Story::load(connection).unwrap();
            let _map = response.story.acts[0].content.maps[0].clone();
            let expected_tiles = [
                1267, 1268, 1269, 1270, 1271, 1317, 1318, 1319, 1320, 1321, 1367, 1368, 1370, 1371,
                1417, 1418, 1419, 1420, 1421, 1467, 1468, 1469, 1470, 1471,
            ];

            let _tiles: Vec<Item> = _map
                .content
                .iter()
                .filter(|t| expected_tiles.contains(&t.id))
                .cloned()
                .collect();

            for tile in _tiles.iter() {
                assert_eq!(tile.value, "-");
                assert!(tile.walkable);
            }
        });
    }

    #[test]
    fn test_register_wrong_object() {
        allow_db_access(|connection| {
            let objects = Object::load(connection).expect("Error");
            let object = objects
                .iter()
                .find(|it| it.name == "road")
                .cloned()
                .expect("Error");

            let response =
                Story::register_object(connection, 1323375008, 1302422795, 3, object.id, true);
            let error = response.unwrap_err().message;
            assert_eq!(error, format!("Object: {} is not registrable", object.id));
        });
    }
}
