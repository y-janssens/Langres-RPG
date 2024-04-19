use super::models::TableLoot;
use crate::{
    loot::{
        models::{ItemTypes, Loot},
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
                        item_type: ItemTypes::Gold,
                        name: Translations::blank(),
                        description: Translations::blank(),
                        armor: None,
                        damage: None,
                        parade: None,
                        price: Some(100),
                        weight: None,
                    },
                    Loot {
                        id: Uuid::new_v4().to_string(),
                        item_type: ItemTypes::Weapon,
                        name: Translations::generate("Épée longue", "Long sword"),
                        description: Translations::generate("Une simple longue", "A long sword"),
                        armor: None,
                        damage: Some(12),
                        parade: Some(12),
                        price: Some(12),
                        weight: Some(3)
                    },
                ],
            },
        };

     pub static ref SER_HERBERT_TABLE: NamedTableLoot = NamedTableLoot {
            name: "ser_herbert_table".to_string(),
            table: TableLoot {
                items: vec![
                    Loot::gold(100),
                    Loot {
                        id: Uuid::new_v4().to_string(),
                        item_type: ItemTypes::Weapon,
                        name: Translations::generate("Ordalie", "Ordeal"),
                        description: Translations::generate(
                            "Une épée longue, ayant appartenu au traître, Ser Herbert",
                            "A long sword that belonged to the traitor, Sir Herbert"),
                        armor: None,
                        damage: Some(16),
                        parade: Some(14),
                        price: Some(25),
                        weight: Some(4)
                    },
                ],
            },
        };
}
