#[cfg(test)]
mod tests {
    use crate::{
        admin::dashboard::commands::load_admin_dashboard,
        backend::settings::variables::{TEST_ADMIN_KEY, TEST_SECRET_KEY, TEST_USER_KEY},
    };
    use dotenv::dotenv;
    use serde_json::json;
    use std::env;

    #[test]
    fn test_load_admin_dashboard_success() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        env::set_var("USER_KEY", TEST_ADMIN_KEY);
        dotenv().ok();
        let dashboard = load_admin_dashboard().expect("Error");

        assert_eq!(dashboard[0]["id"], 0);
        assert_eq!(dashboard[0]["command"], "load_games".to_string());
        assert_eq!(dashboard[0]["model"], "Game".to_string());
        assert_eq!(dashboard[0]["name"], "game".to_string());
        assert_eq!(dashboard[0]["actions"], json!(["edit", "export", "delete"]));
    }

    #[test]
    fn test_load_admin_dashboard_missing_variable() {
        env::remove_var("SECRET_KEY");
        env::remove_var("USER_KEY");
        let dashboard = load_admin_dashboard();
        assert!(dashboard.is_err_and(|err| err.0 == "Permission denied"));
    }

    #[test]
    fn test_load_admin_dashboard_unauthorized() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        env::set_var("USER_KEY", TEST_USER_KEY);
        dotenv().ok();
        let dashboard = load_admin_dashboard();
        assert!(dashboard.is_err_and(|err| err.0 == "Permission denied"));
    }
}
