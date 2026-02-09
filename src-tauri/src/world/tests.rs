#[cfg(test)]
mod tests {
    use std::collections::HashMap;

    use crate::backend::conf::factories::factories_definitions::WorldFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::world::builder::models::Map;
    use crate::world::directions::Directions;
    use crate::world::models::{Item, Options};
    use crate::world::settings::DIRECTIONAL_VALUES;

    #[test]
    fn test_get_map_directions() {
        let mut world = WorldFactory.generate();
        world.content = Map::generate(world.content, Options::default());
        world.compute_directions();
        world.display_directions();

        let items_with_directions: Vec<Item> = world
            .content
            .into_iter()
            .filter(|it| DIRECTIONAL_VALUES.clone().contains(&it.value.as_str()))
            .collect();

        assert!(items_with_directions.into_iter().all(|it| it.display_direction.is_some()))
    }

    #[test]
    fn test_get_map_sample_directions() {
        let mut world = WorldFactory.generate();

        //                                    MAP SAMPLE
        //         ╭───────╮───────╮───────╮───────╮───────╮───────╮───────╮───────╮
        //         │ 1411  │ 1412  │ 1413  │ 1414  │ 1415  │ 1416  │ 1417  │ 1418  │
        //         │   S   │   S   │   S   │   S   │   S   │   S   │   S   │   S   │
        //     ╭───╰───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮
        //     │ 1461  │ 1462  │ 1463  │ 1464  │ 1465  │ 1466  │ 1467  │ 1468  │ 1469  │
        //     │   S   │   W   │   W   │   W   │   W   │   W   │   W   │   W   │   S   │
        // ╭───╰───╭───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮
        // │ 1510  │ 1511  │ 1512  │ 1513  │ 1514  │ 1515  │ 1516  │ 1517  │ 1518  │ 1519  │
        // │   S   │   W   │   W   │   W   │   W   │   W   │   W   │   W   │   W   │   S   │
        // ╰───╭───╰───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯
        //     │ 1561  │ 1562  │ 1563  │ 1564  │ 1565  │ 1566  │ 1567  │ 1568  │ 1569  │
        //     │   S   │   W   │   W   │   W   │   W   │   W   │   W   │   W   │   S   │
        //     ╰───╭───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯
        //         │ 1611  │ 1612  │ 1613  │ 1614  │ 1615  │ 1616  │ 1617  │ 1618  │
        //         │   S   │   S   │   S   │   S   │   S   │   S   │   S   │   S   │
        //         ╰───────╯───────╯───────╯───────╯───────╯───────╯───────╯───────╯
        //
        //                                 DIRECTIONS RESULT
        //         ╭───────╮───────╮───────╮───────╮───────╮───────╮───────╮───────╮
        //         │ 1411  │ 1412  │ 1413  │ 1414  │ 1415  │ 1416  │ 1417  │ 1418  │
        //         │   ↘   │   ↓   │   ↓   │   ↓   │   ↓   │   ↓   │   ↓   │   ↙   │
        //     ╭───╰───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮
        //     │ 1461  │ 1462  │ 1463  │ 1464  │ 1465  │ 1466  │ 1467  │ 1468  │ 1469  │
        //     │   →   │       │       │       │       │       │       │       │   ←   │
        // ╭───╰───╭───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮
        // │ 1510  │ 1511  │ 1512  │ 1513  │ 1514  │ 1515  │ 1516  │ 1517  │ 1518  │ 1519  │
        // │   →   │       │       │       │       │       │       │       │       │   ←   │
        // ╰───╭───╰───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯
        //     │ 1561  │ 1562  │ 1563  │ 1564  │ 1565  │ 1566  │ 1567  │ 1568  │ 1569  │
        //     │   →   │       │       │       │       │       │       │       │   ←   │
        //     ╰───╭───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯
        //         │ 1611  │ 1612  │ 1613  │ 1614  │ 1615  │ 1616  │ 1617  │ 1618  │
        //         │   ↗   │   ↑   │   ↑   │   ↑   │   ↑   │   ↑   │   ↑   │   ↖   │
        //         ╰───────╯───────╯───────╯───────╯───────╯───────╯───────╯───────╯

        let shore_tiles: HashMap<u32, &str> = HashMap::from([
            // Item id - Expected output
            (1411, "bottom_right"),
            (1412, "bottom"),
            (1413, "bottom"),
            (1414, "bottom"),
            (1415, "bottom"),
            (1416, "bottom"),
            (1417, "bottom"),
            (1418, "bottom_left"),
            (1461, "right"),
            (1469, "left"),
            (1510, "right"),
            (1519, "left"),
            (1561, "right"),
            (1569, "left"),
            (1611, "top_right"),
            (1612, "top"),
            (1613, "top"),
            (1614, "top"),
            (1615, "top"),
            (1616, "top"),
            (1617, "top"),
            (1618, "top_left"),
        ]);

        let water_tiles = Vec::from([
            1462, 1463, 1464, 1465, 1466, 1467, 1468, 1511, 1512, 1513, 1514, 1515, 1516, 1517, 1518, 1562, 1563, 1564, 1565, 1566, 1567,
            1568,
        ]);

        world.content.iter_mut().for_each(|i| match i.id {
            id if shore_tiles.contains_key(&id) => i.value = "S".to_string(),
            id if water_tiles.contains(&id) => i.value = "W".to_string(),
            _ => (),
        });

        world.compute_directions();
        world.display_directions();

        for (id, result) in shore_tiles {
            assert!(world.content[id as usize]
                .display_direction
                .clone()
                .is_some_and(|dir| dir.output.is_some_and(|output| output == result)));
        }

        for id in water_tiles {
            assert!(world.content[id as usize].display_direction.clone().is_none());
        }
    }

