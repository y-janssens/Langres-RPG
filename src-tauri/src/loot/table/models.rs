use crate::loot::models::{ItemTypes, Loot};
use diesel::SqliteConnection;
use rand::{seq::IteratorRandom, thread_rng};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use super::{config::Conf, definitions::NAMED_TABLES};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct TableLoot {
    pub items: Vec<Loot>,
}

impl TableLoot {
    pub fn generate(name: Option<String>, connection: &mut SqliteConnection) -> Vec<Loot> {
        let config = Conf::get_config();
        let capacity = config.clone().get_level();
        let mut table = Vec::with_capacity(capacity);

        if let Some(n) = name {
            return Self::resolve_named_table(&n, table);
        } else {
            let base_loot = Loot::load(connection).expect("Failed to load base loot table");

            let gold = Self::resolve_gold(config.clone());

            if gold.is_some() {
                if let Some(g) = gold {
                    table.push(g)
                }
            }

            if config.clone().values.weapon.is_some() {
                if let Some(weapon) = Self::resolve_item("weapon", &base_loot) {
                    table.push(weapon)
                }
            }

            if config.clone().values.equipment.is_some() {
                if let Some(equipment) = Self::resolve_item("equipment", &base_loot) {
                    table.push(equipment)
                }
            }

            if config.clone().values.craftable.is_some() {
                if let Some(craftable) = Self::resolve_item("craftable", &base_loot) {
                    table.push(craftable)
                }
            }

            if config.clone().values.thrash.is_some() {
                if let Some(thrash) = Self::resolve_item("thrash", &base_loot) {
                    table.push(thrash)
                }
            }
        }
        table
    }

    fn resolve_named_table(name: &str, mut table: Vec<Loot>) -> Vec<Loot> {
        let binding = NAMED_TABLES.clone();
        let named_table = binding.iter().find(|table| table.name == name).unwrap();

        for item in &named_table.table.items {
            table.push(item.clone());
        }
        table
    }

    fn resolve_gold(config: Conf) -> Option<Loot> {
        let gold = config.values.gold;
        if gold > 0 {
            Some(Loot {
                id: Uuid::new_v4().to_string(),
                item_type: String::from("gold"),
                item: ItemTypes::Gold(gold),
            })
        } else {
            None
        }
    }

    fn resolve_item(kind: &str, table: &[Loot]) -> Option<Loot> {
        let mut rng = thread_rng();
        let items: Vec<&Loot> = table.iter().filter(|item| item.item_type == kind).collect();

        if let Some(&item) = items.iter().choose(&mut rng) {
            Some(item.clone())
        } else {
            None
        }
    }
}
