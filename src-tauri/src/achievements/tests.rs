#[cfg(test)]
mod tests {
    use crate::achievements::models::Achievement;
    use crate::backend::conf::factories::factories_definitions::AchievementFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::tests::database::allow_db_access;

    #[test]
    fn test_load_achievements() {
        allow_db_access(|connection| {
            let achievement = AchievementFactory.generate();
            let _ = achievement.save(connection);
            let result = Achievement::load(connection).unwrap();

            assert_eq!(result.len(), 1);
        });
    }

    #[test]
    fn test_patch_achievement() {
        allow_db_access(|connection| {
            let achievement = AchievementFactory.generate();
            let _ = achievement.save(connection);
            let result = Achievement::load(connection).unwrap();

            let mut patch_achievement = Achievement {
                id: result[0].clone().id,
                name: result[0].clone().name,
                description: result[0].clone().description,
                completed: result[0].clone().completed,
                visible: result[0].clone().visible,
            };

            patch_achievement.completed = true;

            let _ = patch_achievement.save(connection);
            let patch_result = Achievement::load(connection).unwrap();

            assert!(patch_result[0].completed);
        });
    }

    #[test]
    fn test_delete_achievement() {
        allow_db_access(|connection| {
            let achievement = AchievementFactory.generate();
            let _ = achievement.save(connection);
            let result = Achievement::load(connection).unwrap();

            let delete = Achievement::delete(result[0].clone().id, connection);

            assert!(delete.is_ok());
        });
    }
}
