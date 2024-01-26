#[cfg(test)]
pub mod tests {
    use crate::models::maps::procedural::generation::Map;
    use crate::models::maps::tiles::map_config_tiles::get_tiles_values;
    use crate::tests::factories::tests_factories::world_factory;
    use crate::tests::fixtures::tests_fixtures::*;

    #[test]
    fn test_map_generation() {
        let world = world_factory(Some("test"), Some(50));
        assert_eq!(world.name, "test");
        assert_eq!(world.size, 50);
        assert_eq!(world.content.len(), 2500);
    }

    #[test]
    fn test_procedural_map_generation_consistency() {
        let world = world_factory(Some("test"), Some(50));
        let map = Map::generate(world.content, "forest", false);

        for (_, item) in map.iter().enumerate() {
            let expected_values = get_tiles_values();
            assert!(expected_values.contains(&item.value));
            assert!(!["null"].contains(&item.value.as_str()));
        }

        render_map_output(map);
    }

    #[test]
    #[ignore]
    fn test_procedural_map_generation_batch_stress_test() {
        for _ in 0..=25 {
            let world = world_factory(Some("forest"), Some(50));
            let map = Map::generate(world.content, "forest", false);

            for (_, item) in map.iter().enumerate() {
                let expected_values = get_tiles_values();
                assert!(expected_values.contains(&item.value));
                assert!(!["null"].contains(&item.value.as_str()));
            }

            render_map_output(map);
        }
    }
}
