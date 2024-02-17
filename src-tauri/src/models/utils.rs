pub mod utils {
    use rand::*;
    use serde::{Deserialize, Serialize};

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
}
