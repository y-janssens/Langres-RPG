#[cfg(test)]
mod tests {
    use crate::{
        character::models::{Character, Inventory},
        config::{
            conf::test_conf::allow_db_access,
            factories::factories_definitions::{GameFactory, LootFactory, StoryLineFactory},
            factory::factory_models::{ApiFactory, Factory},
        },
        game::models::{Game, Position},
        loot::table::base::*,
    };

    #[test]
    fn test_lvl_up_character() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);

            game.character.compute_xp(153);

            let _ = game.save(connection);

            let patched_game = Game::load(game.id, connection).unwrap();

            assert_eq!(patched_game.character.lvl, 2);
            assert_eq!(patched_game.character.xp, 3);
            assert_eq!(patched_game.character.max_xp, 183);
        });
    }

    #[test]
    fn test_inventory_add_gold() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let gold = BASE_GOLD.clone();

            game.character.inventory.add_gold(gold);

            let _ = game.save(connection);

            let patched_game = Game::load(game.id, connection).unwrap();

            assert_eq!(patched_game.character.inventory.gold, 20);
        });
    }

    #[test]
    fn test_inventory_remove_gold() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);

            game.character.inventory.remove_gold(3);

            let _ = game.save(connection);

            let patched_game = Game::load(game.id, connection).unwrap();

            assert_eq!(patched_game.character.inventory.gold, 7);
        });
    }
    #[test]
    fn test_inventory_remove_gold_overflow() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);

            game.character.inventory.remove_gold(13);

            let _ = game.save(connection);

            let patched_game = Game::load(game.id, connection).unwrap();

            assert_eq!(patched_game.character.inventory.gold, 0);
        });
    }

    #[test]
    fn test_inventory_add_objects() {
        allow_db_access(|connection| {
            let mut game = GameFactory.generate(connection);
            let item = LootFactory.generate();
            assert_eq!(game.character.inventory.objects.len(), 0);

            game.character.inventory.add_objects(vec![item]);

            let _ = game.save(connection);

            let patched_game = Game::load(game.id, connection).unwrap();

            assert_eq!(patched_game.character.inventory.objects.len(), 1);
        });
    }

    #[test]
    fn test_inventory_remove_objects() {
        allow_db_access(|connection| {
            let items = vec![
                LootFactory.generate(),
                LootFactory.generate(),
                LootFactory.generate(),
            ];

            let mut game = Game {
                id: "test".to_string(),
                player: "test".to_string(),
                date_created: "test".to_string(),
                last_save_date: "test".to_string(),
                save_count: 0,
                character: Character {
                    first_name: "test".to_string(),
                    last_name: "".to_string(),
                    end: 8,
                    r#for: 8,
                    hab: 8,
                    cha: 8,
                    int: 8,
                    ini: 8,
                    pv: 8,
                    xp: 8,
                    max_xp: 8,
                    lvl: 8,
                    inventory: Inventory {
                        right_hand: Some(BASE_WEAPON.clone()),
                        left_hand: Some(BASE_SHIELD.clone()),
                        head: Some(BASE_HELMET.clone()),
                        torso: Some(BASE_ARMOR.clone()),
                        legs: Some(BASE_LEGS.clone()),
                        gold: BASE_GOLD.clone().price.unwrap() as u32,
                        objects: items.clone(),
                    },
                },
                storyline: StoryLineFactory.generate(),
                visible: true,
                last_known_position: Position {
                    id: 111,
                    x: 0.0,
                    y: 0.0,
                },
            };
            let _ = game.save(connection);
            assert_eq!(game.character.inventory.objects.len(), 3);

            game.character.inventory.remove_object(items[0].id.clone());

            let _ = game.save(connection);
            let re_patched_game = Game::load(game.id, connection).unwrap();
            assert_eq!(re_patched_game.character.inventory.objects.len(), 2);
        });
    }
}
