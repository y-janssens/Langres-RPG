#[cfg(test)]
mod tests {
    use crate::{
        backend::database::authenticated_command,
        backend::fixtures::tests_fixtures::mock_value,
        backend::permissions::{commands::load_permissions, models::Permission},
        backend::settings::variables::{TEST_ADMIN_KEY, TEST_SECRET_KEY, TEST_USER_KEY},
    };
    use dotenv::dotenv;
    use serde_json::json;
    use std::env;

    #[test]
    fn test_load_permissions_success() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        env::set_var("USER_KEY", TEST_ADMIN_KEY);
        dotenv().ok();
        let permissions = load_permissions();

        assert_eq!(permissions.is_admin, true);
    }

    #[test]
    fn test_load_permissions_missing_variable() {
        env::remove_var("SECRET_KEY");
        env::remove_var("USER_KEY");
        let permissions = load_permissions();

        assert_eq!(permissions.is_admin, false)
    }

    #[test]
    fn test_load_permissions_unauthorized() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        env::set_var("USER_KEY", TEST_USER_KEY);
        dotenv().ok();
        let permissions = load_permissions();

        assert_eq!(permissions.is_admin, false);
    }

    #[test]
    fn test_permissions_success() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        env::set_var("USER_KEY", TEST_ADMIN_KEY);
        dotenv().ok();

        let admin = authenticated_command(Permission::Admin, || mock_value());
        let dashboard = authenticated_command(Permission::Dashboard, || mock_value());
        let editor = authenticated_command(Permission::Editor, || mock_value());
        let dev_tools = authenticated_command(Permission::DevTools, || mock_value());
        let dev_settings = authenticated_command(Permission::DevSettings, || mock_value());

        assert_ne!(admin, json!({"error": "Permission denied"}));
        assert_ne!(dashboard, json!({"error": "Permission denied"}));
        assert_ne!(editor, json!({"error": "Permission denied"}));
        assert_ne!(dev_tools, json!({"error": "Permission denied"}));
        assert_ne!(dev_settings, json!({"error": "Permission denied"}));
    }

    #[test]
    fn test_permissions_error() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        env::set_var("USER_KEY", TEST_USER_KEY);
        dotenv().ok();

        let admin = authenticated_command(Permission::Admin, || mock_value());
        let dashboard = authenticated_command(Permission::Dashboard, || mock_value());
        let editor = authenticated_command(Permission::Editor, || mock_value());
        let dev_tools = authenticated_command(Permission::DevTools, || mock_value());
        let dev_settings = authenticated_command(Permission::DevSettings, || mock_value());

        assert_eq!(admin, json!({"error": "Permission denied"}));
        assert_eq!(dashboard, json!({"error": "Permission denied"}));
        assert_eq!(editor, json!({"error": "Permission denied"}));
        assert_eq!(dev_tools, json!({"error": "Permission denied"}));
        assert_eq!(dev_settings, json!({"error": "Permission denied"}));
    }
}
