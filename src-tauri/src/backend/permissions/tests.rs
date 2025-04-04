#[cfg(test)]
mod tests {
    use rstest::*;

    use crate::backend::{
        database::authenticated_command,
        permissions::{commands::load_permissions, models::Permission},
        tests::database::with_permissions,
    };

    #[rstest]
    #[case::admin(Permission::Admin, true)]
    #[case::editor(Permission::Editor, false)]
    #[case::dev_tools(Permission::DevTools, false)]
    #[case::dashboard(Permission::Dashboard, false)]
    #[case::dev_settings(Permission::DevSettings, false)]
    #[case::regular_user(Permission::RegularUser, false)]
    fn test_load_admin_permissions(#[case] authentication_type: Permission, #[case] result: bool) {
        with_permissions(authentication_type, || {
            let permissions = load_permissions();
            assert!(permissions.is_ok_and(|res| res["is_admin"] == result));
        });
    }

    #[test]
    fn test_load_permissions_missing_variable() {
        let permissions = load_permissions();

        assert!(permissions.is_ok_and(|result| result["is_admin"] == false));
    }

    #[test]
    fn test_permissions_success() {
        with_permissions(Permission::Admin, || {
            let admin = authenticated_command(Permission::Admin, || Ok(()));
            let dashboard = authenticated_command(Permission::Dashboard, || Ok(()));
            let editor = authenticated_command(Permission::Editor, || Ok(()));
            let dev_tools = authenticated_command(Permission::DevTools, || Ok(()));
            let dev_settings = authenticated_command(Permission::DevSettings, || Ok(()));

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
            let admin = authenticated_command(Permission::Admin, || Ok(()));
            let dashboard = authenticated_command(Permission::Dashboard, || Ok(()));
            let editor = authenticated_command(Permission::Editor, || Ok(()));
            let dev_tools = authenticated_command(Permission::DevTools, || Ok(()));
            let dev_settings = authenticated_command(Permission::DevSettings, || Ok(()));

            assert!(admin.is_err_and(|r| r.0 == "Permission denied"));
            assert!(dashboard.is_err_and(|r| r.0 == "Permission denied"));
            assert!(editor.is_err_and(|r| r.0 == "Permission denied"));
            assert!(dev_tools.is_err_and(|r| r.0 == "Permission denied"));
            assert!(dev_settings.is_err_and(|r| r.0 == "Permission denied"));
        });
    }
}
