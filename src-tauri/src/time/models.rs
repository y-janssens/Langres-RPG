pub mod env {
    use chrono::{Datelike, Local, NaiveDate, ParseError, Timelike};
    use rand::{seq::SliceRandom, thread_rng, Rng};
    use serde::{Deserialize, Serialize};

    use crate::backend::settings::errors::BASE_ERROR;

    #[derive(Clone, Copy, Debug, Serialize, Deserialize)]
    enum WeatherState {
        Sunny,
        Cloudy,
        Rainy,
        Snowy,
        Stormy,
        SunnyWindy,
        CloudyWindy,
        RainyWindy,
        SnowyWindy,
    }

    #[derive(Clone, Debug, Serialize, Deserialize)]
    pub struct Environment {
        pub date: String,
        pub daytime: bool,
        pub season: String,
        pub weather: String,
        pub danger: u32,
        pub wind_force: u32,
        pub temperature: i32,
    }

    impl Environment {
        pub fn initialize(date: &str) -> Result<Environment, ParseError> {
            let hour = Local::now().hour();
            let _date = NaiveDate::parse_from_str(date, "%d/%m/%Y")?;
            let daytime = (5..=18).contains(&hour);
            let temperature = Self::get_temperature(_date.month(), &daytime);
            let weather_state = Self::get_weather(_date.month(), temperature);
            let (danger, wind_force) = Self::get_environmental_factors(&weather_state);

            Ok(Environment {
                date: _date.format("%d/%m/%Y").to_string(),
                daytime,
                season: Self::get_season(_date.month()),
                weather: Self::get_weather_text(&weather_state),
                danger: if daytime { danger } else { 100 },
                wind_force,
                temperature,
            })
        }

        fn get_weather(month: u32, temperature: i32) -> WeatherState {
            if temperature >= 30 {
                return WeatherState::Sunny;
            }

            let mut possible_weathers = match month {
                1..=3 => vec![
                    WeatherState::Sunny,
                    WeatherState::SunnyWindy,
                    WeatherState::Cloudy,
                    WeatherState::CloudyWindy,
                    WeatherState::Stormy,
                ],
                4..=9 => vec![
                    WeatherState::Sunny,
                    WeatherState::SunnyWindy,
                    WeatherState::Rainy,
                    WeatherState::RainyWindy,
                    WeatherState::Cloudy,
                    WeatherState::CloudyWindy,
                    WeatherState::Stormy,
                ],
                10..=12 => vec![
                    WeatherState::Sunny,
                    WeatherState::SunnyWindy,
                    WeatherState::Cloudy,
                    WeatherState::CloudyWindy,
                    WeatherState::Rainy,
                    WeatherState::RainyWindy,
                    WeatherState::Stormy,
                ],
                _ => vec![WeatherState::Sunny],
            };

            if temperature <= 2 {
                possible_weathers.push(WeatherState::Snowy);
                possible_weathers.push(WeatherState::SnowyWindy);
            }

            let mut rng = thread_rng();
            *possible_weathers.choose(&mut rng).unwrap_or(&WeatherState::Sunny)
        }

        fn get_environmental_factors(weather: &WeatherState) -> (u32, u32) {
            match weather {
                WeatherState::Sunny | WeatherState::SunnyWindy => (25, 10),
                WeatherState::Cloudy | WeatherState::CloudyWindy => (100, 25),
                WeatherState::Rainy | WeatherState::RainyWindy => (75, 15),
                WeatherState::Snowy | WeatherState::SnowyWindy => (100, 15),
                WeatherState::Stormy => (25, 75),
            }
        }

        fn get_weather_text(weather: &WeatherState) -> String {
            match weather {
                WeatherState::Sunny => String::from("Sunny"),
                WeatherState::Cloudy => String::from("Cloudy"),
                WeatherState::Rainy => String::from("Rainy"),
                WeatherState::Snowy => String::from("Snowy"),
                WeatherState::Stormy => String::from("Stormy"),
                WeatherState::SunnyWindy => String::from("Sunny and Windy"),
                WeatherState::CloudyWindy => String::from("Cloudy and Windy"),
                WeatherState::RainyWindy => String::from("Rainy and Windy"),
                WeatherState::SnowyWindy => String::from("Snowy and Windy"),
            }
        }

        fn get_season(month: u32) -> String {
            match month {
                3..=5 => String::from("spring"),
                6..=8 => String::from("summer"),
                9..=11 => String::from("autumn"),
                12 | 1 | 2 => String::from("winter"),
                _ => String::from(BASE_ERROR),
            }
        }

        fn get_temperature(month: u32, daytime: &bool) -> i32 {
            let mut rng = rand::thread_rng();

            let (min, max) = match month {
                1 => (-5, 5),
                2 => (-3, 7),
                3 => (0, 10),
                4 => (4, 15),
                5 => (8, 18),
                6 => (12, 22),
                7 => (14, 25),
                8 => (14, 24),
                9 => (10, 20),
                10 => (6, 15),
                11 => (2, 10),
                12 => (-3, 5),
                _ => (0, 10),
            };
            let range = rng.gen_range(0..=5);
            let adjusted_min = min - range;
            let adjusted_max = if *daytime { max + range } else { max + range - 10 };

            rng.gen_range(adjusted_min..=adjusted_max)
        }
    }
}
