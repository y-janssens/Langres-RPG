#[allow(dead_code)]
pub mod tests_fixtures {
    use crate::world::models::Item;

    /// Run "cargo test -- --nocapture" to visualize output
    pub fn render_map_output(map: Vec<Item>, size: u32) {
        for line in map.chunks(size.try_into().unwrap()) {
            for (index, item) in line.iter().enumerate() {
                let color_code = match item.value.as_str() {
                    "-" => "\x1b[0m",
                    "S" => "\x1b[93m",
                    "R" => "\x1b[93m",
                    "W" => "\x1b[36m",
                    "T" => "\x1b[38;2;0;255;0m",
                    "C" => "\x1b[0m",
                    "F" => "\x1b[38;2;210;180;140m",
                    "G" => "\x1b[38;2;210;180;140m",
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
    pub fn render_map_topology(map: Vec<Item>, size: u32) {
        for line in map.chunks(size.try_into().unwrap()) {
            for (index, item) in line.iter().enumerate() {
                let color_code = match item.z {
                    0 => "\x1b[38;2;50;50;50m",    // Dark Gray (Lowest elevation)
                    1 => "\x1b[38;2;80;80;80m",    // Dim Gray
                    2 => "\x1b[38;2;120;120;120m", // Gray
                    3 => "\x1b[38;2;160;160;160m", // Light Gray
                    4 => "\x1b[38;2;190;190;190m", // Gainsboro
                    5 => "\x1b[38;2;220;220;220m", // Very Light Gray
                    6 => "\x1b[38;2;255;255;255m", // White (Highest elevation)
                    _ => "\x1b[0m",                // Default (Reset)
                };

                if item.y % 2 == 0 && index == 0 {
                    print!("  {}{}\x1b[0m", color_code, item.z);
                } else {
                    print!(" {}{}\x1b[0m", color_code, item.z);
                }
            }
            println!();
        }
    }

    pub fn compute_map_size(size: u32) -> u32 {
        let rows = ((size as f32 + (size as f32).sqrt()).ceil() + 1_f32) as u32;
        size * rows
    }
}
