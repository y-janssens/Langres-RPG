use std::collections::HashSet;

use crate::{
    backend::translations::models::Translations,
    loot::models::{ItemTypes, Loot},
};
use diesel::{result::Error, SqliteConnection};
use rand::{seq::IteratorRandom, thread_rng};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use super::{config::Conf, definitions::NAMED_TABLES};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct TableLoot {
    pub items: Vec<Loot>,
}

impl TableLoot {
    pub fn generate(name: Option<String>, connection: &mut SqliteConnection) -> Result<Vec<Loot>, Error> {
        let config = Conf::get_config();
        let capacity = config.clone().get_level();
        let mut table = Vec::with_capacity(capacity);

        if let Some(n) = name {
            return Ok(Self::resolve_named_table(&n, table));
        } else {
            let base_loot = Loot::load(connection)?;

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
        let set_loot: HashSet<Loot> = table.clone().into_iter().collect();
        Ok(set_loot.into_iter().collect())
    }

    fn resolve_named_table(name: &str, mut table: Vec<Loot>) -> Vec<Loot> {
        let binding = NAMED_TABLES.clone();
        let named_table = binding.iter().find(|table| table.name == name);

        if let Some(_table) = named_table {
            for item in &_table.table.items {
                table.push(item.clone());
            }
        }
        table
    }

    fn resolve_gold(config: Conf) -> Option<Loot> {
        let gold = config.values.gold;
        if gold > 0 {
            Some(Loot {
                id: Uuid::new_v4().to_string(),
                item_type: ItemTypes::Gold,
                name: Translations::blank(),
                description: Translations::blank(),
                armor: None,
                damage: None,
                random: None,
                parade: None,
                price: Some(gold as i32),
                weight: None,
            })
        } else {
            None
        }
    }

    fn resolve_item(kind: &str, table: &[Loot]) -> Option<Loot> {
        let mut rng = thread_rng();
        let items: Vec<&Loot> = table.iter().filter(|item| item.item_type == ItemTypes::resolve(kind)).collect();

        if let Some(&item) = items.iter().choose(&mut rng) {
            Some(item.clone())
        } else {
            None
        }
    }
}
