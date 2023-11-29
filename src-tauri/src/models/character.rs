pub mod character {

    use crate::models::inventory::inventory::Inventory;
    use diesel::{
        deserialize::{self, FromSql},
        prelude::Queryable,
        sql_types::Text,
        sqlite::{Sqlite, SqliteValue},
    };
    use serde::{Deserialize, Serialize};
    #[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
    pub struct Character {
        name: String,
        _end: u32,
        _for: u32,
        _hab: u32,
        _cha: u32,
        _int: u32,
        _ini: u32,
        _pv: u32,
        xp: u32,
        max_xp: u32,
        gold: u64,
        lvl: u32,
        inventory: Inventory,
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
                name: String::from(name),
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
            return self;
        }

        fn level_up(&mut self, xp: u32) -> &mut Character {
            let max_xp: u32 = Self::get_max_xp(&self);
            self.max_xp = max_xp;
            self.lvl += 1;
            if xp >= max_xp {
                return Self::compute_xp(self, self.xp + xp - max_xp);
            }
            self.xp = xp;
            return self;
        }

        fn get_max_xp(&self) -> u32 {
            ((150 + (self.lvl * 100) / 3) as f64).round() as u32
        }
    }
}
