use rand::*;
use serde::{Deserialize, Serialize};
use std::collections::HashSet;

use super::functions::{array_from_set, clamp};
use crate::world::{models::Item, settings::DEFAULT_MAP_SIZE};

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Dice {
    pub value: u32,
    pub status: String,
}

impl Dice {
    pub fn launch(dice_value: u32, dice_cap: u32) -> Dice {
        let mut rng = rand::thread_rng();
        let result = rng.gen_range(1..dice_cap);
        let status = match result {
            1 => "critical_failure",
            20 => "critical_success",
            _ if result < dice_value => "failure",
            _ => "success",
        };

        Dice {
            value: result,
            status: String::from(status),
        }
    }

    pub fn roll(dice_cap: u32) -> u32 {
        let mut rng = rand::thread_rng();
        rng.gen_range(1..dice_cap)
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
            horizontal_threshold: horizontal,
            vertical_bias: clamp(vertical),
        };
        rationalizer.resolve()
    }

    pub fn cull_filter(value: i32, size: u32, horizontal: usize, vertical: usize, content: Vec<Item>) -> Vec<Item> {
        let ids = Self::cull(value, size, horizontal, vertical);
        content
            .iter()
            .filter(|item| ids.contains(&(item.id as i32)) && item.walkable)
            .cloned()
            .collect()
    }

    fn get_hex_neighbors(&self, tile_id: i32) -> Vec<i32> {
        let size = *DEFAULT_MAP_SIZE as i32;
        let row = tile_id / size;

        let offsets = if row % 2 == 0 {
            vec![-1, 1, -size, -size + 1, size, size + 1]
        } else {
            vec![-1, 1, -size - 1, -size, size - 1, size]
        };

        offsets.iter().map(|&offset| tile_id + offset).collect()
    }

    fn resolve(&self) -> Vec<i32> {
        if self.horizontal_threshold == 0 && self.vertical_threshold == 0 {
            return Vec::new();
        }

        let mut current_ring: HashSet<i32> = self.get_hex_neighbors(self.value).into_iter().collect();
        let mut result = current_ring.clone();

        for _ in 1..self.vertical_threshold {
            let mut next_ring = HashSet::new();
            for &tile_id in &current_ring {
                for neighbor in self.get_hex_neighbors(tile_id) {
                    if neighbor != self.value && !result.contains(&neighbor) {
                        next_ring.insert(neighbor);
                    }
                }
            }
            result.extend(&next_ring);
            current_ring = next_ring;
        }

        if self.horizontal_threshold > self.vertical_threshold {
            let horizontal_expansion = self.horizontal_threshold - self.vertical_threshold;
            let current_tiles: Vec<i32> = result.iter().cloned().collect();

            for &tile_id in &current_tiles {
                for i in 1..=horizontal_expansion {
                    result.insert(tile_id + i as i32);
                    result.insert(tile_id - i as i32);
                }
            }
        }

        array_from_set(result)
    }
}
