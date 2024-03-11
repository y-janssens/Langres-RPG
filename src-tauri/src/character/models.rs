use diesel::{
    deserialize::{self, FromSql},
    prelude::Queryable,
    sql_types::Text,
    sqlite::{Sqlite, SqliteValue},
};
use serde::{Deserialize, Serialize};
#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Character {
    pub name: String,
    pub _end: u32,
    pub _for: u32,
    pub _hab: u32,
    pub _cha: u32,
    pub _int: u32,
    pub _ini: u32,
    pub _pv: u32,
    pub xp: u32,
    pub max_xp: u32,
    pub gold: u64,
    pub lvl: u32,
    pub inventory: Inventory,
}

impl FromSql<Text, Sqlite> for Character {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Character {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Character {
    pub fn new(name: String) -> Character {
        Character {
            name,
            _end: 8,
            _for: 8,
            _hab: 8,
            _cha: 8,
            _int: 8,
            _ini: 8,
            _pv: 60,
            xp: 0,
            max_xp: 150,
            gold: 10,
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

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Inventory {
    right_hand: String,
    left_hand: String,
    head: String,
    torso: String,
    legs: String,
    objects: Vec<String>,
}

impl Inventory {
    pub fn new() -> Inventory {
        println!("Generating inventory...");
        Inventory {
            right_hand: String::from("Sword"),
            left_hand: String::from("Shield"),
            head: String::from("Helmet"),
            torso: String::from("Armor"),
            legs: String::from("Legs"),
            objects: Vec::new(),
        }
    }

    // pub fn add_objects(&mut self, items: Vec<String>) {
    //     for item in items {
    //         self.objects.push(item)
    //     }
    // }
}
