use crate::{character::models::Inventory, loot::table::tables::FIRST_TABLE};

use super::models::*;
use lazy_static::lazy_static;

lazy_static! {
    // Predefined npcs
    pub static ref BASE_ZOMBIE: Npc = Npc::get_zombie(
        Gender::Unknown,
        1498719483,
        Inventory::empty(),
        (15.0, 32.0, 1607)
    );

    pub static ref BASE_MERCHANT: Npc = Npc::get_merchant(
        "Gabin",
        "Porcher",
        Gender::Male,
        1498719483,
        Inventory::basic(FIRST_TABLE.clone().table.items),
        (21.0, 14.0, 710)
    );
}
