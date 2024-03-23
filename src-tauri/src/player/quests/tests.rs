#[cfg(test)]
mod tests {
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::{GameFactory, QuestFactory};
    use crate::config::factory::factory_models::{ApiFactory, Factory};
    use crate::game::models::Game;
    use crate::player::quests::models::PlayerQuest;
    use crate::quests::models::Quest;

    #[test]
    fn test_generate_player_quests() {
        allow_db_access(|connection| {
            for _ in 0..25 {
                let quest = QuestFactory.generate();
                let _ = Quest::save(quest, connection);
            }

            let result = Quest::load(connection).unwrap();

            assert_eq!(result.len(), 25);

            let game = GameFactory.generate(connection);
            let _ = Game::save(game.clone(), connection);
            let player_quests = PlayerQuest::load(game.id, connection).expect("Error");

            assert_eq!(player_quests.len(), 25);
            assert_eq!(player_quests[0].status.owned, false);
        });
    }

    #[test]
    fn test_activate_player_quest() {
        allow_db_access(|connection| {
            let quest = QuestFactory.generate();
            let game = GameFactory.generate(connection);
            let _ = Quest::save(quest, connection);
            let _ = Game::save(game.clone(), connection);

            let player_quests = PlayerQuest::load(game.id, connection).expect("Error");
            let player_quest = &player_quests[0];

            PlayerQuest::activate(player_quest.clone(), connection);

            let patched_quest = PlayerQuest::get(player_quest.id, connection).expect("Error");
            assert!(patched_quest.status.owned);
        });
    }

    #[test]
    fn test_validate_player_quest() {
        allow_db_access(|connection| {
            let quest = QuestFactory.generate();
            let game = GameFactory.generate(connection);
            let _ = Quest::save(quest.clone(), connection);
            let _ = Game::save(game.clone(), connection);

            let player_quests = PlayerQuest::load(game.id, connection).expect("Error");
            let player_quest = &player_quests[0];

            PlayerQuest::validate(player_quest.clone(), quest.reward, connection);

            let player = Game::load(game.id, connection).expect("Error").character;
            assert_eq!(player.lvl, 2);
            assert_eq!(player.xp, 3);
            assert_eq!(player.max_xp, 183);
        });
    }

    #[test]
    fn test_edit_player_quest() {
        allow_db_access(|connection| {
            let quest = QuestFactory.generate();
            let game = GameFactory.generate(connection);
            let _ = Quest::save(quest, connection);
            let _ = Game::save(game.clone(), connection);

            let player_quests = PlayerQuest::load(game.id, connection).expect("Error");
            let player_quest = &player_quests[0];

            PlayerQuest::edit(player_quest.clone(), "completed", true, connection);

            let patched_quest = PlayerQuest::get(player_quest.id, connection).expect("Error");
            assert!(patched_quest.status.completed);
        });
    }
}
