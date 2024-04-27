use super::{
    noise::{Noise, NoiseType},
    params::{Options, Params},
};
use crate::maps::{models::Tile, tiles::get_neighbours_values};
use lazy_static::lazy_static;
use rand::Rng;

lazy_static! {
    // Actions parameters : scale - factor - output
    static ref TOWN_PARAMS: Params = Params::get(0.025, 1.8, "F");
    static ref SHANTY_PARAMS: Params = Params::get(0.1, 1.8, "F");
}

pub struct Generator {
    content: Vec<Tile>,   // Map content
    pub seed: u32,        // Random value (2800101214)
    params: Params,       // Generator's parameters
    pub options: Options, // Actions options
    noise: NoiseType,     // Noise generator
}

impl Generator {
    /// Perform generator's actions based on options, or returns content unchanged
    pub fn perform_actions(options: &Options, mut content: Vec<Tile>) -> Vec<Tile> {
        if let Some(ref action) = options.action {
            content = match action.as_str() {
                "town" => Self::get_action(content, options, TOWN_PARAMS.clone(), Noise::Town),
                "shanty" => {
                    Self::get_action(content, options, SHANTY_PARAMS.clone(), Noise::Shanty)
                }
                _ => content,
            };
        }
        content
    }

    /// Get noise generator parameters and generate actions's content
    fn get_action(
        content: Vec<Tile>,
        options: &Options,
        params: Params,
        noise: Noise,
    ) -> Vec<Tile> {
        let mut rng = rand::thread_rng();
        let seed = rng.gen();
        let mut generator = Self {
            seed,
            content,
            params,
            options: options.clone(),
            noise: noise.get_type(seed),
        };

        generator.generate();
        generator.clean_output();
        generator.content.clone()
    }

    /// Generate noise map and return parsed content
    fn generate(&mut self) -> Vec<Tile> {
        let items = &mut self.content;

        for item in items.iter_mut().filter(|i| &i.value != "T") {
            let noise_value = self.noise.get([
                item.x as f64 * self.params.scale,
                item.y as f64 * self.params.scale,
                0.0,
            ]);
            let value = ((noise_value + 1.0) * self.params.factor) as i32;
            Self::pre_process_values(self.params.clone(), item, value);
        }

        items.to_vec()
    }

    /// Ensure preprocessed values will be ignored by WFC and left as is
    fn pre_process_values(params: Params, item: &mut Tile, value: i32) -> &mut Tile {
        item.z = value;
        if item.z == 0 {
            item.value = params.output;
            item.entropy = 0
        }
        item
    }

    /// Clean noise generator's content to keep only borders
    fn clean_output(&mut self) {
        let neighbours: Vec<Vec<String>> = self
            .content
            .iter()
            .enumerate()
            .map(|(index, _)| get_neighbours_values(&self.content, index).0)
            .collect();

        for (index, item) in self
            .content
            .iter_mut()
            .enumerate()
            .filter(|(_, tile)| tile.value == self.params.output)
        {
            if neighbours[index]
                .iter()
                .all(|value| value == &self.params.output)
            {
                item.value = "-".to_string();
            }
        }
    }
}
