use std::ops::Deref;

#[derive(Clone)]
pub struct Command {
    name: &'static str,
    description: &'static str,
}

impl Command {
    pub fn register(name: &'static str, description: &'static str) -> Self {
        Self { name, description }
    }

    pub fn display(&self) {
        println!("{:<10} ==> {}", self.name, self.description);
    }
}

#[derive(Clone)]
pub struct Commands(Vec<Command>);

impl Deref for Commands {
    type Target = Vec<Command>;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl Commands {
    pub fn default<I>(entries: I) -> Self
    where
        I: IntoIterator<Item = Command>,
    {
        Self(entries.into_iter().collect())
    }

    pub fn display(&self) {
        for command in self.0.iter() {
            command.display();
        }
    }
}
