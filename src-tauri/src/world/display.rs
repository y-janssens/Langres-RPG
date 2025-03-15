use super::directions::Directions;
use super::models::World;

impl World {
    pub fn display_values(&self) {
        for line in self.content.chunks(self.size as usize) {
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

    pub fn display_directions(&self) {
        for line in self.content.chunks(self.size as usize) {
            for (index, item) in line.iter().enumerate() {
                let value = Directions::display(item);
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
                    print!("  {}{}\x1b[0m", color_code, value);
                } else {
                    print!(" {}{}\x1b[0m", color_code, value);
                }
            }
            println!();
        }
    }

    pub fn display_topology(&self) {
        for line in self.content.chunks(self.size as usize) {
            for (index, item) in line.iter().enumerate() {
                let color_code = match item.z {
                    0 => "\x1b[38;2;50;50;50m",
                    1 => "\x1b[38;2;80;80;80m",
                    2 => "\x1b[38;2;120;120;120m",
                    3 => "\x1b[38;2;160;160;160m",
                    4 => "\x1b[38;2;190;190;190m",
                    5 => "\x1b[38;2;220;220;220m",
                    6 => "\x1b[38;2;255;255;255m",
                    _ => "\x1b[0m",
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
}
