#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::LootFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::tests::database::allow_db_access;
    use crate::loot::models::Loot;

    #[test]
    fn test_load_loots() {
        allow_db_access(|connection| {
            let result = Loot::load(connection);
            assert!(result.is_ok());
        });
    }

    #[test]
    fn test_patch_loot() {
        allow_db_access(|connection| {
            let loot = LootFactory.generate();
            let _ = loot.save(connection);
            let result = Loot::load(connection).unwrap();

            let mut patch_loot = LootFactory.generate();
            patch_loot.price = Some(112);

            let _ = patch_loot.save(connection);
            let patch_result = Loot::load(connection).unwrap();

            assert_eq!(patch_result[0].clone().price, result[0].clone().price);
        });
    }

    #[test]
    fn test_delete_loot() {
        allow_db_access(|connection| {
            let loot = LootFactory.generate();
            let _ = loot.save(connection);
            let result = Loot::load(connection).unwrap();

            let delete = Loot::delete(result[0].clone().id, connection);

            assert!(delete.is_ok());
        });
    }
}
