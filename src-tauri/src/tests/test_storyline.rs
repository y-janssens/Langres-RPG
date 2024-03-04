#[cfg(test)]
mod tests {
    use crate::tests::factories::test_factories::storyline_factory;

    #[test]
    fn test_validate_act() {
        let map_name = "test";
        let act_name = "first";
        let act_title = "act";
        let act_date = "12/07/1163";

        let mut storyline = storyline_factory(act_name, act_title, act_date, map_name);

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
