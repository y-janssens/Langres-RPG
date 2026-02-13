use std::{
    collections::HashMap,
    io::{
        Error,
        ErrorKind::{InvalidInput, NotFound},
    },
};

use serde::{Deserialize, Serialize};
use strum::IntoEnumIterator;
use strum_macros::{Display, EnumIter, EnumString};

use crate::backend::settings::errors::{DRAWER_BRUSH_DENSITY_ERROR, DRAWER_BRUSH_ERROR};
use crate::world::settings::*;
use crate::world::values::Values;

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BrushSettings {
    pub name: String,
    pub settings: Values,
}

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Display, EnumString, EnumIter)]
#[strum(serialize_all = "snake_case")]
pub enum Brush {
    Grass,
    Ground,
    Mud,
    Tree,
    Fence,
    Water,
    Road,
    Empty,
}

impl Brush {
    pub fn resolve(brush: &str) -> Result<Self, Error> {
        Self::try_from(brush).map_err(|_| Error::new(NotFound, DRAWER_BRUSH_ERROR))
    }

    pub fn value(&self) -> Values {
        match self {
            Self::Grass => GRASS.clone(),
            Self::Ground => GROUND.clone(),
            Self::Mud => MUD.clone(),
            Self::Tree => TREE.clone(),
            Self::Fence => FENCE.clone(),
            Self::Water => WATER.clone(),
            Self::Road => ROAD.clone(),
            Self::Empty => DEFAULT_MAP_VALUE.clone(),
        }
    }

    pub fn get_density(&self, density: Option<u8>) -> Option<u8> {
        if !self.value().supports_density {
            return None;
        }
        density.map(|d| d.clamp(1, 100))
    }

    pub fn get_density_values(&self, density: u8) -> Result<HashMap<String, u32>, Error> {
        match self {
            Brush::Tree => Ok(HashMap::from([
                (self.get_value(), density as u32),
                (GRASS.value(), 100 - density as u32),
            ])),
            _ => Err(Error::new(InvalidInput, DRAWER_BRUSH_DENSITY_ERROR)),
        }
    }

    pub fn get_value(&self) -> String {
        self.value().value()
    }

    pub fn get_side_value(&self) -> Option<String> {
        self.value().side_value
    }

    pub fn has_side_value(&self) -> bool {
        self.value().side_value.is_some()
    }

    pub fn is_empty(&self) -> bool {
        *self == Self::Empty
    }

    pub fn get_brushes() -> Vec<BrushSettings> {
        Self::iter()
            .map(|brush| BrushSettings {
                name: brush.to_string(),
                settings: brush.value(),
            })
            .collect()
    }
}
