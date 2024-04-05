#[cfg(test)]
mod tests {
    use crate::config::factories::factories_definitions::StoryLineFactory;
    use crate::config::factory::factory_models::Factory;
    use crate::npcs::models::Npc;

    #[test]
    fn test_get_map_npcs() {
        let story = StoryLineFactory.generate();
        let map_id = story.story.acts[0].content.maps[0].clone().unwrap().id;
        let npcs = Npc::get_for_map(map_id.clone());

        for npc in npcs {
            assert_eq!(npc.map_id, map_id)
        }

        assert_eq(npcs[0].dialogs[0].fr, "Bonjour");
        assert_eq(npcs[0].dialogs[0].en, "Hello");
    }
}
