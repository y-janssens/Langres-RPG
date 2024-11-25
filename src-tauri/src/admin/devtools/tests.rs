#[cfg(test)]
mod tests {
    use serde_json::from_value;

    use crate::admin::devtools::commands::load_dev_settings;
    use crate::admin::devtools::models::{DevSettings, SettingValue};
    use crate::backend::permissions::models::{Credentials, Permission};
    use crate::backend::settings::variables::{TEST_ADMIN_KEY, TEST_SECRET_KEY};
    use crate::backend::tests::database::with_permissions;

    #[test]
    fn test_load_dev_settings_admin() {
        with_permissions(Permission::Admin, || {
            let settings = load_dev_settings().expect("Error");
            let config: DevSettings = from_value(settings.0).expect("Error");

            let global = config.global.values().into_iter().all(|it| it.mutable);
            let game = config.game.values().into_iter().all(|it| it.mutable);
            let scene = config.scene.values().into_iter().all(|it| it.mutable);

            assert_eq!(
                config.global.get("displayLoadingScreen").unwrap().value,
                SettingValue::Boolean(false)
            );

            assert!(global);
            assert!(game);
            assert!(scene);
        });
    }

    #[test]
    fn test_load_dev_settings_missing_variable() {
        let settings = load_dev_settings().expect("Error");
        let config: DevSettings = from_value(settings.0).expect("Error");

        let global = config.global.values().into_iter().all(|it| !it.mutable);
        let game = config.game.values().into_iter().all(|it| !it.mutable);
        let scene = config.scene.values().into_iter().all(|it| !it.mutable);

        assert_eq!(
            config.global.get("displayLoadingScreen").unwrap().value,
            SettingValue::Boolean(true)
        );

        assert!(global);
        assert!(game);
        assert!(scene);
    }

    #[test]
    fn test_load_dev_settings_regular_user() {
        with_permissions(Permission::RegularUser, || {
            let settings = load_dev_settings().expect("Error");
            let config: DevSettings = from_value(settings.0).expect("Error");

            let global = config.global.values().into_iter().all(|it| !it.mutable);
            let game = config.game.values().into_iter().all(|it| !it.mutable);
            let scene = config.scene.values().into_iter().all(|it| !it.mutable);

            assert_eq!(
                config.global.get("displayLoadingScreen").unwrap().value,
                SettingValue::Boolean(true)
            );

            assert!(global);
            assert!(game);
            assert!(scene);
        });
    }

    #[test]
    fn test_generate_security_keys() {
        with_permissions(Permission::Admin, || {
            let full_admin_security_key = Credentials::generate_full_admin_secret_key();
            let admin_security_key = Credentials::generate_admin_secret_key();
            let regular_user_security_key = Credentials::generate_regular_user_secret_key();

            println!("full_admin_security_key: {:?}", full_admin_security_key);
            println!("---");
            println!("limited_admin_security_key: {:?}", admin_security_key);
            println!("---");
            println!("regular_user_security_key: {:?}", regular_user_security_key);

            assert!(full_admin_security_key.is_ok());
            assert!(admin_security_key.is_ok());
            assert!(regular_user_security_key.is_ok());
        });
    }

    #[test]
    fn test_decrypt_secret_key() {
        let secret_key = TEST_SECRET_KEY;
        let configuration_key = TEST_ADMIN_KEY;

        let credentials = Credentials::decrypt_secret_key(&secret_key, &configuration_key);

        assert!(credentials.is_admin);
        assert!(credentials.dashboard_enabled);
        assert!(credentials.editor_enabled);
        assert!(credentials.dev_tools_enabled);
        assert!(credentials.dev_settings_enabled);
    }
}
