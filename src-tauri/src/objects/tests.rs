#[cfg(test)]
mod tests {
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::ObjectFactory;
    use crate::config::factory::factory_models::Factory;
    use crate::objects::models::Object;

    #[test]
    fn test_load_objects() {
        allow_db_access(|connection| {
            let object = ObjectFactory.generate();
            let _ = Object::save(object, connection);
            let result = Object::load(connection).unwrap();

            assert_eq!(result.len(), 11);
        });
    }

    #[test]
    fn test_patch_object() {
        allow_db_access(|connection| {
            let object = ObjectFactory.generate();
            let _ = Object::save(object, connection);
            let result = Object::load(connection).unwrap();

            let mut patch_object = Object {
                id: result[0].id,
                name: result[0].clone().name,
                value: result[0].clone().value,
                area: result[0].clone().area,
                walkable: result[0].clone().walkable,
                interactive: result[0].clone().interactive,
            };

            patch_object.name = "loul".to_string();

            let _ = Object::save(patch_object, connection);
            let patch_result = Object::load(connection).unwrap();

            assert_eq!(patch_result[0].name, "loul");
        });
    }

    #[test]
    fn test_delete_object() {
        allow_db_access(|connection| {
            let object = ObjectFactory.generate();
            let _ = Object::save(object, connection);
            let result = Object::load(connection).unwrap();

            let delete = Object::delete(result[0].id, connection);

            assert!(delete.is_ok());
        });
    }
}
