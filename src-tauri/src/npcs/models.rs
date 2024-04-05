use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::npcs::tables::NPCS;
use crate::{
    character::models::Inventory, game::models::Position, quests::models::Quest,
    translations::models::Translations,
};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub enum Gender {
    Male,
    Female,
    Unknown,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub enum Class {
    Human,
    Soldier,
    Zombie,
    Zealot,
    Bandit,
    Priest,
    Merchant,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct NpcQuests(pub Vec<Quest>);

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct NpcDialogs(pub Vec<Translations>);

#[derive(Debug, Serialize, Deserialize, Clone)]
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
        position: Position,
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
            quests: Self::get_quests(None),
            dialogs: Self::get_merchant_dialogs(),
            starting_point: position,
        }
    }

    fn get_merchant_dialogs() -> NpcDialogs {
        NpcDialogs(vec![
            Translations::generate("Bonjour", "Hello"),
            Translations::generate(
                "Jetez donc un oeil à mes marchandises!",
                "Take a look at my goods",
            ),
        ])
    }

    fn get_quests(id: Option<String>) -> NpcQuests {
        if id.is_some() {
            let quests = Quest::load();
            return NpcQuests(
                quests
                    .iter()
                    .filter(|q| q.id == id.clone().unwrap())
                    .cloned()
                    .collect(),
            );
        }
        NpcQuests(vec![])
    }
}
