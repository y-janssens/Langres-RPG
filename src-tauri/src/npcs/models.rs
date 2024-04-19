use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::npcs::tables::NPCS;
use crate::{
    character::models::Inventory, game::models::Position, quests::models::Quest,
    translations::models::Translations,
};

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub enum Gender {
    Male,
    Female,
    Unknown,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub enum Class {
    Human,
    Soldier,
    Zombie,
    Zealot,
    Bandit,
    Priest,
    Merchant,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct Npc {
    pub id: String,
    pub first_name: String,
    pub last_name: String,
    pub title: Translations,
    pub class: Class,
    pub end: u32,
    pub r#for: u32,
    pub hab: u32,
    pub cha: u32,
    pub int: u32,
    pub ini: u32,
    pub pv: u32,
    pub level: u8,
    pub gender: Gender,
    pub map_id: i32,
    pub unique: bool,
    pub hostile: bool,
    pub is_alive: bool,
    pub can_be_hostile: bool,
    pub inventory: Inventory,
    pub quests: NpcQuests,
    pub dialogs: NpcDialogs,
    pub starting_point: Position,
}

impl Npc {
    pub fn get_for_map(map_id: i32) -> Vec<Npc> {
        NPCS.iter()
            .filter(|npc| npc.map_id == map_id)
            .cloned()
            .collect()
    }

    pub fn get_merchant(
        first_name: &str,
        last_name: &str,
        gender: Gender,
        map_id: i32,
        inventory: Inventory,
        position: (f32, f32, u32),
    ) -> Npc {
        Npc {
            id: Uuid::new_v4().to_string(),
            first_name: first_name.to_string(),
            last_name: last_name.to_string(),
            title: Translations::blank(),
            class: Class::Merchant,
            end: 8,
            r#for: 8,
            hab: 8,
            cha: 8,
            int: 8,
            ini: 8,
            pv: 65,
            level: 1,
            gender,
            map_id,
            unique: false,
            hostile: false,
            is_alive: true,
            can_be_hostile: false,
            inventory,
            quests: NpcQuests::get_quests(None),
            dialogs: NpcDialogs::get_merchant_dialogs(),
            starting_point: Position::resolve(position),
        }
    }

    pub fn get_zombie(
        gender: Gender,
        map_id: i32,
        inventory: Inventory,
        position: (f32, f32, u32),
    ) -> Npc {
        Npc {
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
            gender,
            map_id,
            unique: false,
            hostile: true,
            is_alive: true,
            can_be_hostile: true,
            inventory,
            quests: NpcQuests::empty(),
            dialogs: NpcDialogs::empty(),
            starting_point: Position::resolve(position),
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct Quote {
    pub order: u8,
    pub quote: Translations,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct NpcDialogs {
    pub npc: Vec<Quote>,
    pub player: Vec<Quote>,
}

impl NpcDialogs {
    pub fn empty() -> NpcDialogs {
        NpcDialogs {
            npc: vec![],
            player: vec![],
        }
    }

    pub fn get_merchant_dialogs() -> NpcDialogs {
        NpcDialogs {
            npc: vec![
                Quote {
                    order: 0,
                    quote: Translations::generate("Bonjour", "Hello"),
                },
                Quote {
                    order: 1,
                    quote: Translations::generate(
                        "Jetez donc un oeil à mes marchandises!",
                        "Take a look at my goods",
                    ),
                },
            ],
            player: vec![],
        }
    }

    pub fn generate(quotes: Vec<Translations>) -> NpcDialogs {
        let mut result = NpcDialogs {
            npc: vec![],
            player: vec![],
        };

        for (index, quote) in quotes.iter().enumerate() {
            if index % 2 == 0 {
                result.npc.push(Quote {
                    order: index as u8,
                    quote: quote.clone(),
                })
            } else {
                result.player.push(Quote {
                    order: index as u8,
                    quote: quote.clone(),
                })
            }
        }

        result
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct NpcQuests(pub Vec<Quest>);

impl NpcQuests {
    pub fn empty() -> NpcQuests {
        NpcQuests(vec![])
    }

    pub fn get_quests(ids: Option<Vec<String>>) -> NpcQuests {
        let mut result: Vec<Quest> = Vec::new();

        if let Some(ids) = ids {
            let quests = Quest::load();

            for quest in quests {
                if ids.contains(&quest.id) {
                    result.push(quest);
                }
            }
        }

        NpcQuests(result)
    }
}
