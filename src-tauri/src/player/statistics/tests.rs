#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::{GameFactory, StatisticFactory};
    use crate::backend::conf::factory::factory_models::{ApiFactory, Factory};
    use crate::backend::settings::errors::BASE_ERROR;
    use crate::backend::tests::database::allow_db_access;
    use crate::game::models::Game;
    use crate::player::statistics::models::PlayerStatistic;
    use crate::statistics::models::Statistic;

    #[test]
    fn test_generate_player_statistics() {
        allow_db_access(|connection| {
            for _ in 0..25 {
                let statistic = StatisticFactory.generate();
                let _ = Statistic::save(statistic, connection);
            }

            let result = Statistic::load(connection).unwrap();

            assert_eq!(result.len(), 25);

            let mut game = GameFactory.generate(connection);
            let _ = Game::save(&mut game, connection);
            let player_statistics = PlayerStatistic::load(game.id, connection).expect(BASE_ERROR);

            assert_eq!(player_statistics.len(), 25);
        });
    }

    #[test]
    fn test_save_player_statistic() {
        allow_db_access(|connection| {
            let statistic = StatisticFactory.generate();
            let mut game = GameFactory.generate(connection);
            let _ = Statistic::save(statistic, connection);
            let _ = Game::save(&mut game, connection);

            let player_statistics =
                PlayerStatistic::load(game.id.clone(), connection).expect(BASE_ERROR);
            let player_statistic = PlayerStatistic {
                id: player_statistics[0].id.clone(),
                game_id: game.id,
                statistic_id: player_statistics[0].statistic_id.clone(),
                name: player_statistics[0].clone().name,
                value: 1322.to_string(),
            };

            let _ = PlayerStatistic::save(player_statistic.clone(), connection);

            let patched_statistic =
                PlayerStatistic::get(player_statistic.id, connection).expect(BASE_ERROR);
            assert_eq!(patched_statistic.value, "1322");
        });
    }
}
