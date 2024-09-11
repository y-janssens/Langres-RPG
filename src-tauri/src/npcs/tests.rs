#[cfg(test)]
mod tests {
    use crate::config::conf::test_conf::allow_db_access;
    use crate::npcs::models::Npc;
    use crate::npcs::named::SER_HERBERT;
    use crate::storyline::models::Story;

    #[test]
    fn test_get_map_npcs() {
        allow_db_access(|connection| {
            let story = Story::load(connection).expect("Error");
            let map_id = story.story.acts[0].content.maps[0].clone().id;
            let npcs = Npc::get_for_map(map_id);

            for npc in npcs.clone() {
                assert_eq!(npc.map_id, map_id)
            }
        });
    }

    #[test]
    fn test_generate_npc_dialogs() {
        let npc = SER_HERBERT.clone();

        assert_eq!(npc.dialogs.npc[0].order, 0);
        assert_eq!(npc.dialogs.player[0].order, 1);
        assert_eq!(npc.dialogs.npc[1].order, 2);
        assert_eq!(npc.dialogs.player[1].order, 3);
    }
}
