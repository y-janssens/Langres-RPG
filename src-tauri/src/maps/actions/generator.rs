use rand::Rng;

use super::super::settings::{DIRT_PARAMS, GROUND_PARAMS, SHANTY_PARAMS, TOWN_PARAMS};
use super::noise::{Noise, NoiseType};
use crate::world::models::{Item, Options};

#[derive(Clone)]
pub struct Params {
    pub name: String,        // Parameter's name
    pub scale: f64,          // Noise spreading
    pub factor: f64,         // Intensity
    pub filter: String,      // Escape value
    pub output: Vec<String>, // Item's value
    pub pre_process: bool,   // Post-processing computation
}

impl Params {
    pub fn get(
        name: &str,
        scale: f64,
        factor: f64,
        mut output: Vec<&str>,
        filter: &str,
        pre_process: bool,
    ) -> Self {
        Self {
            name: name.to_string(),
            scale,
            factor,
            filter: filter.to_string(),
            output: output.iter_mut().map(|a| a.to_string()).collect(),
            pre_process,
        }
    }
}

#[allow(dead_code)]
pub struct Generator {
    content: Vec<Item>, // Map content
    seed: u32,          // Random value
    params: Params,     // Generator's parameters
    options: Options,   // Actions options
    noise: Noise,       // Noise generator
}

impl Generator {
    /// Perform generator's actions based on options, or returns content unchanged
    pub fn perform_actions(options: &Options, mut content: Vec<Item>) -> Vec<Item> {
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
    pub fn perform_post_actions(options: &Options, mut content: Vec<Item>) -> Vec<Item> {
        if let Some(ref post_action) = options.post_action {
            content = match post_action.as_str() {
                "dirt" => Self::get_action(content, options, DIRT_PARAMS.clone(), NoiseType::Dirt),
                "ground" => {
                    Self::get_action(content, options, GROUND_PARAMS.clone(), NoiseType::Dirt)
                }
                _ => content,
            };
        }
        content
    }

    /// Get noise generator parameters and generate actions's content
    fn get_action(
        content: Vec<Item>,
        options: &Options,
        params: Params,
        noise: NoiseType,
    ) -> Vec<Item> {
        let mut generator = Self::init(content, options, params, noise);

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

    fn init(content: Vec<Item>, options: &Options, params: Params, noise: NoiseType) -> Self {
        let mut rng = rand::thread_rng();
        let seed = rng.gen();
        Self {
            seed,
            content,
            params,
            options: options.clone(),
            noise: noise.get_type(seed),
        }
    }

    fn get_filter(params: &Params, value: &String) -> bool {
        params.pre_process != (*value == params.filter)
    }

    /// Ensure preprocessed values will be ignored by WFC and left as is
    fn pre_process_values(params: Params, item: &mut Item, value: i32) -> &mut Item {
        item.z = value;
        if params.pre_process {
            if item.z == 0 {
                item.value = params.output[0].clone();
                item.entropy = 0
            }
        } else {
            item.value = params.output[(item.z as usize).min(params.output.len() - 1)].clone();
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
                .map(|it| it.clone().get_neighbours_values(&self.content).0)
                .collect();

            for (index, item) in self
                .content
                .iter_mut()
                .enumerate()
                .filter(|(_, tile)| tile.value == self.params.output[0])
            {
                if neighbours[index]
                    .iter()
                    .all(|value| value == &self.params.output[0])
                {
                    item.value = "-".to_string();
                }
            }
        }
    }
}
