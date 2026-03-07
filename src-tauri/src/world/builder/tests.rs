#[cfg(test)]
mod tests {
    use rstest::*;
    use tokio::runtime::Runtime;

    use crate::backend::conf::factories::factories_definitions::WorldFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::world::values::Values;
    use crate::world::builder::options::GeneratorOptions;
    use crate::world::models::Options;
    use crate::world::settings::{DEFAULT_MAP_SIZE, DEFAULT_MAP_SIZE_GRID, EMPTY};

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
        let world = WorldFactory.generate();

        assert_eq!(world.name, "test");
        assert_eq!(world.size, *DEFAULT_MAP_SIZE);
        assert_eq!(world.content.len() as u32, *DEFAULT_MAP_SIZE_GRID);

        world.display_values();
    }

    #[rstest]
    #[case::none(None, false)]
    #[case::forest(Some(Options::generate("forest", None, None)), false)]
    #[case::swamp(Some(Options::generate("swamp", None, None)), false)]
    #[case::forest_town(Some(Options::generate("forest", Some("town".to_string()), None)), false)]
    #[case::swamp_shanty(Some(Options::generate("swamp", Some("shanty".to_string()), None)), false)]
    #[case::swamp_ground(Some(Options::generate("swamp", None, Some("ground".to_string()))), true)]
    async fn test_procedural_builder(#[case] options: Option<Options>, #[case] topologize: bool) {
        let rt = Runtime::new().unwrap();
        rt.block_on(async {
            let mut world = WorldFactory.generate();
            let _ = world.generate_content(options).await;

            for item in world.content.iter() {
                let expected_values = Values::get_tiles_values();
                let (display_value, _, _) = Values::get_value(&item.value);
                assert!(expected_values.contains(&item.value));
                assert!(&item.value != EMPTY.val());
                assert_eq!(item.display_value, display_value);
            }
            world.display_values();

            if topologize {
                world.display_topology();
            }
        });
    }
}
