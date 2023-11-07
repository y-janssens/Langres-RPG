#[allow(dead_code)]

pub mod objects {
    use serde::{Deserialize, Serialize};
    #[derive(Debug, Serialize, Deserialize, Clone)]
    struct Object {
        id: u32,
        name: String,
        value: String,
        area: Option<Area>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Objects {
        objects: Vec<Option<Object>>,
    }

    #[derive(Debug, Serialize, Deserialize, Clone)]
    struct Area {
        x: u32,
        y: u32,
    }

    impl Objects {}
}
