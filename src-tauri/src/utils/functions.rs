use std::collections::HashSet;

pub fn array_from_set(values: HashSet<i32>) -> Vec<i32> {
    let mut array: Vec<i32> = Vec::from_iter(values);
    array.sort();
    array
}

pub fn clamp(value: usize) -> usize {
    (value as f32 / 1.5).ceil() as usize
}
