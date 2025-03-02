use regex::Regex;
use rhai::{Dynamic, Engine, EvalAltResult, Map, Scope};
use rustyline::error::ReadlineError;
use rustyline::DefaultEditor;
use std::io::{self, stdin, stdout, Result, Write};

use langres_core::MODEL_REGISTRY;
use langres_lib::backend::{database::initialize_db, settings::database::DATABASE_ERROR};

use crate::{
    settings::{commands::*, errors::*, variables::*, COMMANDS},
    utils::standard_output,
};

pub struct Repl {
    editor: DefaultEditor,
    counter: u32,
    engine: Engine,
    variables: Map,
    reference_rule: Regex,
}

impl Repl {
    pub fn init() -> Result<Self> {
        Self::display_welcome_message();

        let mut engine = Engine::new();
        let mut variables = Map::new();
        let editor = DefaultEditor::new().expect(BASE_ERROR);
        let connection = initialize_db().expect(DATABASE_ERROR);

        variables.insert("connection".into(), Dynamic::from(connection.clone()));
        engine.set_strict_variables(false);

        // TODO implement modules and subsequent methods loading and registering

        Ok(Self {
            editor,
            counter: 1,
            engine,
            variables,
            reference_rule: Regex::new(REFERENCES_REGEX).unwrap(),
        })
    }

    fn display_welcome_message() {
        println!("{SHELL_IMPORTS_MESSAGE}");
        MODEL_REGISTRY.lock().unwrap().display();
        println!();
        standard_output(SHELL_WELCOME_MESSAGE.to_string());
    }

    fn display_help_commands() {
        COMMANDS.display();
    }

    fn display_available_models() {
        MODEL_REGISTRY.lock().unwrap().output();
    }

    fn clear_terminal() {
        print!("\x1b[2J");
        stdout().flush().unwrap();
    }

    fn display_output(&self, value: &Dynamic) {
        let counter = &self.get_prompt(false);
        standard_output(format!("{}{:#?}", counter, value));
    }

    fn display_error(error: Box<EvalAltResult>) {
        standard_output(format!("{:?}", error));
    }

    fn get_prompt(&self, r#in: bool) -> String {
        match r#in {
            true => format!("\x1b[32mIn [{}]: \x1b[0m", self.counter), // Green in output
            false => format!("\x1b[31mOut[{}]: \x1b[0m", self.counter), // Red out output
        }
    }

    fn confirm_exit() -> bool {
        println!("{EXIT_PROMPT}");
        loop {
            stdout().flush().unwrap();
            let mut input = String::new();

            if stdin().read_line(&mut input).is_ok() {
                match input.trim().to_lowercase().as_str() {
                    val if CONFIRM_EXIT_VALUES.contains(&val) => return true,
                    val if INFIRM_EXIT_VALUES.contains(&val) => return false,
                    _ => continue,
                }
            } else {
                continue;
            }
        }
    }

    /// Keep track of typed commands, non persistently
    fn parse_history(&mut self, line: &str) {
        self.editor.add_history_entry(line).expect(HISTORY_ERROR);
    }

    /// Counter is incremented and used for visibility, as well as variables referencing
    fn increment_counter(&mut self) {
        self.counter += 1
    }

    /// Access previously evaluated commands by their counter value : ex _1
    fn evaluate_reference(&self, command: &str) {
        if let Some(entry) = self.variables.get(command) {
            match self.engine.eval::<Dynamic>(&entry.to_string()) {
                Ok(result) => self.display_output(&result),
                Err(err) => Self::display_error(err),
            }
        }
    }

    /// Evaluate user input as rust code
    fn evaluate_command(&mut self, mut scope: Scope, command: &str) {
        match self.engine.eval_with_scope::<Dynamic>(&mut scope, command) {
            Ok(result) => {
                if !result.is_unit() {
                    self.display_output(&result);
                    let key = format!("_{}", self.counter);
                    self.variables.insert(key.into(), result);
                } else {
                    println!()
                }

                scope.iter().for_each(|(name, _, value)| {
                    self.variables.insert(name.into(), value);
                });
            }
            Err(err) => Self::display_error(err),
        }
    }

    /// Evaluate user input and dispatch to proper method
    fn evaluate(&mut self, command: &str) {
        let mut scope = Scope::new();

        for (name, value) in self.variables.iter() {
            scope.push(name.clone(), value.clone());
        }

        if self.reference_rule.is_match(command) {
            return self.evaluate_reference(command);
        }
        self.evaluate_command(scope, command);
        self.parse_history(command);
    }

    /// Run shell's main thread
    pub fn run(&mut self) -> io::Result<()> {
        loop {
            match self
                .editor
                .readline(&self.get_prompt(true))
                .map(|line| line.trim().to_string())
            {
                Ok(line) => match line.as_str() {
                    "" => continue, // Empty line
                    val if EXIT_COMMANDS.contains(&val) && Self::confirm_exit() => break,
                    val if HELP_COMMANDS.contains(&val) => Self::display_help_commands(),
                    val if MODELS_COMMANDS.contains(&val) => Self::display_available_models(),
                    val if CLEAR_COMMANDS.contains(&val) => Self::clear_terminal(),
                    command => self.evaluate(command),
                },

                Err(ReadlineError::Interrupted) if Self::confirm_exit() => break, // "CTRL+C"
                Err(ReadlineError::Eof) => break,                                 // "CTRL+D"
                Err(_) => break,
            }
            self.increment_counter();
        }
        Ok(())
    }
}
