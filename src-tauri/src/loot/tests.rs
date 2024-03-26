#[cfg(test)]
mod tests {
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::LootFactory;
    use crate::config::factory::factory_models::Factory;
    use crate::loot::models::Loot;

    #[test]
    fn test_load_loots() {
        allow_db_access(|connection| {
            let loot = LootFactory.generate();
            let _ = Loot::save(loot, connection);
            let result = Loot::load(connection).unwrap();

            assert_eq!(result.len(), 1);
        });
    }

    #[test]
    fn test_patch_loot() {
        allow_db_access(|connection| {
            let loot = LootFactory.generate();
            let _ = Loot::save(loot, connection);
            let result = Loot::load(connection).unwrap();

            let mut patch_loot = LootFactory.generate();
            patch_loot.id = result[0].clone().id;

            let _ = Loot::save(patch_loot, connection);
            let patch_result = Loot::load(connection).unwrap();

            assert_eq!(patch_result[0].id, result[0].id);
            assert_ne!(patch_result[0], result[0]);
            assert_ne!(patch_result[0].clone().item, result[0].clone().item);
        });
    }

    #[test]
    fn test_delete_loot() {
        allow_db_access(|connection| {
            let loot = LootFactory.generate();
            let _ = Loot::save(loot, connection);
            let result = Loot::load(connection).unwrap();

            let delete = Loot::delete(result[0].clone().id, connection);

            assert!(delete.is_ok());
        });
    }
}
