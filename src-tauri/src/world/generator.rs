use round::round;
use tokio::sync::mpsc;

use crate::world::builder::models::Map;
use crate::world::builder::settings::*;
use crate::world::models::{Item, MapType, Options, World};

impl World {
    pub async fn regenerate(&mut self) -> Self {
        self.generate_content(None).await
    }

    pub fn generate(&mut self) {
        match &self.r#type {
            MapType::Hexagonal => self.generate_hex(),
            MapType::Square => self.generate_square(),
        }
    }

    /// Generate hexagonal base map
    pub fn generate_hex(&mut self) {
        let size = *DEFAULT_MAP_SIZE;
        let grid: u32 = *DEFAULT_MAP_SIZE_GRID;

        let mut content = Vec::with_capacity(grid as usize);

        for i in 0..grid {
            let col = i % size;
            let y = i / size;
            let x = if y.is_multiple_of(2) { (col * 2) + 1 } else { col * 2 };

            let value = self.generate_borders(x, y);
            let item = Item::new(i, x, y, value);

            content.push(item);
        }
        self.content = content;
    }

    /// Generate square base map
    pub fn generate_square(&mut self) {
        let size = *DEFAULT_MAP_SIZE;
        let grid = size * size;

        let mut content = Vec::with_capacity(grid as usize);

        for i in 0..grid {
            let x = i % size;
            let y = round((i / size) as f64, 1) as u32;

            let value = self.generate_borders(x, y);
            let item = Item::new(i, x, y, value);

            content.push(item);
        }
        self.content = content;
    }

    pub async fn generate_content(&mut self, options: Option<Options>) -> Self {
        let (tx, mut rx) = mpsc::channel(100);
        let generator_options = options.unwrap_or_else(|| self.options.clone());

        let mut cleared_map = self.clone();
        cleared_map.generate();
        let cleared_content = cleared_map.content;

        let result = tokio::task::spawn_blocking(move || Map::generate(cleared_content, generator_options))
            .await
            .unwrap();

        tx.send(result).await.unwrap();
        self.content = rx.recv().await.unwrap();
        self.compute_directions();
        self.clone()
    }

    /// Generate map's borders
    fn generate_borders(&mut self, x: u32, y: u32) -> String {
        let size = self.size;
        let threshold = self.r#type.get_threshold();

        if (x < 1 || x > size - 2) || (y < 1 || y > size + threshold - 2) {
            return TREE.value();
        }
        GRASS.value()
    }
}
