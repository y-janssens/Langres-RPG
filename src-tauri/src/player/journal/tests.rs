#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::{
        AchievementFactory, GameFactory, StatisticFactory,
    };
    use crate::backend::conf::factory::factory_models::{ApiFactory, Factory};
    use crate::backend::settings::errors::BASE_ERROR;
    use crate::backend::tests::database::allow_db_access;
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

            let player_journal = PlayerJournal::load(game.id, connection).expect(BASE_ERROR);

            assert_eq!(player_journal.achievements.len(), 25);
            assert_eq!(player_journal.quests.len(), 2);
            assert_eq!(player_journal.statistics.len(), 25);
        });
    }
}
