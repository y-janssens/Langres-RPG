pub fn generate_id() -> i32 {
    use rand::Rng;
    let mut rng = rand::thread_rng();
    rng.gen_range(1..=i32::MAX)
}
