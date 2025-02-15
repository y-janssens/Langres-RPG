use crate::backend::conf::factory::factory_models::AbstractModel;

use super::models::{Act, Story};

impl AbstractModel for Story {}
impl AbstractModel for Act {}
