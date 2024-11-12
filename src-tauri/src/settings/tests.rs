#[cfg(test)]
mod tests {
    use crate::settings::{
        commands::load_dev_settings,
        models::SettingValue,
        security::Credentials,
        variables::vars::{TEST_ADMIN_KEY, TEST_SECRET_KEY, TEST_USER_KEY},
    };
    use dotenv::dotenv;
    use std::env;

    #[test]
    fn test_load_dev_settings_admin() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        env::set_var("USER_KEY", TEST_ADMIN_KEY);
        dotenv().ok();
        let settings = load_dev_settings();

        let global = settings.global.values().into_iter().all(|it| it.mutable);
        let game = settings.game.values().into_iter().all(|it| it.mutable);
        let scene = settings.scene.values().into_iter().all(|it| it.mutable);

        assert_eq!(
            settings.global.get("displayLoadingScreen").unwrap().value,
            SettingValue::Boolean(false)
        );

        assert!(global);
        assert!(game);
        assert!(scene);
    }

    #[test]
    fn test_load_dev_settings_missing_variable() {
        env::remove_var("SECRET_KEY");
        env::remove_var("USER_KEY");
        let settings = load_dev_settings();

        let global = settings.global.values().into_iter().all(|it| !it.mutable);
        let game = settings.game.values().into_iter().all(|it| !it.mutable);
        let scene = settings.scene.values().into_iter().all(|it| !it.mutable);

        assert_eq!(
            settings.global.get("displayLoadingScreen").unwrap().value,
            SettingValue::Boolean(true)
        );

        assert!(global);
        assert!(game);
        assert!(scene);
    }

    #[test]
    fn test_load_dev_settings_regular_user() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        env::set_var("USER_KEY", TEST_USER_KEY);
        dotenv().ok();

        let settings = load_dev_settings();

        let global = settings.global.values().into_iter().all(|it| !it.mutable);
        let game = settings.game.values().into_iter().all(|it| !it.mutable);
        let scene = settings.scene.values().into_iter().all(|it| !it.mutable);

        assert_eq!(
            settings.global.get("displayLoadingScreen").unwrap().value,
            SettingValue::Boolean(true)
        );

        assert!(global);
        assert!(game);
        assert!(scene);
    }

    #[test]
    fn test_generate_security_keys() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        dotenv().ok();

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
