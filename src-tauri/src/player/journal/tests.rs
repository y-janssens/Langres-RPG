#[cfg(test)]
mod tests {
    use crate::achievements::models::Achievement;
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::{
        AchievementFactory, GameFactory, QuestFactory, StatisticFactory,
    };
    use crate::config::factory::factory_models::{ApiFactory, Factory};
    use crate::game::models::Game;
    use crate::player::journal::models::PlayerJournal;
    use crate::quests::models::Quest;
    use crate::statistics::models::Statistic;

    #[test]
    fn test_load_player_journal() {
        allow_db_access(|connection| {
            for _ in 0..25 {
                let achievement = AchievementFactory.generate();
                let quest = QuestFactory.generate();
                let statistic = StatisticFactory.generate();
                let _ = Achievement::save(achievement, connection);
                let _ = Quest::save(quest, connection);
                let _ = Statistic::save(statistic, connection);
            }

            let game = GameFactory.generate(connection);
            let _ = Game::save(game.clone(), connection);

            let player_journal = PlayerJournal::load(game.id, connection).expect("Error");

            assert_eq!(player_journal.achievements.len(), 25);
            assert_eq!(player_journal.quests.len(), 25);
            assert_eq!(player_journal.statistics.len(), 25);
        });
    }
}
