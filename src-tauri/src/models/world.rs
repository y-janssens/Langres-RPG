pub mod world {
    use crate::models::objects::objects::Object;
    use diesel::prelude::Queryable;
    use rand::{seq::SliceRandom, Rng};
    use round::round;
    use serde::{Deserialize, Serialize};

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
    pub struct World {
        id: i32,
        name: String,
        size: u32,
        order: u32,
        complete: bool,
        content: Vec<Item>,
        starting_point: Location,
    }

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
    pub struct Item {
        id: u32,
        x: u32,
        y: u32,
        value: String,
        threshold: Option<Threshold>,
        walkable: bool,
    }

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
    pub struct Value {
        id: u32,
        value: String,
        name: String,
        assets: Vec<Option<Object>>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
    pub struct Threshold {
        map: i32,
    }

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
    pub struct Location {
        x: u32,
        y: u32,
    }

    impl World {
        pub fn new(size: u32, name: String, order: u32) -> World {
            World {
                id: Self::generate_id(),
                name: String::from(name),
                size,
                order,
                complete: false,
                content: Self::generate(size),
                starting_point: Location { x: 5, y: 5 },
            }
        }

        pub fn regenerate(size: u32) -> Vec<Item> {
            let content = Self::generate(size);
            content
        }

        fn generate(size: u32) -> Vec<Item> {
            println!("Generating world data...");
            let grid: u32 = size * size;

            let mut content = Vec::new();
            for i in 0..grid {
                let x = (i % size) as u32;
                let y = round((i / size) as f64, 1) as u32;
                let value = Self::generate_borders(x, y, size);

                let item = Item {
                    id: i,
                    x,
                    y,
                    value: value.clone(),
                    threshold: None,
                    walkable: value == "-",
                };
                content.push(item);
            }
            content
        }

        // Map content generation

        fn generate_borders(x: u32, y: u32, size: u32) -> String {
            if (x <= 1 || x >= size - 2) || (y <= 1 || y >= size - 2) {
                return String::from("F");
            }
            String::from("-")
        }

        pub fn generate_trees(content: Vec<Item>) -> Vec<Item> {
            println!("Generating game trees...");
            let items = Self::get_items("map");
            let mut new_content = Vec::new();

            for mut item in content {
                let value = String::from(*items.choose(&mut rand::thread_rng()).unwrap());
                if item.value != "F" {
                    item.value = value.clone();
                    item.walkable = value == "-";
                } else {
                    item.walkable = false;
                }
                new_content.push(item);
            }
            new_content
        }

        fn get_items(name: &str) -> Vec<&'static str> {
            match name {
                "map" => vec!["T", "-", "-", "-", "-", "-"],
                _ => vec![],
            }
        }

        fn generate_id() -> i32 {
            let mut rng = rand::thread_rng();
            rng.gen_range(1..=i32::MAX)
        }
    }
}
