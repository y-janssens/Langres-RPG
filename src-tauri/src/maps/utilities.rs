use super::tiles::get_neighbours;
use crate::maps::config::get_map_size;
use crate::maps::models::Tile;
use noise::{NoiseFn, Perlin, Terrace};
use rand::Rng;

#[allow(dead_code)]
pub struct Generator {
    content: Vec<Tile>,
    seed: u32,   // Random value (2800101214)
    scale: f64,  // Noise spreading
    factor: f64, // Intensity
    map_size: (usize, usize),
}

impl Generator {
    pub fn generate_town(content: Vec<Tile>) -> Vec<Tile> {
        let mut rng = rand::thread_rng();
        let mut topology = Generator {
            map_size: get_map_size(content.clone().len() as u32),
            seed: rng.gen(),
            content,
            scale: 0.025,
            factor: 1.8,
        };
        topology.generate_map();
        topology.clean_town_output();
        topology.content
    }

    fn generate_map(&mut self) -> Vec<Tile> {
        let items = &mut self.content;
        let perlin = Perlin::new(self.seed);
        let terrace: Terrace<f64, &Perlin, 3> = Terrace::new(&perlin)
            .add_control_point(-1.0)
            .add_control_point(0.0)
            // .add_control_point(0.1)
            .add_control_point(1.0);

        for item in items.iter_mut().filter(|i| &i.value != "T") {
            let noise_value =
                terrace.get([item.x as f64 * self.scale, item.y as f64 * self.scale, 0.0]);
            let value = ((noise_value + 1.0) * self.factor) as i32;
            Self::pre_compute_values(item, value);
        }

        items.to_vec()
    }

    fn pre_compute_values(item: &mut Tile, value: i32) -> &mut Tile {
        item.z = value;
        if item.z == 0 {
            item.value = "F".to_string();
            item.entropy = 0
        }
        item
    }

    fn clean_town_output(&mut self) {
        let neighbours: Vec<Vec<String>> = self
            .content
            .iter()
            .enumerate()
            .map(|(index, _)| get_neighbours(&self.content, index).0)
            .collect();

        for (index, item) in self
            .content
            .iter_mut()
            .enumerate()
            .filter(|(_, tile)| &tile.value == "F")
        {
            if neighbours[index].iter().all(|value| value == "F") {
                item.value = "-".to_string();
            }
        }
    }
}
