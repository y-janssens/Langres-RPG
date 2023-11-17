#[allow(dead_code)]

pub mod world {
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
        threshold: bool,
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
                let item = Item {
                    id: i,
                    x,
                    y,
                    value: Self::generate_borders(x, y, size),
                    threshold: false,
                };
                content.push(item);
            }
            // let generated_content = Self::generate_content(content.clone(), size);
            content
        }

        // Map content generation

        fn generate_content(content: Vec<Item>, size: u32) -> Vec<Item> {
            let max_attemps: u32 = 25;
            let map_with_trees = Self::generate_trees(content);
            let map_with_river = Self::generate_river(map_with_trees, size);
            let map_with_clearing = Self::generate_clearing(map_with_river, size, max_attemps);
            map_with_clearing
        }

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
                if item.value != "F" {
                    item.value = String::from(*items.choose(&mut rand::thread_rng()).unwrap());
                }
                new_content.push(item);
            }
            new_content
        }

        fn generate_clearing(mut content: Vec<Item>, size: u32, max_attempts: u32) -> Vec<Item> {
            println!("Generating map clearing...");
            let mut rng = rand::thread_rng();
            let items = Self::get_items("clearing");

            for _ in 0..max_attempts {
                // let clearing: Vec<Item> = Vec::new();
                let mut clearing_spot = Vec::new();

                let clearing_width: u32 = rng.gen_range((size / 5) - 3..(size / 5) + 3);
                let clearing_height: u32 = rng.gen_range((size / 5) - 3..(size / 5) + 3);
                let start_x: u32 = rng.gen_range(2..(size / 3));
                let start_y: u32 = rng.gen_range(2..(size / 3));

                for item in &content {
                    if item.y >= rng.gen_range(start_y - 1..start_y + 1)
                        && item.y <= rng.gen_range(start_y - 1..start_y + 1) + clearing_height
                        && item.x >= rng.gen_range(start_x - 1..start_x + 1)
                        && item.x <= (rng.gen_range(start_x - 1..start_x + 1) + clearing_width)
                    {
                        clearing_spot.push(item.clone());
                    }
                }

                if clearing_spot
                    .iter()
                    .any(|x| x.value == 'F'.to_string() || x.value == 'W'.to_string())
                {
                    println!("Clearing location already occupied, trying again...");
                } else {
                    for clearing_item in &mut content {
                        if let Some(_clearing_spot_item) = clearing_spot
                            .iter()
                            .find(|item| item.id == clearing_item.id)
                        {
                            clearing_item.value =
                                String::from(*items.choose(&mut rand::thread_rng()).unwrap());
                        }
                    }

                    return content;
                }
            }
            println!("Failed to find clearing spot, skipping...");
            content
        }

        fn generate_river(content: Vec<Item>, size: u32) -> Vec<Item> {
            println!("Generating map river...");
            let mut rng = rand::thread_rng();
            let mut river = Vec::new();
            let river_width: u32 = rng.gen_range((size / 8) - 1..(size / 8) + 1);
            let start_x: u32 = rng.gen_range(5..(size - river_width - 5));

            for mut item in content {
                if item.value != "F" {
                    let range = rng.gen_range(start_x - 1..start_x + 1);

                    if item.x >= range && item.x <= range + river_width {
                        item.value = String::from('W')
                    } else if (item.x >= range && item.x <= range + river_width + 2)
                        || (item.x == range - 1 || item.x == range - 2)
                    {
                        item.value = String::from('-')
                    }
                }

                river.push(item);
            }
            return Self::generate_bridge(river, size);
        }

        fn generate_bridge(content: Vec<Item>, size: u32) -> Vec<Item> {
            println!("Generating map bridge...");
            let mut bridge: Vec<Item> = Vec::new();
            let mut rng = rand::thread_rng();
            let start_y: u32 = rng.gen_range(2..(size / 3));
            for mut item in content {
                if item.value == 'W'.to_string() {
                    if item.y == start_y || item.y == start_y + 1 {
                        item.value = String::from("BR")
                    }
                }
                bridge.push(item)
            }
            bridge
        }

        fn get_items(name: &str) -> Vec<&'static str> {
            match name {
                "map" => vec!["T", "-", "-", "-", "-", "-"],
                "clearing" => vec!["C", "C", "C", "C", "C", "C", "C", "C", "C", "R"],
                _ => vec![],
            }
        }

        fn generate_id() -> i32 {
            let mut rng = rand::thread_rng();
            rng.gen_range(1..=i32::MAX)
        }
    }
}
