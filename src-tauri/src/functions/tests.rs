#[cfg(test)]
mod tests {

    use crate::backend::conf::factories::factories_definitions::FunctionFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::tests::database::allow_db_access;
    use crate::functions::models::Function;

    #[test]
    fn test_load_functions() {
        allow_db_access(|connection| {
            let function = FunctionFactory.generate();
            let _ = function.save(connection);
            let result = Function::load(connection);

            assert!(result.is_ok_and(|res| !res.is_empty()));
        });
    }

    #[test]
    fn test_patch_function() {
        allow_db_access(|connection| {
            let function = FunctionFactory.generate();
            let _ = function.save(connection);
            let result = Function::load(connection).unwrap();

            let mut patch_function = Function {
                id: result[0].id,
                icon: result[0].clone().icon,
                label: result[0].clone().label,
                command: result[0].clone().command,
            };

            patch_function.label = "loul".to_string();

            let _ = patch_function.save(connection);
            let patch_result = Function::load(connection).unwrap();

            assert_eq!(patch_result[0].label, "loul");
        });
    }

    #[test]
    fn test_delete_function() {
        allow_db_access(|connection| {
            let function = FunctionFactory.generate();
            let _ = function.save(connection);
            let result = Function::load(connection).unwrap();

            let delete = Function::delete(result[0].id, connection);

            assert!(delete.is_ok());
        });
    }
}
