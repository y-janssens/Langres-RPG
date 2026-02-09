use std::{
    collections::{HashMap, HashSet},
    io::{Error, ErrorKind::InvalidInput},
};

use serde::{Deserialize, Serialize};

use super::types::Brush;
use crate::backend::{settings::errors::DRAWER_INPUT_ERROR, utils::functions::get_weighted_random_value};
use crate::world::models::*;

#[derive(Debug, Serialize, Deserialize)]
pub struct Drawer {
    pub brush: Brush,
    pub tiles: HashSet<u32>,
    pub density: Option<u8>,
    pub overwrite: bool,
}

// Core drawing logic
impl Drawer {
    pub fn init(tiles: Vec<u32>, brush: &str, overwrite: bool, density: Option<u8>) -> Result<Self, Error> {
        if tiles.is_empty() {
            return Err(Error::new(InvalidInput, DRAWER_INPUT_ERROR));
        }

        let brush = Brush::resolve(brush)?;
        let density = brush.get_density(density);
        let overwrite = overwrite || brush.is_empty();

        let config = Self {
            brush,
            density,
            overwrite,
            tiles: tiles.into_iter().collect(),
        };

        Ok(config)
    }
    pub fn execute(map: World, tiles: Vec<u32>, brush: &str, overwrite: bool, density: Option<u8>) -> Result<Vec<Item>, Error> {
        let config = Self::init(tiles, brush, overwrite, density)?;

        let mut content: HashMap<u32, Item> = map.content.clone().into_iter().map(|it| (it.id, it)).collect();

        config.apply(&mut content)?;

        let mut result: Vec<Item> = content.into_values().collect();
        result.sort_by_key(|it| it.id);

        Ok(result)
    }

    fn apply(&self, content: &mut HashMap<u32, Item>) -> Result<(), Error> {
        let items_ids = self.get_content(content);
        let neighbours_ids = self.get_neighbours(content, &items_ids);

        self.draw_boundaries(content, neighbours_ids);
        self.draw_content(content, items_ids)
    }

    fn draw_content(&self, content: &mut HashMap<u32, Item>, items_ids: HashSet<u32>) -> Result<(), Error> {
        for (id, it) in content.iter_mut() {
            if !items_ids.contains(id) {
                continue;
            }
            if !self.overwrite && !it.walkable {
                continue;
            }

            let value = self.get_value()?;
            it.edit(&value);
        }
        Ok(())
    }

    fn draw_boundaries(&self, content: &mut HashMap<u32, Item>, neighbours_ids: HashSet<u32>) {
        if neighbours_ids.is_empty() || !self.overwrite {
            return;
        }
        if let Some(value) = self.brush.get_side_value() {
            content
                .iter_mut()
                .filter(|(_, it)| neighbours_ids.contains(&it.id))
                .for_each(|(_, it)| {
                    it.edit(&value);
                });
        }
    }
}

// Getters
impl Drawer {
    fn get_content(&self, content: &HashMap<u32, Item>) -> HashSet<u32> {
        content
            .iter()
            .filter(|(id, _item)| self.tiles.contains(id))
            .map(|(id, _item)| *id)
            .collect()
    }

    fn get_neighbours(&self, content: &HashMap<u32, Item>, items: &HashSet<u32>) -> HashSet<u32> {
        if !self.brush.has_side_value() || self.density.is_some_and(|d| d < 100) {
            return HashSet::new();
        }

        items
            .iter()
            .filter_map(|id| content.get(id))
            .flat_map(|item| item.neighbours_ids.iter().copied())
            .filter(|id| !items.contains(id))
            .collect()
    }

    fn get_value(&self) -> Result<String, Error> {
        let value = self.brush.get_value();

        match self.density {
            Some(density) if density < 100 => {
                let values = self.brush.get_density_values(density)?;
                Ok(get_weighted_random_value(&values))
            }
            _ => Ok(value),
        }
    }
}
