#[allow(dead_code)]
use crate::classes::objects::objects::Objects;

pub fn load_objects() -> Result<Objects, Box<dyn std::error::Error>> {
    let _start = Objects::load_objects()?;
    Ok(_start)
}
