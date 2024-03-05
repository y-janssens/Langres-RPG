#[cfg(test)]
mod tests {
    use crate::utils::factories::factories_definitions::StoryLineFactory;
    use crate::utils::factory::factory_models::Factory;

    #[test]
    fn test_validate_act() {
        let mut storyline = StoryLineFactory.generate();

        assert_eq!(storyline.story.acts[0].complete, false);

        for map_option in storyline.story.acts[0].content.maps.iter_mut() {
            if let Some(map) = map_option {
                map.complete = true;
            }
        }

        storyline.story.acts[0].validate_acts();
        assert_eq!(storyline.story.acts[0].complete, true);
    }
}
