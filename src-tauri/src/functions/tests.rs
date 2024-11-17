#[cfg(test)]
mod tests {

    use crate::functions::models::Function;
    use crate::backend::conf::factories::factories_definitions::FunctionFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::tests::database::allow_db_access;

    #[test]
    fn test_load_functions() {
        allow_db_access(|connection| {
            let function = FunctionFactory.generate();
            let _ = Function::save(function, connection);
            let result = Function::load(connection).unwrap();

            assert_eq!(result.len(), 4);
        });
    }

    #[test]
    fn test_patch_function() {
        allow_db_access(|connection| {
            let function = FunctionFactory.generate();
            let _ = Function::save(function, connection);
            let result = Function::load(connection).unwrap();

            let mut patch_function = Function {
                id: result[0].id,
                icon: result[0].clone().icon,
                label: result[0].clone().label,
                command: result[0].clone().command,
            };

            patch_function.label = "loul".to_string();

            let _ = Function::save(patch_function, connection);
            let patch_result = Function::load(connection).unwrap();

            assert_eq!(patch_result[0].label, "loul");
        });
    }

    #[test]
    fn test_delete_function() {
        allow_db_access(|connection| {
            let function = FunctionFactory.generate();
            let _ = Function::save(function, connection);
            let result = Function::load(connection).unwrap();

            let delete = Function::delete(result[0].id, connection);

            assert!(delete.is_ok());
        });
    }
}
