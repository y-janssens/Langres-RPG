#[cfg(test)]
mod tests {
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::GameFactory;
    use crate::config::factory::factory_models::ApiFactory;
    use crate::game::models::Game;
    use crate::player::quests::models::PlayerQuest;
    use crate::quests::models::Quest;

    #[test]
    fn test_generate_player_quests() {
        allow_db_access(|connection| {
            let result = Quest::load();

            assert_eq!(result.len(), 2);

            let mut game = GameFactory.generate(connection);
            let _ = Game::save(&mut game, connection);
            let player_quests = PlayerQuest::load(game.id, connection).expect("Error");

            assert_eq!(player_quests.len(), 2);
            assert_eq!(player_quests[0].status.owned, true);
            assert_eq!(player_quests[1].status.owned, false);
        });
    }

    #[test]
    fn test_activate_player_quest() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let _ = Game::save(&mut game, connection);

            let player_quests = PlayerQuest::load(game.id, connection).expect("Error");
            let player_quest = &player_quests[0];

            PlayerQuest::activate(player_quest.clone(), connection);

            let patched_quest =
                PlayerQuest::get(player_quest.clone().id, connection).expect("Error");
            assert!(patched_quest.status.owned);
        });
    }

    #[test]
    fn test_validate_player_quest() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let _ = Game::save(&mut game, connection);

            let player_quests = PlayerQuest::load(game.id.clone(), connection).expect("Error");
            let player_quest = &player_quests[1];

            PlayerQuest::validate(
                player_quest.clone(),
                player_quest.clone().reward,
                connection,
            );

            let player = Game::load(game.id, connection).expect("Error").character;
            assert_eq!(player.lvl, 2);
            assert_eq!(player.xp, 0);
            assert_eq!(player.max_xp, 183);
        });
    }

    #[test]
    fn test_validate_player_quest_next() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let _ = Game::save(&mut game, connection);

            let player_quests = PlayerQuest::load(game.id.clone(), connection).expect("Error");
            let player_quest = &player_quests[0];

            PlayerQuest::validate(
                player_quest.clone(),
                player_quest.clone().reward,
                connection,
            );

            let patched_quests = PlayerQuest::load(game.id.clone(), connection).expect("Error");

            assert_eq!(patched_quests.len(), 2);
            assert_eq!(patched_quests[0].status.owned, true);
            assert_eq!(patched_quests[0].status.completed, true);
            assert_eq!(patched_quests[1].status.owned, true);
        });
    }

    #[test]
    fn test_edit_player_quest() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let _ = Game::save(&mut game, connection);

            let player_quests = PlayerQuest::load(game.id, connection).expect("Error");
            let player_quest = &player_quests[0];

            PlayerQuest::edit(player_quest.clone(), "failed", true, connection);

            let patched_quest =
                PlayerQuest::get(player_quest.clone().id, connection).expect("Error");
            assert!(patched_quest.status.failed);
        });
    }
}
