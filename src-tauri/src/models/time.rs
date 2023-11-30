#[allow(dead_code)]

pub mod time {
    use chrono::{Datelike, Local, NaiveDate, Timelike};
    use rand::{seq::SliceRandom, thread_rng};
    use serde::{Deserialize, Serialize};

    #[derive(Clone, Copy, Debug, Serialize, Deserialize)]
    enum WeatherState {
        Sunny,
        Cloudy,
        Rainy,
        Snowy,
        SunnyWindy,
        CloudyWindy,
        RainyWindy,
        SnowyWindy,
    }

    #[derive(Clone, Copy, Debug, Serialize, Deserialize)]
    struct Weather {
        state: WeatherState,
    }

    #[derive(Clone, Debug, Serialize, Deserialize)]
    pub struct Environment {
        date: String,
        daytime: bool,
        weather: Weather,
        danger: u32,
    }

    impl Environment {
        pub fn initialize(date: &str) -> Environment {
            let hour = Local::now().hour();
            let _date = NaiveDate::parse_from_str(date, "%d/%m/%Y").expect("Wrong date format");
            let _month = _date.month();
            let weather = Self::get_weather(_month);

            Environment {
                date: _date.format("%d/%m/%Y").to_string(),
                daytime: hour >= 5 && hour <= 18,
                weather,
                danger: Self::get_activity(&weather.state),
            }
        }

        fn get_weather(date: u32) -> Weather {
            let possible_weathers = match date {
                1 | 2 | 3 => vec![
                    WeatherState::Sunny,
                    WeatherState::SunnyWindy,
                    WeatherState::Cloudy,
                    WeatherState::CloudyWindy,
                    WeatherState::Snowy,
                    WeatherState::SnowyWindy,
                ],
                4 | 5 | 6 => vec![
                    WeatherState::Sunny,
                    WeatherState::SunnyWindy,
                    WeatherState::Rainy,
                    WeatherState::RainyWindy,
                    WeatherState::Cloudy,
                    WeatherState::CloudyWindy,
                ],
                7 | 8 | 9 => vec![
                    WeatherState::Sunny,
                    WeatherState::SunnyWindy,
                    WeatherState::Cloudy,
                    WeatherState::CloudyWindy,
                    WeatherState::Rainy,
                    WeatherState::RainyWindy,
                ],
                10 | 11 | 12 => vec![
                    WeatherState::Sunny,
                    WeatherState::SunnyWindy,
                    WeatherState::Cloudy,
                    WeatherState::CloudyWindy,
                    WeatherState::Snowy,
                    WeatherState::SnowyWindy,
                ],
                _ => vec![WeatherState::Sunny],
            };
            let mut rng = thread_rng();
            Weather {
                state: *possible_weathers
                    .choose(&mut rng)
                    .unwrap_or(&WeatherState::Cloudy),
            }
        }

        fn get_activity(weather: &WeatherState) -> u32 {
            match weather {
                WeatherState::Sunny | WeatherState::SunnyWindy => 25,
                WeatherState::Cloudy | WeatherState::CloudyWindy => 100,
                WeatherState::Rainy | WeatherState::RainyWindy => 75,
                WeatherState::Snowy | WeatherState::SnowyWindy => 100,
            }
        }
    }
}
