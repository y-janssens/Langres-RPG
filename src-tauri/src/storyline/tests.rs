#[cfg(test)]
mod tests {
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::{StoryLineFactory, WorldFactory};
    use crate::config::factory::factory_models::Factory;
    use crate::events::models::{Event, EventMode, EventStatus, EventType};
    use crate::objects::models::Object;
    use crate::storyline::models::Story;
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

        assert_eq!(storyline.story.acts[0].complete, false);

        for map in storyline.story.acts[0].content.maps.iter_mut() {
            map.complete = true;
        }

        storyline.story.acts[0].validate_acts();
        assert!(storyline.story.acts[0].complete);
    }

    #[test]
    fn test_register_gateway() {
        allow_db_access(|connection| {
            let _ = Story::register_gateway(
                connection,
                1323375008,
                1302422795,
                3,
                (Some(5325235), true),
            );

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
            let _ = Story::register_gateway(
                connection,
                1323375008,
                1302422795,
                3,
                (Some(5325235), true),
            );

            let response = Story::load(connection).unwrap();
            let tile = &response.story.acts[0].content.maps[0].content[3];
            assert_eq!(tile.events.len(), 1);

            let _ = Story::register_gateway(connection, 1323375008, 1302422795, 3, (None, true));

            let patched_ = Story::load(connection).unwrap();
            let patched_tile = &patched_.story.acts[0].content.maps[0].content[3];
            assert_eq!(patched_tile.events.len(), 0);
        });
    }

    #[test]
    fn test_register_checkpoint() {
        allow_db_access(|connection| {
            let _ = Story::register_checkpoint(connection, 1323375008, 1302422795, 3, Some(3));

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
            let _ = Story::register_checkpoint(connection, 1323375008, 1302422795, 3, Some(3));

            let response = Story::load(connection).unwrap();
            let tile = &response.story.acts[0].content.maps[0].content[3];
            assert_eq!(tile.events.len(), 1);

            let _ = Story::register_checkpoint(connection, 1323375008, 1302422795, 3, None);

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

            let _ = Story::register_object(connection, 1323375008, 1302422795, 3, object.id, true);

            let response = Story::load(connection).unwrap();
            let _tiles: Vec<Item> = response.story.acts[0].content.maps[0]
                .content
                .iter()
                .filter(|t| [1, 2, 3, 4, 5, 53, 103].contains(&t.id))
                .cloned()
                .collect();

            let expected_values = ["#", "#", &object.value.clone().unwrap(), "#", "#", "#", "#"];
            for (i, tile) in _tiles.iter().enumerate() {
                assert_eq!(tile.value, expected_values[i]);
                assert_eq!(tile.walkable, false);
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

            let _ = Story::register_object(connection, 1323375008, 1302422795, 3, object.id, false);

            let response = Story::load(connection).unwrap();
            let _tiles: Vec<Item> = response.story.acts[0].content.maps[0]
                .content
                .iter()
                .filter(|t| [1, 2, 3, 4, 5, 53, 103].contains(&t.id))
                .cloned()
                .collect();

            for tile in _tiles.iter() {
                assert_eq!(tile.value, "-");
                assert!(tile.walkable)
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
            println!("{:?}", error);
        });
    }
}
