#[allow(dead_code)]

pub mod inventory {
    use serde::{Deserialize, Serialize};
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
            Inventory {
                right_hand: String::from("Sword"),
                left_hand: String::from("Shield"),
                head: String::from("Helmet"),
                torso: String::from("Armor"),
                legs: String::from("Legs"),
                objects: Vec::new(),
            }
        }

        pub fn add_objects(&mut self, items: Vec<String>) {
            for item in items {
                self.objects.push(String::from(item))
            }
        }
    }
}
