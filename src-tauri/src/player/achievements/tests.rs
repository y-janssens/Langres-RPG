#[cfg(test)]
mod tests {
    use crate::achievements::models::Achievement;
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::{AchievementFactory, GameFactory};
    use crate::config::factory::factory_models::{ApiFactory, Factory};
    use crate::game::models::Game;
    use crate::player::achievements::models::PlayerAchievement;

    #[test]
    fn test_generate_player_achievements() {
        allow_db_access(|connection| {
            for _ in 0..25 {
                let achievement = AchievementFactory.generate();
                let _ = Achievement::save(achievement, connection);
            }

            let result = Achievement::load(connection).unwrap();

            assert_eq!(result.len(), 25);

            let game = GameFactory.generate(connection);
            let _ = Game::save(game.clone(), connection);
            let player_achievements = PlayerAchievement::load(game.id, connection).expect("Error");

            assert_eq!(player_achievements.len(), 25);
            assert_eq!(player_achievements[0].completed, false);
        });
    }

    #[test]
    fn test_activate_player_achievement() {
        allow_db_access(|connection| {
            let achievement = AchievementFactory.generate();
            let game = GameFactory.generate(connection);
            let _ = Achievement::save(achievement, connection);
            let _ = Game::save(game.clone(), connection);

            let player_achievements = PlayerAchievement::load(game.id, connection).expect("Error");
            let player_achievement = &player_achievements[0];

            PlayerAchievement::activate(player_achievement.clone(), connection);

            let patched_achievement =
                PlayerAchievement::get(player_achievement.clone().id, connection).expect("Error");
            assert!(patched_achievement.completed);
        });
    }
}
