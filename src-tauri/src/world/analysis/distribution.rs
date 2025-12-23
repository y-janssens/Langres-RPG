use serde::{Deserialize, Serialize};
use std::collections::HashMap;

use crate::world::builder::{
    config::Values,
    settings::{DEFAULT_MAP_SIZE_GRID, GRASS},
};
use crate::world::models::Item;

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Distribution {
    values: HashMap<String, u32>,
    most_common: String,
    free_space: String,
    summary: HashMap<String, String>,
}

impl Default for Distribution {
    fn default() -> Self {
        Self::new()
    }
}

impl Distribution {
    pub fn new() -> Self {
        Self {
            values: HashMap::new(),
            most_common: String::from(""),
            free_space: String::from("0%"),
            summary: HashMap::new(),
        }
    }

    pub fn analyze(&mut self, items: &[Item]) -> Self {
        self.get_values(items);
        self.get_most_common();
        self.get_free_space();
        self.compute_summary();

        self.clone()
    }

    fn get_percentiles(&mut self) -> HashMap<String, f64> {
        let mut percentile_dist = HashMap::new();
        for (value, count) in self.values.clone().into_iter() {
            percentile_dist.insert(value.clone(), (count as f64 / *DEFAULT_MAP_SIZE_GRID as f64) * 100.0);
        }

        percentile_dist
    }

    fn get_most_common(&mut self) {
        let most_common_item = self.values.iter().max_by(|a, b| a.1.cmp(b.1)).unwrap().0;
        self.most_common = Values::get_value(most_common_item).0;
    }

    fn get_free_space(&mut self) {
        let values = self.get_percentiles();
        self.free_space = format!("{:.2}%", *values.get(&GRASS.value).unwrap());
    }

    fn get_values(&mut self, items: &[Item]) {
        for item in items.iter() {
            *self.values.entry(item.value.clone()).or_insert(0) += 1;
        }
    }

    fn compute_summary(&mut self) {
        for (value, count) in self.get_percentiles().into_iter() {
            let display_value = Values::get_value(&value).0;
            self.summary.insert(display_value, format!("{:.2}%", count));
        }
    }
}
