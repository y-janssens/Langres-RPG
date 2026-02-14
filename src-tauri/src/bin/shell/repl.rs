use evcxr::{EvalContext, EvalContextOutputs, EvalOutputs};
use rustyline::error::ReadlineError;
use rustyline::DefaultEditor;
use std::io::{self, stdin, stdout, Result, Write};
use std::{env, fs};

use langres_core::MODEL_REGISTRY;
use langres_lib::run as langres_run;

use crate::{
    settings::{commands::*, errors::*, variables::*, COMMANDS},
    utils::standard_output,
};

pub struct Repl {
    editor: DefaultEditor,
    counter: u32,
    evaluator: EvalContext,
    outputs: EvalContextOutputs,
    bootstrap_errors: Vec<String>,
}

impl Repl {
    pub fn init() -> Result<Self> {
        let _ = langres_run as fn();
        Self::configure_evcxr_tmpdir();
        let editor = DefaultEditor::new().expect(BASE_ERROR);
        let (mut evaluator, outputs) = EvalContext::new().expect(BASE_ERROR);
        evaluator.set_preserve_vars_on_panic(false);
        let bootstrap_errors = Self::bootstrap(&mut evaluator);
        Self::display_welcome_message();

        let repl = Self {
            editor,
            counter: 1,
            evaluator,
            outputs,
            bootstrap_errors,
        };
        repl.display_bootstrap_errors();
        Ok(repl)
    }

    fn configure_evcxr_tmpdir() {
        if env::var("EVCXR_TMPDIR").is_ok() {
            return;
        }

        let tmpdir = format!("{}/target/evcxr", env!("CARGO_MANIFEST_DIR"));
        let _ = fs::create_dir_all(&tmpdir);
        // SAFETY: called once at process startup before any threads are spawned.
        unsafe { env::set_var("EVCXR_TMPDIR", tmpdir) };
    }

    fn bootstrap(evaluator: &mut EvalContext) -> Vec<String> {
        let mut errors = Vec::new();
        let imports = MODEL_REGISTRY.lock().unwrap().collect();
        let manifest_dir = env!("CARGO_MANIFEST_DIR").replace('\\', "\\\\");
        let dep_cfg = format!(r#"{{ package = "langres", path = "{manifest_dir}" }}"#);
        let mut state = evaluator.state();
        if let Err(err) = state.add_dep("langres_lib", &dep_cfg) {
            errors.push(format!("bootstrap add_dep failed: {err}"));
            return errors;
        }
        if let Err(err) = state.add_dep("diesel", r#"{ version = "2.2.2", features = ["sqlite", "r2d2"] }"#) {
            errors.push(format!("bootstrap add_dep diesel failed: {err}"));
            return errors;
        }

        if let Err(err) = evaluator.eval_with_state("extern crate langres_lib as app;", state) {
            errors.push(format!("bootstrap crate import failed: {err}"));
            return errors;
        }

        let mut prelude: Vec<String> = vec![
            "use app::backend::database::initialize_db;".to_string(),
            "use diesel::{SqliteConnection, r2d2::{ConnectionManager, PooledConnection}};".to_string(),
            "let mut connection: PooledConnection<ConnectionManager<SqliteConnection>> = initialize_db().expect(\"database init failed\").get().expect(\"database connection failed\");"
                .to_string(),
        ];

        for import in imports.iter() {
            let names = import.name.join(", ");
            let path = import.path.replacen("langres_lib::", "app::", 1);
            prelude.push(format!("use {}::{{{}}};", path, names));
        }

        for statement in prelude {
            Self::eval_bootstrap_statement(evaluator, &statement, &mut errors);
        }
        errors
    }

    fn eval_bootstrap_statement(
        evaluator: &mut EvalContext,
        statement: &str,
        errors: &mut Vec<String>,
    ) {
        if let Err(err) = evaluator.eval(statement) {
            errors.push(format!("bootstrap statement failed `{statement}`: {err}"));
        }
    }

    fn display_welcome_message() {
        println!("{SHELL_IMPORTS_MESSAGE}");
        MODEL_REGISTRY.lock().unwrap().display();
        println!();
        standard_output(SHELL_WELCOME_MESSAGE.to_string());
    }

    fn display_bootstrap_errors(&self) {
        if self.bootstrap_errors.is_empty() {
            return;
        }

        standard_output("# Shell bootstrap errors");
        for error in &self.bootstrap_errors {
            standard_output(error);
        }
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

    fn display_output(&self, value: &str) {
        let counter = &self.get_prompt(false);
        standard_output(format!("{}{}", counter, value.trim()));
    }

    fn display_error(error: impl std::fmt::Display) {
        standard_output(error.to_string());
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

    fn increment_counter(&mut self) {
        self.counter += 1
    }

    fn drain_streams(&mut self) {
        while let Ok(line) = self.outputs.stdout.try_recv() {
            if !line.trim().is_empty() {
                standard_output(line);
            }
        }

        while let Ok(line) = self.outputs.stderr.try_recv() {
            if !line.trim().is_empty() {
                standard_output(line);
            }
        }
    }

    fn display_eval_outputs(&self, outputs: &EvalOutputs) {
        if let Some(content) = outputs.content_by_mime_type.get("text/plain") {
            let trimmed = content.trim();
            if !trimmed.is_empty() && trimmed != "()" {
                self.display_output(content);
            }
        }
    }

    fn is_item_or_statement(command: &str) -> bool {
        let trimmed = command.trim_start();
        let starts_with_keyword = [
            "let ", "use ", "fn ", "struct ", "enum ", "impl ", "trait ", "mod ", "extern ", "type ", "pub ",
            "const ", "static ",
        ]
        .iter()
        .any(|keyword| trimmed.starts_with(keyword));

        starts_with_keyword || trimmed.ends_with(';')
    }

    fn wrap_with_counter_binding(&self, command: &str) -> String {
        let key = format!("_{}", self.counter);
        format!("let {key} = {{\n{command}\n}};\n{key}")
    }

    fn run_eval(&mut self, code: &str) -> std::result::Result<EvalOutputs, evcxr::Error> {
        let result = self.evaluator.eval(code);
        if let Ok(ref outputs) = result {
            self.drain_streams();
            self.display_eval_outputs(outputs);
        }
        result
    }

    fn evaluate_statement(&mut self, command: &str) {
        match self.run_eval(command) {
            Ok(_) => {
                let _ = self.evaluator.eval(&format!("let _{} = ();", self.counter));
            }
            Err(err) => Self::display_error(err),
        }
    }

    fn evaluate_expression(&mut self, command: &str) {
        let wrapped_command = self.wrap_with_counter_binding(command);

        match self.run_eval(&wrapped_command) {
            Ok(_) => {}
            Err(err) => {
                if self.run_eval(command).is_err() {
                    Self::display_error(err);
                }
            }
        }
    }

    fn evaluate(&mut self, command: &str) {
        if Self::is_item_or_statement(command) {
            self.evaluate_statement(command);
            self.parse_history(command);
            return;
        }

        self.evaluate_expression(command);
        self.parse_history(command);
    }

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
