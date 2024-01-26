#[allow(dead_code)]
pub mod tests_fixtures {
    use crate::models::world::maps::Item;

    /// Run "cargo test -- --nocapture" to visualize output
    pub fn render_map_output(map: Vec<Item>) {
        for line in map.chunks(50) {
            for (index, item) in line.iter().enumerate() {
                let color_code = match item.value.as_str() {
                    "-" => "\x1b[0m",
                    "S" => "\x1b[93m",
                    "R" => "\x1b[93m",
                    "W" => "\x1b[36m",
                    "T" => "\x1b[38;2;0;255;0m",
                    "C" => "\x1b[38;2;144;238;144m",
                    _ => "\x1b[0m",
                };
                if item.y % 2 == 0 && index == 0 {
                    print!("  {}{}\x1b[0m", color_code, item.value);
                } else {
                    print!(" {}{}\x1b[0m", color_code, item.value);
                }
            }
            println!();
        }
    }
}
