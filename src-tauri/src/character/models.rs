use diesel::prelude::Queryable;
use serde::{Deserialize, Serialize};

use crate::{
    battle::objects::Object,
    loot::{
        models::{ItemTypes, Loot},
        table::base::*,
    },
    npcs::models::Class,
};

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Character {
    pub first_name: String,
    pub last_name: String,
    pub class: Class,
    pub end: i32,
    pub r#for: i32,
    pub hab: i32,
    pub cha: i32,
    pub int: i32,
    pub ini: i32,
    pub att: i32,
    pub par: i32,
    pub tir: i32,
    pub ap: i32,
    pub pv: i32,
    pub xp: i32,
    pub lvl: i32,
    pub max_ap: i32,
    pub max_pv: i32,
    pub max_xp: i32,
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
            att: 8,
            par: 8,
            tir: 8,
            ap: 8,
            pv: 60,
            xp: 0,
            max_ap: 4,
            max_pv: 60,
            max_xp: 150,
            lvl: 1,
            class: Class::Knight,
            inventory: Inventory::new(),
        }
    }

    pub fn compute_xp(&mut self, xp: i32) -> &mut Character {
        let new_xp = self.xp + xp;
        let max_xp = self.max_xp;
        if new_xp >= max_xp {
            return self.level_up(new_xp - max_xp);
        }
        self.xp = new_xp;
        self
    }

    fn level_up(&mut self, xp: i32) -> &mut Character {
        let max_xp = self.get_max_xp();
        self.max_xp = max_xp;
        self.lvl += 1;
        if xp >= max_xp {
            return self.compute_xp(self.xp + xp - max_xp);
        }
        self.xp = xp;
        self
    }

    fn get_max_xp(&self) -> i32 {
        ((150 + (self.lvl * 100) / 3) as f64).round() as i32
    }

    /// Reset ap to default map_ap value
    pub fn reset_ap(&mut self) {
        self.ap = self.max_ap;
    }

    /// Compute aps based on actions cost
    pub fn validate_and_compute_ap(&mut self, cost: i32) -> bool {
        if !self.ap >= cost {
            return false;
        }
        self.ap = (self.ap - cost).max(0);
        true
    }

    pub fn inflict_damages(&mut self, damages: i32) {
        self.pv = (self.pv - damages).max(0)
    }

    pub fn restore_hps(&mut self, hps: i32) {
        self.pv = (self.pv + hps).min(self.max_pv)
    }

    pub fn get_consumables(&self, object: Option<&Object>) -> Vec<&Loot> {
        self.inventory.get_consumables(object)
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

impl Default for Inventory {
    fn default() -> Self {
        Self::new()
    }
}

impl Inventory {
    pub fn new() -> Self {
        Self {
            right_hand: Some(BASE_WEAPON.clone()),
            left_hand: Some(BASE_SHIELD.clone()),
            head: Some(BASE_HELMET.clone()),
            torso: Some(BASE_ARMOR.clone()),
            legs: Some(BASE_LEGS.clone()),
            gold: BASE_GOLD.clone().price.unwrap() as u32,
            objects: vec![],
        }
    }

    pub fn empty() -> Self {
        Self {
            right_hand: None,
            left_hand: None,
            head: None,
            torso: None,
            legs: None,
            gold: 0_u32,
            objects: vec![],
        }
    }

    pub fn basic(items: Vec<Loot>) -> Self {
        Self {
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
            self.gold += loot.price.unwrap_or(0) as u32;
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
        if let Some(index) = self.objects.iter().position(|item| item.id == id) {
            self.objects.remove(index);
        }
    }

    pub fn get_consumables(&self, object: Option<&Object>) -> Vec<&Loot> {
        let objects: Vec<&Loot> = self
            .objects
            .iter()
            .filter(|i| i.item_type == ItemTypes::Consumable)
            .collect();

        if let Some(obj) = object {
            return objects
                .into_iter()
                .filter(|ob| ob.id == format!("obj_{}", obj))
                .collect();
        }

        objects
    }
}
