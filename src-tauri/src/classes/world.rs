#[allow(dead_code)]

pub mod world {
    use rand::{seq::SliceRandom, Rng};
    use round::round;
    use serde::{Deserialize, Serialize};
    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct World {
        width: u32,
        height: u32,
        content: Vec<Item>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    struct Item {
        id: u32,
        x: u32,
        y: u32,
        value: String,
    }

    impl World {
        pub fn new(size: u32) -> World {
            World {
                width: size,
                height: size,
                content: Self::generate(size),
            }
        }

        pub fn regenerate(&mut self) -> () {
            return self.content = Self::generate(self.width);
        }

        fn generate(size: u32) -> Vec<Item> {
            let grid: u32 = size * size;

            let mut content = Vec::new();
            for i in 0..grid {
                let x = (i % size) as u32;
                let y = round((i / size) as f64, 1) as u32;
                let item = Item {
                    id: i,
                    x,
                    y,
                    value: Self::get_borders(x, y, size),
                };
                content.push(item);
            }
            let generate_content = Self::get_content(content, size);
            generate_content
        }

        fn get_borders(x: u32, y: u32, size: u32) -> String {
            let items = Self::get_items("map");
            if x == 0 || x == size - 1 || y == 0 || y == size - 1 {
                return String::from("F");
            }
            return String::from(*items.choose(&mut rand::thread_rng()).unwrap());
        }

        fn get_content(content: Vec<Item>, size: u32) -> Vec<Item> {
            let mut rng = rand::thread_rng();
            let mut new_content = Vec::new();
            let items = Self::get_items("clearing");

            let clearing_width: u32 = rng.gen_range((size / 5) - 3..(size / 5) + 3);
            let clearing_height: u32 = rng.gen_range((size / 5) - 3..(size / 5) + 3);
            let start_x: u32 = rng.gen_range(2..(size / 3));
            let start_y: u32 = rng.gen_range(2..(size / 3));

            for mut item in content {
                if item.y >= rng.gen_range(start_y - 1..start_y + 1)
                    && item.y <= rng.gen_range(start_y - 1..start_y + 1) + clearing_height
                    && item.x >= rng.gen_range(start_x - 1..start_x + 1)
                    && item.x <= (rng.gen_range(start_x - 1..start_x + 1) + clearing_width)
                {
                    item.value = String::from(*items.choose(&mut rand::thread_rng()).unwrap());
                }
                new_content.push(item);
            }
            return new_content;
        }

        fn get_items(name: &str) -> Vec<&'static str> {
            match name {
                "map" => vec!["T", "-", "-", "-", "-"],
                "clearing" => vec!["C", "C", "C", "C", "C", "C", "C", "C", "C", "R"],
                _ => vec![],
            }
        }
    }
}
