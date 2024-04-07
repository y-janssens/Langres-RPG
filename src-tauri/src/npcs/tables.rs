use crate::npcs::named::*;

use super::models::*;
use lazy_static::lazy_static;

lazy_static! {
    // Predefined npcs table
    pub static ref NPCS: Vec<Npc> = vec![
        // BASE_ZOMBIE.clone(),
        // BASE_MERCHANT.clone(),
        SER_HERBERT.clone()

    ];
}
