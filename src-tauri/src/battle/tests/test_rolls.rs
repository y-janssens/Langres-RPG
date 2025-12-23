#[cfg(test)]
mod tests {
    use rstest::*;
    use std::collections::HashMap;

    use crate::application::models::ApplicationSettings;
    use crate::backend::conf_tests::database::allow_db_access;
    use crate::backend::{conf_tests::database::with_permissions, permissions::models::Permission};
    use crate::battle::rolls::Roll;
    use crate::battle::settings::BattleDifficulty;
    use crate::battle::tests::test_utils::helpers::setup_battle_system;
    use crate::battle::types::Stat;

    #[rstest]
    #[case(BattleDifficulty::Normal, 0, 8)]
    #[case(BattleDifficulty::Hard, 1, 7)]
    #[case(BattleDifficulty::Extreme, 2, 6)]
    async fn test_roll_with_difficulty(#[case] difficulty: BattleDifficulty, #[case] value: i32, #[case] result: i32) {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut application_settings = ApplicationSettings::load(connection).unwrap();
                application_settings.difficulty = difficulty.get_value();
                application_settings.save(connection).unwrap();

                let system = setup_battle_system(connection);

                assert_eq!(system.settings.difficulty, difficulty);
                assert_eq!(system.settings.difficulty.get_value(), value);

                let stat = Stat::Attack.get_stats(&system.character, &system.npc).0;

                assert_eq!(stat - system.settings.difficulty.get_value(), result);
            });
        });
    }

    #[rstest]
    #[case(BattleDifficulty::Normal, 100, 37)]
    #[case(BattleDifficulty::Hard, 37, 30)]
    #[case(BattleDifficulty::Extreme, 35, 1)]
    async fn test_rolls_distribution_with_difficulty(
        #[case] difficulty: BattleDifficulty,
        #[case] high_limit: i32,
        #[case] low_limit: i32,
    ) {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut application_settings = ApplicationSettings::load(connection).unwrap();
                application_settings.difficulty = difficulty.get_value();
                application_settings.save(connection).unwrap();

                let mut system = setup_battle_system(connection);

                assert_eq!(system.settings.difficulty, difficulty);

                let results: Vec<Roll> = (0..1000).map(|_| Roll::launch(&Stat::Attack, &mut system)).collect();

                let mut distribution: HashMap<&str, usize> = HashMap::new();

                for result in &results {
                    if result.success {
                        *distribution.entry("success").or_insert(0) += 1;
                    }
                }

                let total = results.len() as f64;
                let success_count = distribution.get("success").unwrap_or(&0);
                let success_percentage = (*success_count as f64 / total) * 100.0;

                assert!(success_percentage >= low_limit as f64);
                assert!(success_percentage <= high_limit as f64);
            });
        });
    }
}
