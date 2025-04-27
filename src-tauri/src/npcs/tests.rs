#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::WorldFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::settings::errors::BASE_ERROR;
    use crate::backend::tests::database::allow_db_access;
    use crate::backend::translations::models::Translations;
    use crate::character::models::Inventory;
    use crate::game::models::Position;
    use crate::npcs::models::{Class, Gender, Npc, NpcDialogs, NpcQuests};
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
            let npc = Npc::new(world.id, (15.0, 32.0, 1607)).expect(BASE_ERROR);
            let _ = npc.save(connection);

            let npcs = Npc::get_for_map(world.id, connection);
            assert!(npcs.is_ok_and(|res| res.len() == 1));
        });
    }

    #[test]
    fn test_save_unique_npc() {
        allow_db_access(|connection| {
            let world = WorldFactory.generate();
            let npc = Npc {
                id: "123".to_string(),
                first_name: "Jean".to_string(),
                last_name: "Test".to_string(),
                title: Translations::generate("Chef", "Chief"),
                class: Class::Merchant,
                end: 8,
                r#for: 8,
                hab: 8,
                cha: 8,
                int: 8,
                ini: 8,
                pv: 100,
                level: 1,
                gender: Gender::Male,
                map_id: world.id,
                unique: false, // Saving will reset non unique parameters
                r#static: true,
                hostile: false,
                is_alive: true,
                can_be_hostile: true,
                inventory: Inventory::new(),
                quests: NpcQuests::empty(),
                dialogs: NpcDialogs::empty(),
                starting_point: Position::resolve((15.0, 32.0, 1607)),
            };

            let _ = npc.save(connection);
            let patched_npc = Npc::load(npc.id, connection);

            assert!(patched_npc.is_ok_and(|npc| !npc.unique
                && npc.inventory.head.is_none()
                && npc.inventory.torso.is_none()
                && npc.inventory.legs.is_none()
                && npc.inventory.right_hand.is_none()
                && npc.inventory.left_hand.is_none()));
        });
    }

    #[test]
    fn test_delete_npc() {
        allow_db_access(|connection| {
            let world = WorldFactory.generate();
            let npc = Npc::new(world.id, (15.0, 32.0, 1607)).expect(BASE_ERROR);

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
