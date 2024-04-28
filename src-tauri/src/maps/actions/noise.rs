use noise::{NoiseFn, Perlin, Terrace};

pub enum NoiseType {
    Town,
    Shanty,
}

pub enum Noise {
    Perlin(Perlin),                   // Base noise type
    Terrace(Terrace<f64, Perlin, 3>), // Sharpest noise for towns or villages
}

impl NoiseType {
    /// Get noise generator
    pub fn get_type(self, seed: u32) -> Noise {
        match self {
            Self::Town => Self::get_perlin(seed),
            Self::Shanty => Self::get_terrace(seed),
        }
    }

    fn get_perlin(seed: u32) -> Noise {
        let perlin = Perlin::new(seed);
        Noise::Perlin(perlin)
    }

    fn get_terrace(seed: u32) -> Noise {
        let perlin = Perlin::new(seed);
        let terrace = Terrace::new(perlin)
            .add_control_point(-1.0)
            .add_control_point(0.0)
            .add_control_point(1.0);
        Noise::Terrace(terrace)
    }
}

impl Noise {
    /// Compute noise values
    pub fn get(&self, point: [f64; 3]) -> f64 {
        match self {
            Self::Perlin(perlin) => perlin.get(point),
            Self::Terrace(terrace) => terrace.get(point),
        }
    }
}
