use super::models::{Act, Acts, Content, Story};
use crate::backend::conf::factory::factory_models::AbstractModel;

impl AbstractModel for Story {}
impl AbstractModel for Acts {}
impl AbstractModel for Act {}
impl AbstractModel for Content {}
