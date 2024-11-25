#[cfg(test)]
mod tests {
    use crate::backend::{
        database::authenticated_command,
        fixtures::tests_fixtures::mock_value,
        permissions::{commands::load_permissions, models::Permission},
        tests::database::with_permissions,
    };

    #[test]
    fn test_load_permissions_success() {
        with_permissions(Permission::Admin, || {
            let permissions = load_permissions();

            assert!(permissions.is_ok_and(|result| result["is_admin"] == true));
        });
    }

    #[test]
    fn test_load_permissions_missing_variable() {
        let permissions = load_permissions();

        assert!(permissions.is_ok_and(|result| result["is_admin"] == false));
    }

    #[test]
    fn test_load_permissions_unauthorized() {
        with_permissions(Permission::RegularUser, || {
            let permissions = load_permissions();

            assert!(permissions.is_ok_and(|result| result["is_admin"] == false));
        });
    }

    #[test]
    fn test_permissions_success() {
        with_permissions(Permission::Admin, || {
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
        });
    }

    #[test]
    fn test_permissions_error() {
        with_permissions(Permission::RegularUser, || {
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
        });
    }
}
