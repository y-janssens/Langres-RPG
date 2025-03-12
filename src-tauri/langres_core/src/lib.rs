use lazy_static::lazy_static;
use std::{
    collections::HashMap,
    ops::{Deref, DerefMut},
    sync::Mutex,
};

lazy_static! {
    pub static ref MODEL_REGISTRY: Mutex<Imports> = Mutex::new(Imports::new());
}

pub trait Model {
    fn name() -> &'static str;
    fn path() -> &'static str;
}

#[derive(Clone, Debug)]
pub struct Import {
    pub name: Vec<String>,
    pub path: String,
}

impl Import {
    pub fn display(&self) {
        println!(
            "\x1b[32mImport {}::{{{}}}\x1b[0m",
            &self.path,
            &self.name.join(", ")
        );
    }

    pub fn output(&self) {
        println!("{}::{{{}}}", &self.path, &self.name.join(", "));
    }
}

pub struct Imports(Vec<Import>);

impl Deref for Imports {
    type Target = Vec<Import>;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl DerefMut for Imports {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

impl Imports {
    pub fn new() -> Self {
        Self(vec![])
    }

    pub fn collect(&self) -> Self {
        let mut grouped: HashMap<String, Vec<String>> = HashMap::new();

        for import in &self.0 {
            grouped
                .entry(import.clone().path)
                .or_default()
                .extend(import.clone().name);
        }

        let imports = grouped
            .into_iter()
            .map(|(path, names)| Import { name: names, path })
            .collect();

        Self(imports)
    }

    pub fn display(&self) {
        let registry = &self.collect();
        for model in <Vec<Import> as Clone>::clone(&registry).into_iter() {
            model.display();
        }
    }

    pub fn output(&self) {
        let registry = &self.collect();
        for model in <Vec<Import> as Clone>::clone(&registry).into_iter() {
            model.output();
        }
    }
}
