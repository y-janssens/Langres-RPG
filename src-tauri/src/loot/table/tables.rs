use super::models::TableLoot;
use crate::{
    loot::{
        models::{BaseWeapon, ItemTypes, Loot},
        table::definitions::NamedTableLoot,
    },
    translations::models::Translations,
};
use lazy_static::lazy_static;
use uuid::Uuid;

lazy_static! {
    // Predefined loot tables definitions
    pub static ref FIRST_TABLE: NamedTableLoot = NamedTableLoot {
            name: "test".to_string(),
            table: TableLoot {
                items: vec![
                    Loot {
                        id: Uuid::new_v4().to_string(),
                        item_type: "gold".to_string(),
                        item: ItemTypes::Gold(100),
                    },
                    Loot {
                        id: Uuid::new_v4().to_string(),
                        item_type: "weapon".to_string(),
                        item: ItemTypes::Weapon(BaseWeapon {
                            name: Translations::generate("Épée courte", "Short sword"),
                            description: Translations::generate("Une simple épée", "A basic sword"),
                            damage: 12,
                            parade: 12,
                            price: 12,
                            weight: 3.0
                            }),
                    },
                ],
            },
        };
}
