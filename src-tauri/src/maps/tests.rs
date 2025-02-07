#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::WorldFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::fixtures::tests_fixtures::*;
    use crate::maps::config::Values;
    use crate::maps::models::Map;
    use crate::maps::options::GeneratorOptions;
    use crate::maps::settings::DEFAULT_MAP_SIZE;
    use crate::world::models::{Item, Options};

    #[test]
    fn test_load_generator_options() {
        let options = GeneratorOptions::load();

        assert!(options.types.len() > 1);
        assert!(options.actions.len() > 1);
        assert!(options.post_actions.len() > 1);
        assert_eq!(options.default_sizes.len(), 4);
    }

    #[test]
    fn test_map_generation() {
        let size = *DEFAULT_MAP_SIZE;
        let world = WorldFactory.generate();
        let expected_size = size * (size as f32 / 0.85).ceil() as u32;

        assert_eq!(world.name, "test");
        assert_eq!(world.size, size);
        assert_eq!(world.content.len() as u32, expected_size);

        render_map_output(world.content, size);
    }

    #[test]
    fn test_generate_forest() {
        let size = *DEFAULT_MAP_SIZE;
        let world = WorldFactory.generate();
        let options = Options {
            r#type: "forest".to_string(),
            action: None,
            post_action: None,
            // post_action: Some("ground".to_string()),
        };
        let map = Map::generate(world.content, options);

        get_map_results(map.clone());
        render_map_output(map, size);
    }

    #[test]
    fn test_generate_swamp() {
        let size = *DEFAULT_MAP_SIZE;
        let world = WorldFactory.generate();
        let options = Options {
            r#type: "swamp".to_string(),
            action: None,
            post_action: None,
        };
        let map = Map::generate(world.content, options);

        get_map_results(map.clone());
        render_map_output(map, size);
    }

    #[test]
    fn test_generate_town() {
        let size = *DEFAULT_MAP_SIZE;
        let world = WorldFactory.generate();
        let options = Options {
            r#type: "forest".to_string(),
            action: Some("town".to_string()),
            post_action: None,
        };
        let map = Map::generate(world.content, options);

        get_map_results(map.clone());
        render_map_output(map, size);
    }

    #[test]
    fn test_generate_swamp_village() {
        let size = *DEFAULT_MAP_SIZE;
        let world = WorldFactory.generate();
        let options = Options {
            r#type: "swamp".to_string(),
            action: Some("shanty".to_string()),
            post_action: None,
        };
        let map = Map::generate(world.content, options);

        get_map_results(map.clone());
        render_map_output(map, size);
    }

    #[test]
    fn test_procedural_map_generation_topology() {
        let size = *DEFAULT_MAP_SIZE;
        let world = WorldFactory.generate();
        let options = Options {
            r#type: "forest".to_string(),
            action: None,
            post_action: Some("ground".to_string()),
        };
        let map = Map::generate(world.content, options);

        get_map_results(map.clone());
        render_map_output(map.clone(), size);
        render_map_topology(map.clone(), size);
    }

    #[test]
    #[ignore]
    fn test_procedural_map_generation_batch_stress_test() {
        let size = *DEFAULT_MAP_SIZE;
        for _ in 0..=size {
            let world = WorldFactory.generate();
            let options = Options {
                r#type: "forest".to_string(),
                action: None,
                post_action: None,
            };
            let map = Map::generate(world.content, options);

            get_map_results(map.clone());
            render_map_output(map.clone(), size);
        }
    }
    fn get_map_results(map: Vec<Item>) {
        for (_, item) in map.iter().enumerate() {
            let expected_values = Values::get_tiles_values();
            let (display_value, _, _) = Values::get_value(&item.value);
            assert!(expected_values.contains(&item.value));
            assert!(!["null"].contains(&item.value.as_str()));
            assert_eq!(item.display_value, display_value);
        }
    }
}