    #[test]
    fn test_get_item_directions_none() {
        let mut world = WorldFactory.generate();

        let _ = world.content.iter_mut().for_each(|i| match i.id {
            411 => i.value = "S".to_string(),
            _ => (),
        });

        world.compute_directions();
        let item = world.content.iter().find(|it| it.id == 411).unwrap();

        assert!(item.display_direction.is_none());
    }

    #[test]
    fn test_get_item_direction() {
        let mut world = WorldFactory.generate();

        //     ╭───────╮───────╮          ╭───────╮───────╮
        //     │  361  │  362  │          │       │       │
        //     │   -   │   -   │          │       │       │
        // ╭───╰───╮───╯───╮───╯───╮  ╭───╰───╮───╯───╮───╯───╮
        // │  410  │  411  │  412  │  │       │   →   │  412  │
        // │   -   │   S   │   W   │  │       │ right │   W   │
        // ╰───╭───╯───╮───╯───╮───╯  ╰───╭───╯───╮───╯───╮───╯
        //     │  461  │  462  │          │       │       │
        //     │   -   │   -   │          │       │       │
        //     ╰───────╯───────╯          ╰───────╯───────╯

        let _ = world.content.iter_mut().for_each(|i| match i.id {
            411 => i.value = "S".to_string(),
            412 => i.value = "W".to_string(),
            _ => (),
        });
        world.compute_directions();
        world.display_directions();
        let item = world.content.iter().find(|it| it.id == 411).unwrap();
        assert!(item
            .display_direction
            .clone()
            .is_some_and(|dir| dir.output.is_some_and(|output| output == "right")));
    }

