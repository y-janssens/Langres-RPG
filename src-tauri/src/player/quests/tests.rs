#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::GameFactory;
    use crate::backend::conf::factory::factory_models::ApiFactory;
    use crate::backend::settings::errors::BASE_ERROR;
    use crate::backend::tests::database::allow_db_access;
    use crate::game::models::Game;
    use crate::player::quests::models::PlayerQuest;
    use crate::quests::models::Quest;

    #[test]
    fn test_generate_player_quests() {
        allow_db_access(|connection| {
            let result = Quest::load();

            assert_eq!(result.len(), 2);

            let mut game = GameFactory.generate(connection);
            let _ = game.save(connection);
            let player_quests = PlayerQuest::load(game.id, connection).expect(BASE_ERROR);

            assert_eq!(player_quests.len(), 2);
            assert!(player_quests[0].status.owned);
            assert!(!player_quests[1].status.owned);
        });
    }

    #[test]
    fn test_activate_player_quest() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let _ = game.save(connection);

            let player_quests = PlayerQuest::load(game.id, connection).expect(BASE_ERROR);
            let player_quest = &player_quests[0];

            PlayerQuest::activate(player_quest.clone(), connection);

            let patched_quest =
                PlayerQuest::get(player_quest.clone().id, connection).expect(BASE_ERROR);
            assert!(patched_quest.status.owned);
        });
    }

    #[test]
    fn test_validate_player_quest() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let _ = game.save(connection);

            let player_quests = PlayerQuest::load(game.id.clone(), connection).expect(BASE_ERROR);
            let player_quest = &player_quests[1];

            let _ = player_quest
                .clone()
                .validate(player_quest.reward, connection);

            let player = Game::load(game.id, connection).expect(BASE_ERROR).character;
            assert_eq!(player.lvl, 2);
            assert_eq!(player.xp, 0);
            assert_eq!(player.max_xp, 183);
        });
    }

    #[test]
    fn test_validate_player_quest_next() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let _ = game.save(connection);

            let player_quests = PlayerQuest::load(game.id.clone(), connection).expect(BASE_ERROR);
            let player_quest = &player_quests[0];

            let _ = player_quest
                .clone()
                .validate(player_quest.reward, connection);

            let patched_quests = PlayerQuest::load(game.id.clone(), connection).expect(BASE_ERROR);

            assert_eq!(patched_quests.len(), 2);
            assert!(patched_quests[0].status.owned);
            assert!(patched_quests[0].status.completed);
            assert!(patched_quests[1].status.owned);
        });
    }

    #[test]
    fn test_edit_player_quest() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let _ = game.save(connection);

            let player_quests = PlayerQuest::load(game.id, connection).expect(BASE_ERROR);
            let player_quest = &player_quests[0];

            player_quest
                .clone()
                .edit("failed", true, connection)
                .expect(BASE_ERROR);

            let patched_quest =
                PlayerQuest::get(player_quest.clone().id, connection).expect(BASE_ERROR);
            assert!(patched_quest.status.failed);
        });
    }
}
