use crate::classes::codes::codes::Codes;

pub fn load_codes() -> Result<Codes, Box<dyn std::error::Error>> {
    let load = Codes::load()?;
    Ok(load)
}
