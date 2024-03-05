#[cfg(test)]
mod tests {
    use crate::models::story::storyline::Story;
    use crate::tests::conf::test_conf::allow_db_access;
    use crate::utils::factories::factories_definitions::WorldFactory;
    use crate::utils::factory::factory_models::Factory;

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
            maps.push(Some(WorldFactory.generate()));
            maps.push(Some(WorldFactory.generate()));

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
}
