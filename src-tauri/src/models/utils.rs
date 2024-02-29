pub mod game_utils {
    use rand::*;
    use serde::{Deserialize, Serialize};
    use std::collections::HashSet;
    use std::iter::FromIterator;

    #[derive(Clone, Debug, Serialize, Deserialize)]
    pub struct Dice {
        value: u32,
        status: String,
    }

    impl Dice {
        pub fn launch(dice_value: u32, dice_cap: u32) -> Dice {
            let mut rng = rand::thread_rng();
            let result = rng.gen_range(1..dice_value);
            let status = match result {
                1 => "critical_failure",
                20 => "critical_success",
                _ if result < dice_cap => "failure",
                _ => "success",
            };

            Dice {
                value: result,
                status: String::from(status),
            }
        }
    }

    #[derive(Clone, Debug, Serialize, Deserialize)]
    pub struct FrustumCullingUtility {
        value: i32,
        size: u32,
        horizontal_threshold: usize,
        vertical_threshold: usize,
        vertical_bias: usize,
    }

    impl FrustumCullingUtility {
        pub fn cull(value: i32, size: u32, horizontal: usize, vertical: usize) -> Vec<i32> {
            let vertical_bias = (vertical as f32 / 1.5).ceil() as usize;
            let rationalizer = FrustumCullingUtility {
                value,
                size,
                horizontal_threshold: horizontal,
                vertical_threshold: vertical,
                vertical_bias,
            };
            rationalizer.resolve()
        }

        fn vertical_ids(&self) -> Vec<i32> {
            let mut ids = HashSet::new();
            ids.insert(self.value);

            for i in 0..=self.vertical_threshold {
                ids.insert((self.value - (i as i32) * 50).abs());
            }

            for i in 0..=self.vertical_threshold - self.vertical_bias + 1 {
                ids.insert(self.value + (i as i32) * 50);
            }

            array_from_set(ids)
        }

        fn horizontal_ids(&self) -> Vec<i32> {
            let mut ids = HashSet::new();

            for id in self.vertical_ids() {
                for i in 0..=self.horizontal_threshold {
                    let i = i as i32;
                    ids.insert(id + i);
                    ids.insert((-id + i).abs());
                }
            }

            array_from_set(ids)
        }

        fn resolve(&self) -> Vec<i32> {
            let horizontal_ids = self.horizontal_ids();
            let resolves_ids: HashSet<i32> = HashSet::from_iter(horizontal_ids.into_iter());
            array_from_set(resolves_ids)
        }
    }

    fn array_from_set(values: HashSet<i32>) -> Vec<i32> {
        let mut array: Vec<i32> = Vec::from_iter(values);
        array.sort();
        array
    }
}
