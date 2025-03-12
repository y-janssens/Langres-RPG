use lazy_static::lazy_static;

use crate::commands::*;

pub mod variables {
    pub const SHELL_WELCOME_MESSAGE: &str =
        "Rust interactive shell 0.0.1 -- Type ':help' to display available commands.";
    pub const SHELL_IMPORTS_MESSAGE: &str = "# Langres shell models import";
    pub const EXIT_PROMPT: &str =
        "Are you sure you want to quit? Y/N (Press ctrl + C to forcefully exit)";
    pub const CONFIRM_EXIT_VALUES: [&str; 2] = ["y", "yes"];
    pub const INFIRM_EXIT_VALUES: [&str; 2] = ["n", "no"];
    pub const REFERENCES_REGEX: &str = r"_(\d+)";
}

pub mod errors {
    pub const BASE_ERROR: &str = "Error";
    pub const HISTORY_ERROR: &str = "Failed to parse history";
}

pub mod commands {
    pub const EXIT_COMMANDS: [&str; 3] = ["exit", ":exit", "exit()"];
    pub const HELP_COMMANDS: [&str; 2] = ["help", ":help"];
    pub const MODELS_COMMANDS: [&str; 2] = ["models", ":models"];
    pub const CLEAR_COMMANDS: [&str; 2] = ["clear", ":clear"];
}

lazy_static! {
    pub static ref COMMANDS: Commands = Commands::default([
        Command::register(":exit", "Exit interactive shell"),
        Command::register(":help", "Display available commands"),
        Command::register(":models", "Display available models"),
        Command::register(":clear", "Clear current screen"),
    ]);
}
