#[cfg(test)]
mod tests {
    use crate::backend::{
        database::authenticated_command,
        fixtures::tests_fixtures::mock_value,
        permissions::{commands::load_permissions, models::Permission},
        settings::variables::{TEST_ADMIN_KEY, TEST_SECRET_KEY, TEST_USER_KEY},
    };
    use dotenv::dotenv;
    use std::env;

    #[test]
    fn test_load_permissions_success() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        env::set_var("USER_KEY", TEST_ADMIN_KEY);
        dotenv().ok();
        let permissions = load_permissions();

        assert!(permissions.is_ok_and(|result| result["is_admin"] == true));
    }

    #[test]
    fn test_load_permissions_missing_variable() {
        env::remove_var("SECRET_KEY");
        env::remove_var("USER_KEY");
        let permissions = load_permissions();

        assert!(permissions.is_ok_and(|result| result["is_admin"] == false));
    }

    #[test]
    fn test_load_permissions_unauthorized() {
        env::set_var("SECRET_KEY", TEST_SECRET_KEY);
        env::set_var("USER_KEY", TEST_USER_KEY);
        dotenv().ok();
        let permissions = load_permissions();

        assert!(permissions.is_ok_and(|result| result["is_admin"] == false));
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

        assert!(admin.is_ok());
        assert!(dashboard.is_ok());
        assert!(editor.is_ok());
        assert!(dev_tools.is_ok());
        assert!(dev_settings.is_ok());
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

        assert!(admin.is_err_and(|r| r.0 == "Permission denied"));
        assert!(dashboard.is_err_and(|r| r.0 == "Permission denied"));
        assert!(editor.is_err_and(|r| r.0 == "Permission denied"));
        assert!(dev_tools.is_err_and(|r| r.0 == "Permission denied"));
        assert!(dev_settings.is_err_and(|r| r.0 == "Permission denied"));
    }
}
