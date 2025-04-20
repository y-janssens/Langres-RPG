#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::WorldFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::settings::errors::BASE_ERROR;
    use crate::backend::tests::database::allow_db_access;
    use crate::npcs::models::Npc;
    use crate::storyline::models::Story;

    #[test]
    fn test_get_map_no_npcs() {
        allow_db_access(|connection| {
            let story = Story::load(connection).expect(BASE_ERROR);
            let map_id = story.story.acts[0].content.maps[0].clone().id;
            let npcs = Npc::get_for_map(map_id, connection);

            assert!(npcs.is_ok_and(|res| res.is_empty()));
        });
    }

    #[test]
    fn test_save_npc() {
        allow_db_access(|connection| {
            let world = WorldFactory.generate();
            let npc = Npc::get_zombie(world.id, (15.0, 32.0, 1607)).expect(BASE_ERROR);
            let _ = npc.save(connection);

            let npcs = Npc::get_for_map(world.id, connection);
            assert!(npcs.is_ok_and(|res| res.len() == 1));
        });
    }

    #[test]
    fn test_delete_npc() {
        allow_db_access(|connection| {
            let world = WorldFactory.generate();
            let npc = Npc::get_zombie(world.id, (15.0, 32.0, 1607)).expect(BASE_ERROR);

            let _ = npc.save(connection);

            let npcs = Npc::get_for_map(world.id, connection);
            assert!(npcs.is_ok_and(|res| res.len() == 1));

            let _ = npc.delete(connection);
            let npcs = Npc::get_for_map(world.id, connection);
            assert!(npcs.is_ok_and(|res| res.is_empty()));
        });
    }

    #[test]
    fn test_generate_map_npcs() {
        allow_db_access(|connection| {
            let world = WorldFactory.generate();
            let _ = world.generate_npcs(connection);

            let npcs = Npc::get_for_map(world.id, connection);
            assert!(npcs.is_ok_and(|res| !res.is_empty()));
        });
    }

    #[test]
    fn test_clear_map_npcs() {
        allow_db_access(|connection| {
            let world = WorldFactory.generate();
            let _ = world.generate_npcs(connection);

            let npcs = Npc::get_for_map(world.id, connection);
            assert!(npcs.is_ok_and(|res| !res.is_empty()));

            let _ = world.clear_npcs(connection);

            let npcs = Npc::get_for_map(world.id, connection);
            assert!(npcs.is_ok_and(|res| res.is_empty()));
        });
    }
}
