#[cfg(test)]
mod tests {
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::LootFactory;
    use crate::config::factory::factory_models::Factory;
    use crate::loot::models::Loot;
    use crate::loot::table::models::TableLoot;
    use crate::loot::table::tables::FIRST_TABLE;

    #[test]
    fn test_generate_loot_table() {
        allow_db_access(|connection| {
            for _ in 0..25 {
                let loot = LootFactory.generate();
                let _ = Loot::save(loot, connection);
            }
            let table = TableLoot::generate(None, connection);
            let expected_types = vec![
                "gold".to_string(),
                "weapon".to_string(),
                "equipment".to_string(),
                "craftable".to_string(),
                "thrash".to_string(),
            ];
            assert!(table.len() <= 5);

            for item in table.clone() {
                assert!(expected_types.contains(&item.item_type))
            }
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
