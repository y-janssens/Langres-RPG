#[cfg(test)]
mod tests {
    use crate::achievements::models::Achievement;
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::AchievementFactory;
    use crate::config::factory::factory_models::Factory;

    #[test]
    fn test_load_achievements() {
        allow_db_access(|connection| {
            let achievement = AchievementFactory.generate();
            let _ = Achievement::save(achievement, connection);
            let result = Achievement::load(connection).unwrap();

            assert_eq!(result.len(), 1);
        });
    }

    #[test]
    fn test_patch_achievement() {
        allow_db_access(|connection| {
            let achievement = AchievementFactory.generate();
            let _ = Achievement::save(achievement, connection);
            let result = Achievement::load(connection).unwrap();

            let mut patch_achievement = Achievement {
                id: result[0].clone().id,
                name: result[0].clone().name,
                description: result[0].clone().description,
                completed: result[0].clone().completed,
            };

            patch_achievement.completed = true;

            let _ = Achievement::save(patch_achievement, connection);
            let patch_result = Achievement::load(connection).unwrap();

            assert!(patch_result[0].completed);
        });
    }

    #[test]
    fn test_delete_achievement() {
        allow_db_access(|connection| {
            let achievement = AchievementFactory.generate();
            let _ = Achievement::save(achievement, connection);
            let result = Achievement::load(connection).unwrap();

            let delete = Achievement::delete(result[0].clone().id, connection);

            assert!(delete.is_ok());
        });
    }
}
