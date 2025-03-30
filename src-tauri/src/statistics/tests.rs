#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::StatisticFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::tests::database::allow_db_access;
    use crate::backend::translations::models::Translations;
    use crate::statistics::models::Statistic;

    #[test]
    fn test_load_statistics() {
        allow_db_access(|connection| {
            let statistic = StatisticFactory.generate();
            let _ = statistic.save(connection);
            let result = Statistic::load(connection).unwrap();

            assert_eq!(result.len(), 1);
        });
    }

    #[test]
    fn test_patch_statistic() {
        allow_db_access(|connection| {
            let statistic = StatisticFactory.generate();
            let _ = statistic.save(connection);
            let result = Statistic::load(connection).unwrap();

            let mut patch_statistic = Statistic {
                id: result[0].clone().id,
                name: result[0].clone().name,
                description: result[0].clone().description,
                value: result[0].clone().value,
                visible: result[0].clone().visible,
            };

            patch_statistic.name = Translations::generate("nom", "name");

            let _ = patch_statistic.save(connection);
            let patch_result = Statistic::load(connection).unwrap();

            assert_eq!(patch_result[0].name.fr, Some("nom".to_string()));
            assert_eq!(patch_result[0].name.en, Some("name".to_string()));
        });
    }

    #[test]
    fn test_delete_statistic() {
        allow_db_access(|connection| {
            let statistic = StatisticFactory.generate();
            let _ = statistic.save(connection);
            let result = Statistic::load(connection).unwrap();

            let delete = Statistic::delete(result[0].clone().id, connection);

            assert!(delete.is_ok());
        });
    }
}
