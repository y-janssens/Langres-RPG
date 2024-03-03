#[allow(dead_code)]
pub mod tests_factories {
    use crate::models::collection::collections::InsertableCollection;
    use crate::models::story::storyline::{Act, Acts, Content, Story};
    use crate::models::world::maps::World;
    use crate::models::world::maps::*;

    fn generate_id() -> i32 {
        use rand::Rng;
        let mut rng = rand::thread_rng();
        rng.gen_range(1..=i32::MAX)
    }

    pub fn world_factory(name: &str, size: u32) -> World {
        World {
            id: generate_id(),
            name: name.to_string(),
            size,
            order: 0,
            complete: false,
            content: World::generate(size),
            starting_point: Location {
                x: 9,
                y: 4,
                id: 254,
            },
            primary: true,
        }
    }

    pub fn storyline_factory(
        act_name: &str,
        act_title: &str,
        act_date: &str,
        map_name: &str,
    ) -> Story {
        Story {
            id: generate_id(),
            story: Acts {
                acts: vec![Act {
                    id: generate_id(),
                    order: 0,
                    name: act_name.to_string(),
                    title: act_title.to_string(),
                    date: act_date.to_string(),
                    content: Content {
                        maps: vec![
                            Some(world_factory(map_name, 50)),
                            Some(world_factory(map_name, 50)),
                        ],
                    },
                    complete: false,
                }],
            },
        }
    }

    pub fn collection_factory(name: &str) -> InsertableCollection {
        InsertableCollection {
            map: world_factory(name, 50),
        }
    }
}
