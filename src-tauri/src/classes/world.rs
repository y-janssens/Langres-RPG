#[allow(dead_code)]

pub mod world {
    use rand::seq::SliceRandom;
    use serde::{Deserialize, Serialize};
    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct World {
        width: u32,
        height: u32,
        content: Vec<String>,
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

        fn generate(size: u32) -> Vec<std::string::String> {
            let grid: u64 = size as u64 * size as u64;
            let items = ["T", "-", "-", "-", "-"];
            let mut content = Vec::new();
            for _i in 0..grid {
                let item = String::from(*items.choose(&mut rand::thread_rng()).unwrap());
                content.push(item);
            }
            content
        }
    }
}
