#[cfg(test)]
mod tests {
    use crate::models::functions::functions_assets::Function;
    use crate::tests::conf::test_conf::*;
    use crate::utils::factories::factories_definitions::FunctionFactory;
    use crate::utils::factory::factory_models::Factory;

    #[test]
    fn test_load_functions() {
        allow_db_access(|connection| {
            let function = FunctionFactory.generate();
            let _ = Function::save(function, connection);
            let result = Function::load(connection).unwrap();

            assert_eq!(result.len(), 3);
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
