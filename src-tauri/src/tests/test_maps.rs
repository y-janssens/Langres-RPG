#[cfg(test)]
pub mod tests_maps {
    use crate::models::maps::procedural::generation::Map;
    use crate::models::maps::tiles::map_config_tiles::get_tiles_values;
    use crate::tests::factories::tests_factories::world_factory;
    use crate::tests::fixtures::tests_fixtures::*;

    #[test]
    fn test_map_generation() {
        let size = 50;
        let world = world_factory("test", size);
        let expected_size = size * (size as f32 / 0.85).ceil() as u32;

        assert_eq!(world.name, "test");
        assert_eq!(world.size, size);
        assert_eq!(world.content.len() as u32, expected_size);

        render_map_output(world.content, size);
    }

    #[test]
    fn test_generate_forest() {
        let size = 50;
        let world = world_factory("test", size);
        let map = Map::generate(world.content, "forest");

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
        let world = world_factory("test", size);
        let map = Map::generate(world.content, "forest");

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
        for _ in 0..=25 {
            let world = world_factory("test", size);
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
