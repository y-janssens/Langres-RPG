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
        price: Some(10),
        weight: None,
    };
    pub static ref BASE_WEAPON: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: ItemTypes::Weapon,
        name: Translations::generate("Épée longue", "Long sword"),
        description: Translations::generate("Une simple longue", "A long sword"),
        armor: None,
        damage: Some(14),
        parade: Some(14),
        price: Some(14),
        weight: Some(4)
    };
    pub static ref BASE_SHIELD: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: ItemTypes::Weapon,
        name: Translations::generate("Bouclier", "Shield"),
        description: Translations::generate("Un bouclier d'acier", "A steel shield"),
        armor: Some(14),
        damage: Some(2),
        parade: Some(14),
        price: Some(16),
        weight: Some(5)
    };
    pub static ref BASE_HELMET: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: ItemTypes::Equipment,
        name: Translations::generate("Heaume", "Helmet"),
        description: Translations::generate("Un heaume d'acier", "A steel helmet"),
        armor: Some(10),
        damage: None,
        parade: Some(10),
        price: Some(12),
        weight: Some(2)
    };
    pub static ref BASE_ARMOR: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: ItemTypes::Equipment,
        name: Translations::generate("Plastron", "Armor"),
        description: Translations::generate("Une armure d'acier", "A steel armor"),
        armor: Some(10),
        damage: None,
        parade: Some(10),
        price: Some(12),
        weight: Some(2)
    };
    pub static ref BASE_LEGS: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: ItemTypes::Equipment,
        name: Translations::generate("Jambières", "Legs"),
        description: Translations::generate("Des jambières d'acier", "Steel plated leggings"),
        armor: Some(10),
        damage: None,
        parade: Some(10),
        price: Some(12),
        weight: Some(2)
    };
}
