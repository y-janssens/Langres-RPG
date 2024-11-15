#[cfg(test)]
mod tests {
    use crate::loot::models::Loot;
    use crate::backend::conf::factories::factories_definitions::LootFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::tests::database::allow_db_access;

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
            patch_loot.price = Some(112);

            let _ = Loot::save(patch_loot, connection);
            let patch_result = Loot::load(connection).unwrap();

            assert_eq!(patch_result[0].clone().price, result[0].clone().price);
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
