#[cfg(test)]
mod tests {
    use crate::commands::permissions::load_permissions;
    use dotenv::dotenv;
    use std::env;

    #[test]
    fn test_load_permissions_success() {
        env::set_var("ADMIN_USER", "true");
        dotenv().ok();
        let permissions = load_permissions();

        assert_eq!(permissions["is_admin"], true);
    }

    #[test]
    fn test_load_permissions_missing_variable() {
        let permissions = load_permissions();

        assert_eq!(permissions["is_admin"], false)
    }

    #[test]
    fn test_load_permissions_unauthorized() {
        env::set_var("ADMIN_USER", "false");
        dotenv().ok();
        let permissions = load_permissions();

        assert_eq!(permissions["is_admin"], false);
    }
}
