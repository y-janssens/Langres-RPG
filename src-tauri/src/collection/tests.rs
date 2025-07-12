#[cfg(test)]
mod tests {

    use crate::backend::conf::factories::factories_definitions::CollectionFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::conf_tests::database::allow_db_access;
    use crate::collection::models::Collection;

    #[test]
    fn test_load_collections() {
        allow_db_access(|connection| {
            let collection = CollectionFactory.generate();
            let _ = collection.save(connection);
            let result = Collection::load(connection).unwrap();

            assert_eq!(result.len(), 1);
        });
    }

    #[test]
    fn test_patch_collection() {
        allow_db_access(|connection| {
            let collection = CollectionFactory.generate();
            let _ = collection.save(connection);
            let result = Collection::load(connection).unwrap();

            let mut patch_collection = Collection {
                id: result[0].id,
                created: result[0].clone().created,
                modified: result[0].clone().modified,
                visible: result[0].clone().visible,
                map: result[0].clone().map,
            };

            patch_collection.map.name = "loul".to_string();

            let _ = patch_collection.save(connection);
            let patch_result = Collection::load(connection).unwrap();

            assert_eq!(patch_result[0].map.name, "loul");
        });
    }

    #[test]
    fn test_delete_collection() {
        allow_db_access(|connection| {
            let collection = CollectionFactory.generate();
            let _ = collection.save(connection);
            let result = Collection::load(connection).unwrap();

            let delete = Collection::delete(result[0].id, connection);

            assert!(delete.is_ok());
        });
    }
}
