use serde::{Deserialize, Serialize};

#[derive(Clone)]
pub struct Params {
    pub scale: f64,     // Noise spreading
    pub factor: f64,    // Intensity
    pub output: String, // Tile's value
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Options {
    pub r#type: String,         // Map type
    pub action: Option<String>, // Action's name
}

impl Params {
    pub fn get(scale: f64, factor: f64, output: &str) -> Self {
        Self {
            scale,
            factor,
            output: output.to_string(),
        }
    }
}
