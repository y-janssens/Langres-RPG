#[cfg(test)]
mod tests {
    use crate::achievements::models::Achievement;
    use crate::backend::conf::factories::factories_definitions::{AchievementFactory, GameFactory};
    use crate::backend::conf::factory::factory_models::{ApiFactory, Factory};
    use crate::backend::conf_tests::database::allow_db_access;
    use crate::backend::settings::errors::BASE_ERROR;
    use crate::player::achievements::models::PlayerAchievement;

    #[test]
    fn test_generate_player_achievements() {
        allow_db_access(|connection| {
            for _ in 0..25 {
                let achievement = AchievementFactory.generate();
                let _ = achievement.save(connection);
            }

            let result = Achievement::load(connection).unwrap();

            assert_eq!(result.len(), 25);

            let mut game = GameFactory.generate(connection);
            let _ = game.save(connection);
            let player_achievements =
                PlayerAchievement::load(game.id, connection).expect(BASE_ERROR);

            assert_eq!(player_achievements.len(), 25);
            assert!(!player_achievements[0].completed);
        });
    }

    #[test]
    fn test_activate_player_achievement() {
        allow_db_access(|connection| {
            let achievement = AchievementFactory.generate();
            let mut game = GameFactory.generate(connection);
            let _ = achievement.save(connection);
            let _ = game.save(connection);

            let player_achievements =
                PlayerAchievement::load(game.id, connection).expect(BASE_ERROR);
            let player_achievement = &player_achievements[0];

            PlayerAchievement::activate(player_achievement.clone(), connection);

            let patched_achievement =
                PlayerAchievement::get(player_achievement.clone().id, connection)
                    .expect(BASE_ERROR);
            assert!(patched_achievement.completed);
        });
    }
}
