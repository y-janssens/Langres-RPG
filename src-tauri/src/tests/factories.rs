#[allow(dead_code)]
pub mod tests_factories {
    use crate::models::world::maps::World;
    use crate::models::world::maps::*;

    fn generate_id() -> i32 {
        use rand::Rng;
        let mut rng = rand::thread_rng();
        rng.gen_range(1..=i32::MAX)
    }

    pub fn world_factory(name: &str, size: u32) -> World {
        // let name = String::from(name.unwrap_or_else(|| "test"));
        // let size = size.unwrap_or_else(|| 50);
        World {
            id: generate_id(),
            name: name.to_string(),
            size,
            order: 0,
            complete: false,
            content: World::generate(size),
            starting_point: Location { x: 5, y: 5 },
            primary: true,
        }
    }
}
