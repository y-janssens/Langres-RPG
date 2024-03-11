#[cfg(test)]
mod tests {
    use crate::commands::dashboard::load_admin_dashboard;
    use dotenv::dotenv;
    use serde_json::{json, Value};
    use std::env;

    #[test]
    fn test_load_admin_dashboard_success() {
        env::set_var("ADMIN_USER", "true");
        dotenv().ok();
        let dashboard = load_admin_dashboard();

        assert_eq!(dashboard[0]["id"], 0);
        assert_eq!(dashboard[0]["command"], "load_games".to_string());
        assert_eq!(dashboard[0]["model"], "Game".to_string());
        assert_eq!(dashboard[0]["name"], "game".to_string());
        assert_eq!(dashboard[0]["actions"], json!(["edit", "delete"]));
    }

    #[test]
    fn test_load_admin_dashboard_missing_variable() {
        let dashboard = load_admin_dashboard();

        if let Value::Object(ref obj) = dashboard {
            if let Some(serde_json::Value::String(error_message)) = obj.get("error") {
                assert!(error_message.contains("Environment variable is not set."));
            }
        }
    }

    #[test]
    fn test_load_admin_dashboard_unauthorized() {
        env::set_var("ADMIN_USER", "false");
        dotenv().ok();
        let dashboard = load_admin_dashboard();

        if let Value::Object(ref obj) = dashboard {
            if let Some(serde_json::Value::String(error_message)) = obj.get("error") {
                assert!(error_message
                    .contains("Admin dashboard is disabled or configuration is invalid."));
            }
        }
    }
}
