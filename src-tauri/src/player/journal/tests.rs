#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::{
        AchievementFactory, GameFactory, StatisticFactory,
    };
    use crate::backend::conf::factory::factory_models::{ApiFactory, Factory};
    use crate::backend::conf_tests::database::allow_db_access;
    use crate::player::journal::models::PlayerJournal;

    #[test]
    fn test_load_player_journal() {
        allow_db_access(|connection| {
            for _ in 0..25 {
                let achievement = AchievementFactory.generate();
                let statistic = StatisticFactory.generate();
                let _ = achievement.save(connection);
                let _ = statistic.save(connection);
            }

            let mut game = GameFactory.generate(connection);
            let _ = game.save(connection);

            let player_journal = PlayerJournal::load(game.id, connection);

            assert!(player_journal.is_ok())
        });
    }
}
