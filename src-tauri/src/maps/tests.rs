#[cfg(test)]
mod tests {
    use crate::config::factories::factories_definitions::WorldFactory;
    use crate::config::factory::factory_models::Factory;
    use crate::config::fixtures::tests_fixtures::*;
    use crate::maps::models::Map;
    use crate::maps::tiles::get_tiles_values;

    #[test]
    fn test_map_generation() {
        let size = 50;
        let world = WorldFactory.generate();
        let expected_size = size * (size as f32 / 0.85).ceil() as u32;

        assert_eq!(world.name, "test");
        assert_eq!(world.size, size);
        assert_eq!(world.content.len() as u32, expected_size);

        render_map_output(world.content, size);
    }

    #[test]
    fn test_generate_forest() {
        let size = 50;
        let world = WorldFactory.generate();
        let map = Map::generate(world.content, "forest");

        for (_, item) in map.iter().enumerate() {
            let expected_values = get_tiles_values();
            assert!(expected_values.contains(&item.value));
            assert!(!["null"].contains(&item.value.as_str()));
        }

        render_map_output(map, size);
    }

    #[test]
    fn test_generate_swamp() {
        let size = 50;
        let world = WorldFactory.generate();
        let map = Map::generate(world.content, "swamp");

        for (_, item) in map.iter().enumerate() {
            let expected_values = get_tiles_values();
            assert!(expected_values.contains(&item.value));
            assert!(!["null"].contains(&item.value.as_str()));
        }

        render_map_output(map, size);
    }

    #[test]
    fn test_generate_town() {
        let size = 50;
        let world = WorldFactory.generate();
        let map = Map::generate(world.content, "town");

        for (_, item) in map.iter().enumerate() {
            let expected_values = get_tiles_values();
            assert!(expected_values.contains(&item.value));
            assert!(!["null"].contains(&item.value.as_str()));
        }

        render_map_output(map, size);
    }

    #[test]
    fn test_procedural_map_generation_topology() {
        let size = 50;
        let world = WorldFactory.generate();
        let map = Map::generate(world.content, "town");

        for (_, item) in map.iter().enumerate() {
            let expected_values = get_tiles_values();
            assert!(expected_values.contains(&item.value));
            assert!(!["null"].contains(&item.value.as_str()));

            // if item.value == "W" {
            //     assert!(item.z == 0)
            // }
        }

        render_map_output(map.clone(), size);
        render_map_topology(map, size);
    }

    #[test]
    #[ignore]
    fn test_procedural_map_generation_batch_stress_test() {
        let size = 50;
        for _ in 0..=50 {
            let world = WorldFactory.generate();
            let map = Map::generate(world.content, "forest");

            for (_, item) in map.iter().enumerate() {
                let expected_values = get_tiles_values();
                assert!(expected_values.contains(&item.value));
                assert!(!["null"].contains(&item.value.as_str()));
            }

            render_map_output(map, size);
        }
    }
}
