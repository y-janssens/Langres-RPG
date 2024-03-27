use crate::{
    loot::models::{BaseEquipment, BaseWeapon, ItemTypes, Loot},
    translations::models::Translations,
};
use lazy_static::lazy_static;
use uuid::Uuid;

lazy_static! {
    pub static ref BASE_GOLD: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: "gold".to_string(),
        item: ItemTypes::Gold(10),
    };
    pub static ref BASE_WEAPON: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: "weapon".to_string(),
        item: ItemTypes::Weapon(BaseWeapon {
            name: Translations::generate("Épée longue", "Long sword"),
            description: Translations::generate("Une simple longue", "A long sword"),
            damage: 14,
            parade: 14,
            price: 14,
            weight: 4.0
        }),
    };
    pub static ref BASE_SHIELD: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: "weapon".to_string(),
        item: ItemTypes::Weapon(BaseWeapon {
            name: Translations::generate("Bouclier", "Shield"),
            description: Translations::generate("Un bouclier d'acier", "A steel shield"),
            damage: 2,
            parade: 14,
            price: 16,
            weight: 5.0
        }),
    };
    pub static ref BASE_HELMET: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: "equipment".to_string(),
        item: ItemTypes::Equipment(BaseEquipment {
            name: Translations::generate("Heaume", "Helmet"),
            description: Translations::generate("Un heaume d'acier", "A steel helmet"),
            armor: 10,
            parade: 10,
            price: 12,
            weight: 2.0
        }),
    };
    pub static ref BASE_ARMOR: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: "equipment".to_string(),
        item: ItemTypes::Equipment(BaseEquipment {
            name: Translations::generate("Plastron", "Armor"),
            description: Translations::generate("Une armure d'acier", "A steel armor"),
            armor: 10,
            parade: 10,
            price: 12,
            weight: 2.0
        }),
    };
    pub static ref BASE_LEGS: Loot = Loot {
        id: Uuid::new_v4().to_string(),
        item_type: "equipment".to_string(),
        item: ItemTypes::Equipment(BaseEquipment {
            name: Translations::generate("Jambières", "Legs"),
            description: Translations::generate("Des jambières d'acier", "Steel plated leggings"),
            armor: 10,
            parade: 10,
            price: 12,
            weight: 2.0
        }),
    };
}
