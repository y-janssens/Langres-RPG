#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::ObjectFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::conf_tests::database::allow_db_access;
    use crate::objects::models::Object;

    #[test]
    fn test_load_objects() {
        allow_db_access(|connection| {
            let object = ObjectFactory.generate();
            let _ = object.save(connection);
            let result = Object::load(connection);

            assert!(result.is_ok_and(|res| !res.is_empty()));
        });
    }

    #[test]
    fn test_patch_object() {
        allow_db_access(|connection| {
            let object = ObjectFactory.generate();
            let _ = object.save(connection);
            let result = Object::load(connection).unwrap();

            let patch_object = Object {
                name: "loul".to_string(),
                ..result[0].clone()
            };

            let _ = patch_object.save(connection);
            let patch_result = Object::load(connection).unwrap();

            assert_eq!(patch_result[0].name, "loul");
        });
    }

    #[test]
    fn test_delete_object() {
        allow_db_access(|connection| {
            let object = ObjectFactory.generate();
            let _ = object.save(connection);
            let result = Object::load(connection).unwrap();

            let delete = Object::delete(result[0].id, connection);

            assert!(delete.is_ok());
        });
    }
}
