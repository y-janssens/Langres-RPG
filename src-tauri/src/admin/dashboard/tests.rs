#[cfg(test)]
mod tests {
    use crate::{
        admin::dashboard::commands::load_admin_dashboard,
        backend::{
            permissions::models::Permission, settings::errors::BASE_ERROR,
            tests::database::with_permissions,
        },
    };
    use serde_json::json;

    #[test]
    fn test_load_admin_dashboard_success() {
        with_permissions(Permission::Admin, || {
            let dashboard = load_admin_dashboard().expect(BASE_ERROR);

            assert_eq!(dashboard[0]["id"], 0);
            assert_eq!(dashboard[0]["command"], "load_games".to_string());
            assert_eq!(dashboard[0]["model"], "Game".to_string());
            assert_eq!(dashboard[0]["name"], "game".to_string());
            assert_eq!(dashboard[0]["actions"], json!(["edit", "export", "delete"]));
        });
    }

    #[test]
    fn test_load_admin_dashboard_missing_variable() {
        let dashboard = load_admin_dashboard();

        assert!(dashboard.is_err_and(|err| err.0 == "Permission denied"));
    }

    #[test]
    fn test_load_admin_dashboard_unauthorized() {
        with_permissions(Permission::RegularUser, || {
            let dashboard = load_admin_dashboard();

            assert!(dashboard.is_err_and(|err| err.0 == "Permission denied"));
        });
    }
}
