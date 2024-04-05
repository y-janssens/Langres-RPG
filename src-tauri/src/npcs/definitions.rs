use crate::{
    character::models::Inventory, game::models::Position, loot::table::tables::FIRST_TABLE,
    translations::models::Translations,
};

use super::models::*;
use lazy_static::lazy_static;
use uuid::Uuid;

lazy_static! {
    // Predefined npcs
    pub static ref BASE_ZOMBIE: Npc = Npc {
            id: Uuid::new_v4().to_string(),
            first_name: "???".to_string(),
            last_name: "???".to_string(),
            title: Translations::blank(),
            class: Class::Zombie,
            end: 12,
            r#for: 12,
            hab: 12,
            cha: 12,
            int: 12,
            ini: 12,
            pv: 100,
            level: 1,
            gender: Gender::Unknown,
            map_id: 1302422795,
            unique: false,
            hostile: true,
            is_alive: true,
            can_be_hostile: true,
            inventory: Inventory::empty(),
            quests: NpcQuests(vec![]),
            dialogs: NpcDialogs(vec![]),
            starting_point: Position {
                x: 15.0,
                y: 32.0,
                id: 1607
            }
        };

    pub static ref BASE_MERCHANT: Npc = Npc::get_merchant(
        "Gabin",
        "Porcher",
        Gender::Male,
        1302422795,
        Inventory::basic(FIRST_TABLE.clone().table.items),
        Position {
            x: 21.0,
            y: 14.0,
            id: 710
        }
    );
}
