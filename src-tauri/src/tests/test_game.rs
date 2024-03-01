#[cfg(test)]
pub mod tests_game {
    use crate::models::game::games::Game;
    use crate::tests::factories::tests_factories::storyline_factory;
    use crate::tests::fixtures::tests_fixtures::compute_map_size;

    #[test]
    fn test_create_game() {
        let map_name = "test";
        let act_name = "first";
        let act_title = "act";
        let act_date = "12/07/1163";

        let story = storyline_factory(act_name, act_title, act_date, map_name);
        let game = Game::new("test".to_string(), story);
        let map = game.storyline.story.acts[0].content.maps[0]
            .as_ref()
            .expect("Expected a map, found None");

        assert_eq!(game.player, "test");
        assert_eq!(game.save_count, 0);
        assert_eq!(game.character.name, "test");
        assert_eq!(game.last_known_position.x, 0.0);
        assert_eq!(game.last_known_position.y, 0.0);
        assert_eq!(game.last_known_position.id, 0);

        assert_eq!(game.storyline.story.acts.len(), 1);
        assert_eq!(game.storyline.story.acts[0].name, act_name);
        assert_eq!(game.storyline.story.acts[0].title, act_title);
        assert_eq!(game.storyline.story.acts[0].date, act_date);
        assert_eq!(game.storyline.story.acts[0].content.maps.len(), 2);

        assert_eq!(map.name, map_name);
        assert_eq!(map.content.len() as u32, compute_map_size(map.size));
    }
}