    #[test]
    fn test_compute_map_directions_with_custom_values() {
        let mut world = WorldFactory.generate();

        //                                    MAP SAMPLE
        //         ╭───────╮───────╮───────╮───────╮───────╮───────╮───────╮───────╮
        //         │ 1411  │ 1412  │ 1413  │ 1414  │ 1415  │ 1416  │ 1417  │ 1418  │
        //         │   S   │   S   │   S   │   S   │   S   │   S   │   S   │   S   │
        //     ╭───╰───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮
        //     │ 1461  │ 1462  │ 1463  │ 1464  │ 1465  │ 1466  │ 1467  │ 1468  │ 1469  │
        //     │   S   │   W   │   W   │   W   │   W   │   W   │   W   │   W   │   S   │
        // ╭───╰───╭───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮
        // │ 1510  │ 1511  │ 1512  │ 1513  │ 1514  │ 1515  │ 1516  │ 1517  │ 1518  │ 1519  │
        // │   S   │   W   │   W   │   W   │   W   │   W   │   W   │   W   │   W   │   S   │
        // ╰───╭───╰───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯
        //     │ 1561  │ 1562  │ 1563  │ 1564  │ 1565  │ 1566  │ 1567  │ 1568  │ 1569  │
        //     │   S   │   W   │   W   │   W   │   W   │   W   │   W   │   W   │   S   │
        //     ╰───╭───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯
        //         │ 1611  │ 1612  │ 1613  │ 1614  │ 1615  │ 1616  │ 1617  │ 1618  │
        //         │   S   │   S   │   S   │   S   │   S   │   S   │   S   │   S   │
        //         ╰───────╯───────╯───────╯───────╯───────╯───────╯───────╯───────╯
        //
        //                                 DIRECTIONS RESULT
        //         ╭───────╮───────╮───────╮───────╮───────╮───────╮───────╮───────╮
        //         │ 1411  │ 1412  │ 1413  │ 1414  │ 1415  │ 1416  │ 1417  │ 1418  │
        //         │   ↑   │   ↑   │   ↓   │   ↓   │   ↓   │   ↓   │   ↓   │   ↙   │
        //     ╭───╰───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮
        //     │ 1461  │ 1462  │ 1463  │ 1464  │ 1465  │ 1466  │ 1467  │ 1468  │ 1469  │
        //     │   →   │       │       │       │       │       │       │       │   ←   │
        // ╭───╰───╭───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮
        // │ 1510  │ 1511  │ 1512  │ 1513  │ 1514  │ 1515  │ 1516  │ 1517  │ 1518  │ 1519  │
        // │   →   │       │       │       │       │       │       │       │       │   ←   │
        // ╰───╭───╰───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯
        //     │ 1561  │ 1562  │ 1563  │ 1564  │ 1565  │ 1566  │ 1567  │ 1568  │ 1569  │
        //     │   →   │       │       │       │       │       │       │       │   ←   │
        //     ╰───╭───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯───╮───╯
        //         │ 1611  │ 1612  │ 1613  │ 1614  │ 1615  │ 1616  │ 1617  │ 1618  │
        //         │   ↗   │   ↑   │   ↑   │   ↑   │   ↑   │   ↑   │   ↑   │   ↖   │
        //         ╰───────╯───────╯───────╯───────╯───────╯───────╯───────╯───────╯

        let shore_tiles: HashMap<u32, &str> = HashMap::from([
            // Item id - Expected output
            (1411, "top"), // CUSTOM VALUE
            (1412, "top"), // CUSTOM VALUE
            (1413, "bottom"),
            (1414, "bottom"),
            (1415, "bottom"),
            (1416, "bottom"),
            (1417, "bottom"),
            (1418, "bottom_left"),
            (1461, "right"),
            (1469, "left"),
            (1510, "right"),
            (1519, "left"),
            (1561, "right"),
            (1569, "left"),
            (1611, "top_right"),
            (1612, "top"),
            (1613, "top"),
            (1614, "top"),
            (1615, "top"),
            (1616, "top"),
            (1617, "top"),
            (1618, "top_left"),
        ]);

        let water_tiles = Vec::from([
            1462, 1463, 1464, 1465, 1466, 1467, 1468, 1511, 1512, 1513, 1514, 1515, 1516, 1517, 1518, 1562, 1563, 1564, 1565, 1566, 1567,
            1568,
        ]);

        world.content.iter_mut().for_each(|i| match i.id {
            id if shore_tiles.contains_key(&id) => i.value = "S".to_string(),
            id if water_tiles.contains(&id) => i.value = "W".to_string(),
            _ => (),
        });

        world.content[1411].display_direction = Some(Directions {
            values: None,
            output: Some("top".to_string()),
            custom: true,
        });
        world.content[1412].display_direction = Some(Directions {
            values: None,
            output: Some("top".to_string()),
            custom: true,
        });

        world.compute_directions();
        world.display_directions();

        for (id, result) in shore_tiles {
            assert!(world.content[id as usize]
                .display_direction
                .clone()
                .is_some_and(|dir| dir.output.is_some_and(|output| output == result)));
        }

        for id in water_tiles {
            assert!(world.content[id as usize].display_direction.clone().is_none());
        }
    }
}
