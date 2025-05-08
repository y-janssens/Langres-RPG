use diesel::{result::Error, SqliteConnection};

use super::models::Story;
use crate::world::models::{Item, World};

pub struct StoryUtils {
    story: Story,
    compute: bool,
    read_only: bool,
}

impl StoryUtils {
    fn init(
        tiles: Option<&Vec<u32>>,
        read_only: bool,
        connection: &mut SqliteConnection,
    ) -> Result<Self, Error> {
        let story = Story::load(connection)?;
        Ok(Self {
            story,
            compute: tiles.is_some_and(|t| t.len() > 1),
            read_only,
        })
    }

    fn save(&mut self, connection: &mut SqliteConnection) -> Result<(), Error> {
        if !self.read_only {
            self.story.save(connection)?;
        }
        Ok(())
    }

    pub fn get_tile<F>(
        act_id: i32,
        map_id: i32,
        tiles: Vec<u32>,
        read_only: bool,
        connection: &mut SqliteConnection,
        mut operation: F,
    ) -> Result<(), Error>
    where
        F: FnMut(&mut Item, &World),
    {
        let mut utility = Self::init(Some(&tiles), read_only, connection)?;

        if let Some(map) = utility
            .story
            .story
            .acts
            .iter_mut()
            .find(|act| act.id == act_id)
            .and_then(|act| act.content.maps.iter_mut().find(|map| map.id == map_id))
        {
            let mut _map = map.clone();
            for item in map
                .content
                .iter_mut()
                .filter(|tile| tiles.contains(&tile.id))
            {
                operation(item, &_map);
            }
            if utility.compute {
                map.compute_directions();
            }
            utility.save(connection)?;
        };
        Ok(())
    }

    pub fn get_map<F>(
        act_id: i32,
        map_id: i32,
        read_only: bool,
        connection: &mut SqliteConnection,
        mut operation: F,
    ) -> Result<(), Error>
    where
        F: FnMut(&mut World),
    {
        let mut utility = Self::init(None, read_only, connection)?;

        if let Some(map) = utility
            .story
            .story
            .acts
            .iter_mut()
            .find(|act| act.id == act_id)
            .and_then(|act| act.content.maps.iter_mut().find(|map| map.id == map_id))
        {
            operation(map);
            utility.save(connection)?;
        };
        Ok(())
    }
}
