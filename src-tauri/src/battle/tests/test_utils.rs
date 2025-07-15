#[cfg(test)]
pub mod helpers {

    use diesel::SqliteConnection;
    use dotenv::dotenv;
    use std::env;

    use crate::{
        backend::{settings::errors::BASE_ERROR, translations::models::Translations},
        battle::{models::BattleSystem, objects::Object, settings::TamperMode},
        character::models::Character,
        loot::models::{ItemTypes, Loot},
        npcs::models::Npc,
    };

    pub fn with_tampering<T>(tamper: TamperMode, unit_test: T)
    where
        T: FnOnce(),
    {
        env::set_var("TAMPERING_MODE", tamper.to_string());
        dotenv().ok();

        unit_test();

        env::remove_var("TAMPERING_MODE");
    }

    pub fn setup_battle_system(connection: &mut SqliteConnection) -> BattleSystem {
        let character = Character::new("test".to_string(), connection).expect(BASE_ERROR);
        let npc = Npc::new(1, (0.0, 0.0, 0));

        BattleSystem::initialize(character, npc, connection).unwrap()
    }

    pub fn setup_battle_system_with_aps(
        connection: &mut SqliteConnection,
        aps: i32,
    ) -> BattleSystem {
        let mut character = Character::new("test".to_string(), connection).expect(BASE_ERROR);
        character.ap = aps;
        let npc = Npc::new(1, (0.0, 0.0, 0));

        BattleSystem::initialize(character, npc, connection).unwrap()
    }

    pub fn setup_battle_system_with_loot(
        object: &Object,
        connection: &mut SqliteConnection,
    ) -> BattleSystem {
        let mut character = Character::new("test".to_string(), connection).expect(BASE_ERROR);
        let loot = Loot {
            id: format!("obj_{}", object.to_string()),
            item_type: ItemTypes::Consumable,
            name: Translations::blank(),
            description: Translations::blank(),
            armor: None,
            damage: Some(5),
            random: Some(2),
            parade: None,
            price: None,
            weight: Some(1),
        };
        character.inventory.add_objects(vec![loot.clone(), loot]);
        character.pv = 40;
        let npc = Npc::new(1, (0.0, 0.0, 0));

        BattleSystem::initialize(character, npc, connection).unwrap()
    }
}
