#[cfg(test)]
mod tests {
    use crate::loot::models::Loot;
    use crate::loot::table::models::TableLoot;
    use crate::loot::table::tables::FIRST_TABLE;
    use crate::settings::factories::factories_definitions::LootFactory;
    use crate::settings::factory::factory_models::Factory;
    use crate::settings::tests::database::allow_db_access;

    #[test]
    fn test_generate_loot_table() {
        allow_db_access(|connection| {
            for _ in 0..25 {
                let loot = LootFactory.generate();
                let _ = Loot::save(loot, connection);
            }
            let table = TableLoot::generate(None, connection);
            assert!(table.len() <= 5);
        });
    }

    #[test]
    fn test_generate_predefined_loot_table() {
        allow_db_access(|connection| {
            let table = TableLoot::generate(Some("test".to_string()), connection);

            assert!(table.len() == 2);
            assert_eq!(table.clone()[0], FIRST_TABLE.table.items[0]);
            assert_eq!(table.clone()[1], FIRST_TABLE.table.items[1]);
        });
    }
}
