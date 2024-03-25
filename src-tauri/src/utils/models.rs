use rand::*;
use serde::{Deserialize, Serialize};
use std::collections::HashSet;
use std::iter::FromIterator;

use crate::world::models::Item;

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
        let rationalizer = FrustumCullingUtility {
            value,
            size,
            vertical_threshold: vertical,
            horizontal_threshold: clamp(horizontal),
            vertical_bias: clamp(vertical),
        };
        rationalizer.resolve()
    }

    pub fn cull_filter(
        value: i32,
        size: u32,
        horizontal: usize,
        vertical: usize,
        content: Vec<Item>,
    ) -> Vec<Item> {
        let ids = Self::cull(value, size, horizontal, vertical);
        content
            .iter()
            .filter(|item| ids.contains(&(item.id as i32)))
            .cloned()
            .collect()
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
                ids.insert(id + i as i32);
                ids.insert((-id + i as i32).abs());
            }
        }

        array_from_set(ids)
    }

    fn resolve(&self) -> Vec<i32> {
        let horizontal_ids = self.horizontal_ids();
        let resolves_ids: HashSet<i32> = HashSet::from_iter(horizontal_ids);
        array_from_set(resolves_ids)
    }
}

fn array_from_set(values: HashSet<i32>) -> Vec<i32> {
    let mut array: Vec<i32> = Vec::from_iter(values);
    array.sort();
    array
}

fn clamp(value: usize) -> usize {
    (value as f32 / 1.5).ceil() as usize
}
