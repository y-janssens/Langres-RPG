use noise::{NoiseFn, Perlin, Terrace};

pub enum Noise {
    Town,
    Shanty,
}

pub enum NoiseType {
    Perlin(Perlin),                   // Base noise type
    Terrace(Terrace<f64, Perlin, 3>), // Sharpest noise for towns or villages
}

impl Noise {
    /// Get noise generator
    pub fn get_type(self, seed: u32) -> NoiseType {
        match self {
            Self::Town => Self::get_perlin(seed),
            Self::Shanty => Self::get_terrace(seed),
        }
    }

    fn get_perlin(seed: u32) -> NoiseType {
        let perlin = Perlin::new(seed);
        NoiseType::Perlin(perlin)
    }

    fn get_terrace(seed: u32) -> NoiseType {
        let perlin = Perlin::new(seed);
        let terrace = Terrace::new(perlin)
            .add_control_point(-1.0)
            .add_control_point(0.0)
            .add_control_point(1.0);
        NoiseType::Terrace(terrace)
    }
}

impl NoiseType {
    /// Compute noise values
    pub fn get(&self, point: [f64; 3]) -> f64 {
        match self {
            NoiseType::Perlin(perlin) => perlin.get(point),
            NoiseType::Terrace(terrace) => terrace.get(point),
        }
    }
}
