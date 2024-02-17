#[allow(dead_code)]
pub mod map_topology {
    use crate::models::maps::{config::map_config::get_map_size, procedural::generation::Tile};
    use noise::{NoiseFn, Perlin};
    use rand::Rng;

    pub struct Topology {
        content: Vec<Tile>,
        seed: u32,   // Random value
        scale: f64,  // Noise spreading
        factor: f64, // Intensity
        map_size: (usize, usize),
        interactive_mode: bool,
    }

    impl Topology {
        pub fn topologize(content: Vec<Tile>, interactive_mode: bool) -> Vec<Tile> {
            let mut rng = rand::thread_rng();
            let mut topology = Topology {
                map_size: get_map_size(content.clone().len() as u32),
                seed: rng.gen(),
                content,
                scale: 0.075,
                factor: 2.8,
                interactive_mode,
            };
            topology.generate_height_map();
            topology.content
        }

        fn generate_height_map(&mut self) -> Vec<Tile> {
            let items = &mut self.content;
            let perlin = Perlin::new(self.seed);

            for item in items.iter_mut() {
                let noise_value =
                    perlin.get([item.x as f64 * self.scale, item.y as f64 * self.scale, 0.0]);
                let value = ((noise_value + 1.0) * self.factor) as i32;
                Self::pre_compute_values(item, value, self.interactive_mode);
            }

            items.to_vec()
        }

        fn pre_compute_values(item: &mut Tile, value: i32, edit: bool) -> &mut Tile {
            item.z = value;
            if edit {
                match item.z {
                    0 => {
                        item.value = "W".to_string();
                        item.entropy = 0
                    }
                    _ if item.z >= 4 => {
                        item.value = "T".to_string();
                        item.entropy = 0
                    }
                    _ => (),
                }
            }
            item
        }
    }
}
