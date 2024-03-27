use super::models::TableLoot;
use crate::loot::table::tables::*;
use lazy_static::lazy_static;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct NamedTableLoot {
    pub name: String,
    pub table: TableLoot,
}

lazy_static! {
    // Predefined loot tables vector
    pub static ref NAMED_TABLES: Vec<NamedTableLoot> = NamedTableLoot::get_all();
}

impl NamedTableLoot {
    pub fn get_all() -> Vec<NamedTableLoot> {
        vec![FIRST_TABLE.clone()]
    }
}
