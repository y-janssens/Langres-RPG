use serde::Serialize;

use super::settings::{AVAILABLE_ACTIONS, AVAILABLE_PARAMS};

#[derive(Debug, Serialize)]
pub struct GeneratorOptions<'a> {
    pub types: Vec<String>,
    pub actions: Vec<Option<&'a String>>,
    pub post_actions: Vec<Option<&'a String>>,
    pub default_sizes: Vec<u8>,
}

impl GeneratorOptions<'_> {
    pub fn load() -> Self {
        Self {
            types: vec!["forest".to_string(), "swamp".to_string()],
            actions: Self::get_actions(AVAILABLE_PARAMS.clone()),
            post_actions: Self::get_actions(AVAILABLE_ACTIONS.clone()),
            default_sizes: vec![5, 15, 25, 50],
        }
    }

    fn get_actions<'a>(params: Vec<&'static String>) -> Vec<Option<&'a String>> {
        let default: Vec<Option<&'a String>> = vec![None];
        [default, params.into_iter().map(Some).collect()].concat()
    }
}
