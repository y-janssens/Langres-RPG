use diesel::prelude::Queryable;
use serde::{Deserialize, Serialize};

use crate::loot::{
    models::{ItemTypes, Loot},
    table::base::*,
};
#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Character {
    pub first_name: String,
    pub last_name: String,
    pub end: u32,
    pub r#for: u32,
    pub hab: u32,
    pub cha: u32,
    pub int: u32,
    pub ini: u32,
    pub pv: u32,
    pub xp: u32,
    pub max_xp: u32,
    pub lvl: u32,
    pub inventory: Inventory,
}

impl Character {
    pub fn new(name: String) -> Character {
        let full_name: Vec<&str> = name.split_whitespace().collect();

        let first_name = full_name.first().unwrap_or(&"").to_string();
        let last_name = if full_name.len() > 1 {
            full_name[1..].join(" ")
        } else {
            "".to_string()
        };

        Character {
            first_name,
            last_name,
            end: 8,
            r#for: 8,
            hab: 8,
            cha: 8,
            int: 8,
            ini: 8,
            pv: 60,
            xp: 0,
            max_xp: 150,
            lvl: 1,
            inventory: Inventory::new(),
        }
    }

    pub fn compute_xp(&mut self, xp: u32) -> &mut Character {
        let new_xp = self.xp + xp;
        let max_xp = self.max_xp;
        if new_xp >= max_xp {
            return Self::level_up(self, new_xp - max_xp);
        }
        self.xp = new_xp;
        self
    }

    fn level_up(&mut self, xp: u32) -> &mut Character {
        let max_xp: u32 = Self::get_max_xp(self);
        self.max_xp = max_xp;
        self.lvl += 1;
        if xp >= max_xp {
            return Self::compute_xp(self, self.xp + xp - max_xp);
        }
        self.xp = xp;
        self
    }

    fn get_max_xp(&self) -> u32 {
        ((150 + (self.lvl * 100) / 3) as f64).round() as u32
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct Inventory {
    pub right_hand: Option<Loot>,
    pub left_hand: Option<Loot>,
    pub head: Option<Loot>,
    pub torso: Option<Loot>,
    pub legs: Option<Loot>,
    pub gold: u32,
    pub objects: Vec<Loot>,
}

impl Inventory {
    pub fn new() -> Inventory {
        println!("Generating inventory...");

        Inventory {
            right_hand: Some(BASE_WEAPON.clone()),
            left_hand: Some(BASE_SHIELD.clone()),
            head: Some(BASE_HELMET.clone()),
            torso: Some(BASE_ARMOR.clone()),
            legs: Some(BASE_LEGS.clone()),
            gold: BASE_GOLD.clone().price.unwrap() as u32,
            objects: vec![],
        }
    }

    pub fn empty() -> Inventory {
        Inventory {
            right_hand: None,
            left_hand: None,
            head: None,
            torso: None,
            legs: None,
            gold: 0_u32,
            objects: vec![],
        }
    }

    pub fn basic(items: Vec<Loot>) -> Inventory {
        Inventory {
            right_hand: None,
            left_hand: None,
            head: None,
            torso: None,
            legs: None,
            gold: 10_u32,
            objects: items,
        }
    }

    pub fn add_gold(&mut self, loot: Loot) {
        if loot.item_type == ItemTypes::Gold {
            self.gold += loot.price.unwrap() as u32;
        }
    }

    pub fn remove_gold(&mut self, value: i32) {
        self.gold = std::cmp::max(0, self.gold as i32 - value) as u32;
    }

    pub fn add_objects(&mut self, items: Vec<Loot>) {
        for item in items {
            self.objects.push(item)
        }
    }

    pub fn remove_object(&mut self, id: String) {
        let objects: Vec<Loot> = self
            .objects
            .iter()
            .filter(|item| item.id != id)
            .cloned()
            .collect();

        self.objects = objects;
    }
}
