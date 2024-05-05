use lazy_static::lazy_static;
use serde::Serialize;

use super::{
    actions::generator::{AVAILABLE_ACTIONS, AVAILABLE_PARAMS},
    config::AVAILABLE_CONFIGS,
};

lazy_static! {
    pub static ref DEFAULT_BATCH_SIZES: Vec<u8> = vec![5, 15, 25, 50];
}

#[derive(Debug, Serialize)]
pub struct GeneratorOptions<'a> {
    pub types: Vec<&'a String>,
    pub actions: Vec<Option<&'a String>>,
    pub post_actions: Vec<Option<&'a String>>,
    pub default_sizes: Vec<u8>,
}

impl GeneratorOptions<'_> {
    pub fn load() -> Self {
        Self {
            types: AVAILABLE_CONFIGS.to_vec(),
            actions: Self::get_actions(AVAILABLE_PARAMS.clone()),
            post_actions: Self::get_actions(AVAILABLE_ACTIONS.clone()),
            default_sizes: DEFAULT_BATCH_SIZES.clone(),
        }
    }

    fn get_actions<'a>(params: Vec<&'static String>) -> Vec<Option<&'a String>> {
        let default: Vec<Option<&'a String>> = vec![None];
        [default, params.into_iter().map(Some).collect()].concat()
    }
}
