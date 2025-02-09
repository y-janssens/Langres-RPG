use crate::{
    backend::translations::models::Translations,
    character::models::Inventory,
    game::models::Position,
    loot::table::{base::*, tables::SER_HERBERT_TABLE},
    quests::definitions::*,
};

use super::models::*;
use lazy_static::lazy_static;

lazy_static! {
    // Predefined named npcs
    pub static ref SER_HERBERT: Npc = Npc {
            id: "named_npc_ser_herbert".to_string(),
            first_name: "Herbert".to_string(),
            last_name: "de Landemer".to_string(),
            title: Translations::generate("Ser", "Sir"),
            class: Class::Human,
            end: 12,
            r#for: 12,
            hab: 12,
            cha: 12,
            int: 12,
            ini: 12,
            pv: 100,
            level: 2,
            gender: Gender::Male,
            map_id: 1498719483,
            unique: true,
            hostile: false,
            is_alive: true,
            r#static: false,
            can_be_hostile: true,
            inventory: Inventory {
                right_hand: Some(BASE_WEAPON.clone()),
                left_hand: Some(BASE_SHIELD.clone()),
                head: Some(BASE_HELMET.clone()),
                torso: Some(BASE_ARMOR.clone()),
                legs: Some(BASE_LEGS.clone()),
                gold: BASE_GOLD.clone().price.unwrap() as u32,
                objects: SER_HERBERT_TABLE.clone().table.items,
            },
            quests: NpcQuests(vec![MAIN_QUEST_1.clone()]),
            dialogs: NpcDialogs::generate(vec![
                Translations::generate("Ser Adam?", "Sir Adam?"),
                Translations::generate(
                    "Dans chaque ami, il y a la moitié d'un traître.",
                    "In every friend, there is half of a traitor.",
                ),
                Translations::generate("Qu'as tu dit?!", "What did you say?!"),
                Translations::generate("J'ai dit meurs, traitre!", "I said die, traitor!"),
            ]),
            starting_point: Position::resolve((59.0, 30.0, 1529))
        };
}
