use std::io::Error;

use serde_yaml::{Sequence, Value};

use crate::backend::utils::parse::{get_boolean_value, get_mapping, get_numeric_value, get_sequence, get_string_value};
use crate::game::models::Position;
use crate::storyline::models::{Act, Content};
use crate::world::models::{Item, World};
use crate::world::values::Values;

impl Act {
    pub fn parse(content: &Sequence) -> Result<Vec<Self>, Error> {
        let mut acts = Vec::with_capacity(content.len());
        for act in content.iter() {
            acts.push(Act {
                id: get_numeric_value(act, "id") as i32,
                order: get_numeric_value(act, "order"),
                name: get_string_value(act, "name"),
                title: get_string_value(act, "title"),
                date: get_string_value(act, "date"),
                maps: Self::parse_maps(get_sequence(act, "maps")?)?,
                complete: false,
            });
        }
        Ok(acts)
    }

    fn parse_maps(content: &Sequence) -> Result<Content, Error> {
        let maps = content.iter().map(World::parse).collect::<Result<Vec<World>, Error>>()?;
        Ok(Content(maps))
    }
}

impl World {
    pub fn parse(content: &Value) -> Result<Self, Error> {
        let id = get_numeric_value(content, "id") as i32;
        let name = get_string_value(content, "name");
        let size = get_numeric_value(content, "size");
        let order = get_numeric_value(content, "order");
        let primary = get_boolean_value(content, "primary");
        let mut map = World::new(size, name, order, primary);

        map.id = id;
        map.starting_point = Position::parse(get_mapping(content, "starting_point")?)?;
        map.content = Self::parse_content(&mut map.content, get_sequence(content, "content")?);
        map.compute_directions();

        Ok(map)
    }

    fn parse_content(content: &mut [Item], values: &Sequence) -> Vec<Item> {
        content
            .iter_mut()
            .enumerate()
            .map(|(index, it)| {
                if let Some(value) = values[index].as_str() {
                    let (display_value, display_color, walkable) = Values::get_value(value);
                    it.walkable = walkable;
                    it.value = value.to_string();
                    it.display_value = display_value;
                    it.display_color = display_color;
                    it.neighbours_ids = Item::get_neighbours_ids(index as i32, it.y as i32);
                }
                it.clone()
            })
            .collect()
    }
}
