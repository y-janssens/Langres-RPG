#[allow(dead_code)]
pub mod map_report {
    use crate::models::maps::{
        procedural::generation::{Map, Tile},
        tiles::map_config_tiles::get_tiles_values,
    };

    #[derive(Debug)]
    pub struct Report {
        summary: Summary,
        details: Details,
    }

    #[derive(Debug)]
    struct Summary {
        valid: u32,
        inconsistent: u32,
        unchanged: u32,
    }

    #[derive(Debug)]
    struct Details {
        inconsistent: Vec<Option<u32>>,
        unchanged: Vec<Option<u32>>,
    }

    pub fn generate_report(items: Vec<Tile>) -> Report {
        let analyze = analyze_map(items);
        let mut inconsistent = vec![];
        let mut unchanged = vec![];

        for item in &analyze.1 {
            inconsistent.push(Some(item.id))
        }
        for item in &analyze.2 {
            unchanged.push(Some(item.id))
        }
        Report {
            summary: Summary {
                valid: analyze.0.len() as u32,
                inconsistent: analyze.1.len() as u32,
                unchanged: analyze.2.len() as u32,
            },
            details: Details {
                inconsistent,
                unchanged,
            },
        }
    }

    fn analyze_map(items: Vec<Tile>) -> (Vec<Tile>, Vec<Tile>, Vec<Tile>) {
        let mut valid = vec![];
        let mut inconsistent = vec![];
        let mut unchanged = vec![];
        let expected_values = get_tiles_values();

        for (index, item) in items.iter().enumerate() {
            let neighbours = Map::get_neighbours(&items, index);
            let constraints = Map::apply_constraints(neighbours.0, expected_values.clone());
            if &item.value == "null" {
                unchanged.push(item.clone())
            }
            if constraints.1.is_empty() {
                inconsistent.push(item.clone())
            } else if expected_values.contains(&item.value) {
                valid.push(item.clone())
            }
        }
        (valid, inconsistent, unchanged)
    }
}
