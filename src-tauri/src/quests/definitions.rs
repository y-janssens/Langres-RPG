use crate::backend::translations::models::Translations;

use super::models::*;
use lazy_static::lazy_static;

lazy_static! {
    // Predefined quests
    pub static ref MAIN_QUEST_1: Quest = Quest {
        id: "main_quest_0001".to_string(),
        name: Translations::generate("Il faut battre le frère quand il est chaud", "Strike the brother while he's deceitful"),
        description: Translations::generate("Tuez Ser Herbert", "Kill Sir Herbert"),
        primary: true,
        status: Status::base(),
        visible: true,
        reward: 0,
        next: Some("main_quest_0002".to_string())
    };
    pub static ref MAIN_QUEST_2: Quest = Quest {
        id: "main_quest_0002".to_string(),
        name: Translations::generate("Renégats", "Renegades"),
        description: Translations::generate("Tuez Ser Herbert", "Kill Sir Herbert"),
        primary: true,
        status: Status::default(),
        visible: true,
        reward: 150,
        next: None
    };
}

pub fn get_all() -> Vec<Quest> {
    vec![MAIN_QUEST_1.clone(), MAIN_QUEST_2.clone()]
}
