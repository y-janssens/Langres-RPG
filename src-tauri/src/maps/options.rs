use super::models::Tile;
use crate::maps::generator::Generator;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Options {
    pub r#type: String,
    pub town: bool,
    pub shanty: bool,
}

impl Options {
    pub fn perform_actions(&self, items: Vec<Tile>) -> Vec<Tile> {
        if self.town {
            return Generator::generate_town(items);
        }
        if self.shanty {
            return Generator::generate_shanty(items);
        }
        items
    }
}
