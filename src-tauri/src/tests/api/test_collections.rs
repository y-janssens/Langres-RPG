#[cfg(test)]
mod tests {
    use crate::models::collection::collections::Collection;
    use crate::tests::conf::test_conf::*;
    use crate::tests::factories::test_factories::collection_factory;

    #[test]
    fn test_load_collections() {
        allow_db_access(|connection| {
            let _ = Collection::save(collection_factory("test"), connection);
            let result = Collection::load(connection).unwrap();

            assert_eq!(result.len(), 1);
            assert_eq!(result[0].map.name, "test");
        });
    }

    #[test]
    fn test_patch_collection() {
        allow_db_access(|connection| {
            let _ = Collection::save(collection_factory("test"), connection);
            let result = Collection::load(connection).unwrap();

            let mut patch_collection = Collection {
                id: result[0].id,
                map: result[0].clone().map,
            };

            patch_collection.map.name = "loul".to_string();

            let _ = Collection::patch(result[0].id, patch_collection, connection);
            let patch_result = Collection::load(connection).unwrap();

            assert_eq!(patch_result[0].map.name, "loul");
        });
    }

    #[test]
    fn test_delete_collection() {
        allow_db_access(|connection| {
            let _ = Collection::save(collection_factory("test"), connection);
            let result = Collection::load(connection).unwrap();

            let delete = Collection::delete(result[0].id, connection);

            assert!(delete.is_ok());
        });
    }
}
