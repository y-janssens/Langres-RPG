#[cfg(test)]
mod tests {
    use dotenv::dotenv;
    use std::env;

    use crate::backend::conf::factories::factories_definitions::GameFactory;
    use crate::backend::conf::factory::factory_models::ApiFactory;
    use crate::backend::settings::variables::{TEST_ADMIN_KEY, TEST_SECRET_KEY, TEST_USER_KEY};
    use crate::backend::tests::database::allow_db_access;
    use crate::game::models::{Game, Position};

    #[test]
    fn test_load_games_admin() {
        allow_db_access(|connection| {
            env::set_var("SECRET_KEY", TEST_SECRET_KEY);
            env::set_var("USER_KEY", TEST_ADMIN_KEY);
            dotenv().ok();

            let mut g1 = GameFactory.generate(connection);
            let mut g2 = GameFactory.generate(connection);
            g2.visible = false;

            let _ = Game::save(&mut g1, connection);
            let _ = Game::save(&mut g2, connection);

            let response = Game::fetch(connection).unwrap();

            assert_eq!(response.len(), 2);
            assert_eq!(response[0].player, "game".to_string());
            assert_eq!(response[0].character.first_name, "game".to_string());
            assert_eq!(response[0].visible, true);
            assert_eq!(response[1].visible, false);

            // env::remove_var("SECRET_KEY");
            // env::remove_var("USER_KEY");
        });
    }

    #[test]
    fn test_load_games_regular_user() {
        allow_db_access(|connection| {
            env::set_var("SECRET_KEY", TEST_SECRET_KEY);
            env::set_var("USER_KEY", TEST_USER_KEY);
            dotenv().ok();
            let mut g1 = GameFactory.generate(connection);
            let mut g2 = GameFactory.generate(connection);
            g2.visible = false;

            let _ = Game::save(&mut g1, connection);
            let _ = Game::save(&mut g2, connection);

            let response = Game::fetch(connection).unwrap();

            assert_eq!(response.len(), 1);
            assert_eq!(response[0].player, "game".to_string());
            assert_eq!(response[0].character.first_name, "game".to_string());

            // env::remove_var("SECRET_KEY");
            // env::remove_var("USER_KEY");
        });
    }

    #[test]
    fn test_save_games() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let _ = Game::save(&mut game, connection);
            let request = Game::load(game.id.clone(), connection).unwrap();

            assert_eq!(request.player, "game".to_string());
            assert_eq!(request.character.first_name, "game".to_string());

            game.last_known_position = Position {
                x: 8.0,
                y: 12.0,
                id: 633,
            };

            Game::save(&mut game, connection).unwrap();
            let patch_response = Game::load(game.clone().id, connection).unwrap();
            assert_eq!(patch_response.save_count, 2);
            assert_eq!(patch_response.last_known_position.x, 8.0);
            assert_eq!(patch_response.last_known_position.y, 12.0);
            assert_eq!(patch_response.last_known_position.id, 633);
        });
    }

    #[test]
    fn test_delete_game() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let _ = Game::save(&mut game, connection);
            let result = Game::fetch(connection).unwrap();

            assert_eq!(result.len(), 1);

            let delete = Game::delete(result[0].clone().id, connection);

            assert!(delete.is_ok());
        });
    }
}
