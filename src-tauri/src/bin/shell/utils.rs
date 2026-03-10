use std::fmt::Display;

/// Standardized output with additional blank line
pub fn standard_output<T: Display>(text: T) {
    println!("{}", text);
    println!();
}
