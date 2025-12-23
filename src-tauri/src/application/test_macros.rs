#[cfg(test)]
mod tests {
    use crate::{
        application::models::ApplicationSettings,
        backend::{conf_tests::database::allow_db_access, settings::errors::BASE_ERROR},
    };
    use system_macros::settings_initial_datas;

    #[test]
    fn test_resolve_functions_from_script() {
        let result = settings_initial_datas!();
        assert!(result.is_ok());
    }

    #[test]
    fn test_resolve_and_insert_functions_from_script() {
        allow_db_access(|connection| {
            let settings = settings_initial_datas!().expect(BASE_ERROR);

            let insertion = settings.clone().save(connection);
            assert!(insertion.is_ok());

            let result = ApplicationSettings::load(connection);
            assert!(result.is_ok_and(|res| res == settings));
        });
    }
}
