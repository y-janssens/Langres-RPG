use std::collections::{HashMap, HashSet};

use rand::{distributions::WeightedIndex, prelude::Distribution, thread_rng};

pub fn array_from_set(values: HashSet<i32>) -> Vec<i32> {
    let mut array: Vec<i32> = Vec::from_iter(values);
    array.sort();
    array
}

pub fn clamp(value: usize) -> usize {
    (value as f32 / 1.5).ceil() as usize
}

pub fn to_weighted_map(values: Vec<(&str, i32)>) -> HashMap<String, u32> {
    let mut map = HashMap::new();
    for (key, value) in values {
        map.insert(key.to_string(), value as u32);
    }
    map
}

/// Extract keys and values from a weighted Hashmap ex: [("T", 1), ("-", 7)]
/// And returns a random value based on weight distribution
pub fn get_weighted_random_value(values: &HashMap<String, u32>) -> String {
    let mut rng = thread_rng();
    let items: Vec<String> = values.keys().cloned().collect();
    let weights: Vec<u32> = values.values().cloned().collect();
    let dist = WeightedIndex::new(&weights).unwrap();
    items[dist.sample(&mut rng)].to_string()
}
