#[cfg(test)]
mod tests {
    use crate::{
        config::commands::load_permissions,
        settings::variables::vars::{TEST_ADMIN_KEY, TEST_SECRET_KEY, TEST_USER_KEY},
    };
    use dotenv::dotenv;
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
}
