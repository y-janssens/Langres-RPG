#[cfg(test)]
mod tests {
    use crate::{
        backend::{conf_tests::database::allow_db_access, settings::errors::BASE_ERROR},
        functions::models::Function,
    };
    use system_macros::functions_initial_datas;

    #[test]
    fn test_resolve_functions_from_script() {
        let result = functions_initial_datas!();
        assert!(result.is_ok());
    }

    #[test]
    fn test_resolve_and_insert_functions_from_script() {
        allow_db_access(|connection| {
            let functions: Vec<Function> = functions_initial_datas!().expect(BASE_ERROR);

            for function in functions {
                let insertion = function.insert_initial_datas(connection);
                assert!(insertion.is_ok());
            }

            let result = Function::load(connection);
            assert!(result.is_ok_and(|res| !res.is_empty()));
        });
    }
}
