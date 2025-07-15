use crate::{
    backend::translations::models::Translations,
    loot::models::{ItemTypes, Loot},
};
use lazy_static::lazy_static;
use uuid::Uuid;

lazy_static! {
    pub static ref BASE_GOLD: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: ItemTypes::Gold,
        name: Translations::blank(),
        description: Translations::blank(),
        armor: None,
        damage: None,
        parade: None,
        random: None,
        price: Some(10),
        weight: None,
    };
    pub static ref CLAWS: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: ItemTypes::Weapon,
        name: Translations::generate("Griffes", "Claws"),
        description: Translations::generate("Des griffes acérées", "Sharp claws"),
        armor: None,
        damage: Some(18),
        parade: None,
        random: Some(8),
        price: None,
        weight: None
    };
    pub static ref FISTS: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: ItemTypes::Weapon,
        name: Translations::generate("Poings", "Fists"),
        description: Translations::generate("Des poings nus", "Bare fists"),
        armor: None,
        damage: Some(5),
        parade: None,
        random: Some(4),
        price: None,
        weight: None
    };
}
