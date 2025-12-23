#[cfg(test)]
mod tests {
    use crate::{
        backend::{conf_tests::database::allow_db_access, settings::errors::BASE_ERROR},
        objects::models::Object,
    };
    use system_macros::objects_initial_datas;

    #[test]
    fn test_resolve_objects_from_script() {
        let result = objects_initial_datas!();
        assert!(result.is_ok());
    }

    #[test]
    fn test_resolve_and_insert_objects_from_script() {
        allow_db_access(|connection| {
            let objects: Vec<Object> = objects_initial_datas!().expect(BASE_ERROR);

            for object in objects {
                let insertion = object.save(connection);
                assert!(insertion.is_ok());
            }

            let result = Object::load(connection);
            assert!(result.is_ok_and(|res| !res.is_empty()));
        });
    }
}
