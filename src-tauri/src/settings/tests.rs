#[cfg(test)]
mod tests {
    use dotenv::dotenv;
    use std::env;

    use crate::settings::{commands::load_dev_settings, models::SettingValue};

    #[test]
    fn test_load_dev_settings_admin() {
        env::set_var("ADMIN_USER", "true");
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

        env::remove_var("ADMIN_USER");
    }

    #[test]
    fn test_load_dev_settings_missing_variable() {
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
        env::set_var("ADMIN_USER", "false");
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
}
