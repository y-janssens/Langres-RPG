pub mod Dices {
    use rand::{seq::SliceRandom, Rng};

    pub struct Dice {
        value: u32,
        status: String,
    }

    impl Dice {
        pub fn launch(dice_value: u32, dice_cap: u32) -> Dice {
            let mut rng = rand::thread_rng();
            let result = rng.gen_range(1..dice_value);
            let status = match result {
                1 => "Critical success",
                20 => "Critical failure",
                _ if result <= dice_cap => "Success",
                _ => "Failure",
            };

            Dice {
                value: result,
                status: String::from(status),
            }
        }
    }
}
