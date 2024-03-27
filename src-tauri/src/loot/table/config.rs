use lazy_static::lazy_static;
use rand::Rng;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub enum BaseItemType {
    Weapon,
    Equipment,
    Craftable,
    Thrash,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct TableConfig {
    pub gold: u32,
    pub weapon: Option<BaseItemType>,
    pub equipment: Option<BaseItemType>,
    pub craftable: Option<BaseItemType>,
    pub thrash: Option<BaseItemType>,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Conf {
    pub values: TableConfig,
}

lazy_static! {

    // Config definition
    static ref BASE_RANGES: Vec<i32> = vec![10, 3, 3, 3, 2];
    static ref TABLE_CONFIG: Conf = Conf::get_config();

}

impl Conf {
    /// Generate random values for loot table
    /// [gold, weapon, equipment, craftable, thrash]
    fn get_values() -> Vec<i32> {
        let values: Vec<i32> = BASE_RANGES
            .iter()
            .map(|&range| rand::thread_rng().gen_range(0..=range))
            .collect();

        values
    }

    pub fn get_config() -> Self {
        let values = Self::get_values();
        let gold = values[0] as u32;

        let mut weapon = None;
        let mut equipment = None;
        let mut craftable = None;
        let mut thrash = None;

        values
            .iter()
            .enumerate()
            .for_each(|(index, &value)| match index {
                1 => {
                    weapon = Self::get_item(value, index, BaseItemType::Weapon);
                }
                2 => {
                    equipment = Self::get_item(value, index, BaseItemType::Equipment);
                }
                3 => {
                    craftable = Self::get_item(value, index, BaseItemType::Craftable);
                }
                4 => {
                    thrash = Self::get_item(value, index, BaseItemType::Thrash);
                }
                _ => (),
            });

        Conf {
            values: TableConfig {
                gold,
                weapon,
                equipment,
                craftable,
                thrash,
            },
        }
    }

    fn get_item(value: i32, index: usize, item: BaseItemType) -> Option<BaseItemType> {
        let mut rng = rand::thread_rng();
        if rng.gen_bool(value as f64 / BASE_RANGES[index] as f64) {
            Some(item)
        } else {
            None
        }
    }

    pub fn get_level(&self) -> usize {
        let mut count = 0;

        if self.values.weapon.is_some() {
            count += 1;
        }
        if self.values.equipment.is_some() {
            count += 1;
        }
        if self.values.craftable.is_some() {
            count += 1;
        }
        if self.values.thrash.is_some() {
            count += 1;
        }
        count
    }
}
