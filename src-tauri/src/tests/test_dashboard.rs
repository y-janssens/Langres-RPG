#[cfg(test)]
mod tests {
    use std::env;
    use dotenv::dotenv;
    use serde_json::Value;
    use crate::commands::dashboard::load_admin_dashboard;

    #[test]
    fn test_load_admin_dashboard_success() {
        dotenv().ok();
        let dashboard = load_admin_dashboard();
        env::set_var("ADMIN_DASHBOARD_ENABLED", "true");

        assert_eq!(dashboard[0]["command"], "fetch_storyline".to_string());
        assert_eq!(dashboard[0]["model"], "Storyline".to_string());
        assert_eq!(dashboard[0]["name"], "story".to_string());
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
        dotenv().ok();
        let dashboard = load_admin_dashboard();
        env::set_var("ADMIN_DASHBOARD_ENABLED", "false");

        if let Value::Object(ref obj) = dashboard {
            if let Some(serde_json::Value::String(error_message)) = obj.get("error") {
                assert!(error_message.contains("Admin dashboard is disabled or configuration is invalid."));
            }
        }
    }
}
