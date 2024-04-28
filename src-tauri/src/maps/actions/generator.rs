use super::noise::{Noise, NoiseType};
use crate::{
    maps::{models::Tile, tiles::get_neighbours_values},
    world::models::Options,
};
use lazy_static::lazy_static;
use rand::Rng;

lazy_static! {
    // Actions parameters : scale - factor - output
    pub static ref TOWN_PARAMS: Params = Params::get("town", 0.025, 1.8, "F", "T", true);
    pub static ref SHANTY_PARAMS: Params = Params::get("shanty", 0.1, 1.8, "F", "-", true);
    pub static ref DIRT_PARAMS: Params = Params::get("dirt", 0.1, 1.25, "G", "-", false);

    pub static ref AVAILABLE_PARAMS: Vec<&'static String> = vec![&TOWN_PARAMS.name, &SHANTY_PARAMS.name];
    pub static ref AVAILABLE_ACTIONS: Vec<&'static String> = vec![&DIRT_PARAMS.name];
}

#[derive(Clone)]
pub struct Params {
    pub name: String,      // Parameter's name
    pub scale: f64,        // Noise spreading
    pub factor: f64,       // Intensity
    pub filter: String,    // Escape value
    pub output: String,    // Tile's value
    pub pre_process: bool, // Post-processing computation
}

impl Params {
    pub fn get(
        name: &str,
        scale: f64,
        factor: f64,
        output: &str,
        filter: &str,
        pre_process: bool,
    ) -> Self {
        Self {
            name: name.to_string(),
            scale,
            factor,
            filter: filter.to_string(),
            output: output.to_string(),
            pre_process,
        }
    }
}

pub struct Generator {
    content: Vec<Tile>,   // Map content
    pub seed: u32,        // Random value (2800101214)
    params: Params,       // Generator's parameters
    pub options: Options, // Actions options
    noise: Noise,         // Noise generator
}

impl Generator {
    /// Perform generator's actions based on options, or returns content unchanged
    pub fn perform_actions(options: &Options, mut content: Vec<Tile>) -> Vec<Tile> {
        if let Some(ref action) = options.action {
            content = match action.as_str() {
                "town" => Self::get_action(content, options, TOWN_PARAMS.clone(), NoiseType::Town),
                "shanty" => {
                    Self::get_action(content, options, SHANTY_PARAMS.clone(), NoiseType::Shanty)
                }
                _ => content,
            };
        }
        content
    }

    /// Perform generator's post processing actions based on options, or return content unchanged
    pub fn perform_post_actions(options: &Options, mut content: Vec<Tile>) -> Vec<Tile> {
        if let Some(ref post_action) = options.post_action {
            content = match post_action.as_str() {
                "dirt" => Self::get_action(content, options, DIRT_PARAMS.clone(), NoiseType::Dirt),
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
        noise: NoiseType,
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
        generator.content
    }

    /// Generate noise map and return parsed content
    fn generate(&mut self) {
        let params = self.params.clone();

        for item in self
            .content
            .iter_mut()
            .filter(|i| Self::get_filter(&params, &i.value))
        {
            let noise_value = self.noise.get([
                item.x as f64 * self.params.scale,
                item.y as f64 * self.params.scale,
                0.0,
            ]);
            let value = ((noise_value + 1.0) * self.params.factor) as i32;
            Self::pre_process_values(self.params.clone(), item, value);
        }
    }

    fn get_filter(params: &Params, value: &String) -> bool {
        params.pre_process != (*value == params.filter)
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
        if self.params.pre_process {
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
}
