#[cfg(test)]
pub mod test_application {
    use crate::models::time::env::Environment;

    #[test]
    fn test_game_environment() {
        let date = "16/07/1164";
        let env = Environment::initialize(date);

        assert_eq!(env.season, "summer");
        assert_eq!(env.date, date);
    }
}
