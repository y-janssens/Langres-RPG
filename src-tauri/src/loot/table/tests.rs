#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::LootFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::settings::errors::BASE_ERROR;
    use crate::backend::tests::database::allow_db_access;
    use crate::loot::table::models::TableLoot;
    use crate::loot::table::tables::FIRST_TABLE;

    #[test]
    fn test_generate_loot_table() {
        allow_db_access(|connection| {
            for _ in 0..25 {
                let loot = LootFactory.generate();
                let _ = loot.save(connection);
            }
            let table = TableLoot::generate(None, connection).expect(BASE_ERROR);
            assert!(table.len() <= 5);
        });
    }

    #[test]
    fn test_generate_predefined_loot_table() {
        allow_db_access(|connection| {
            let table =
                TableLoot::generate(Some("test".to_string()), connection).expect(BASE_ERROR);

            assert!(table.len() == 2);
            assert_eq!(table.clone()[0], FIRST_TABLE.table.items[0]);
            assert_eq!(table.clone()[1], FIRST_TABLE.table.items[1]);
        });
    }
}
