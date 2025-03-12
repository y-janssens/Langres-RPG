use std::io::Result;

use repl::Repl;

mod commands;
mod repl;
mod settings;
mod utils;

fn main() -> Result<()> {
    let mut repl = Repl::init()?;
    repl.run()
}
