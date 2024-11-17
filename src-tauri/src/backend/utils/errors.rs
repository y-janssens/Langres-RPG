use serde::Serialize;
use std::{fmt, ops::Deref};

#[derive(Debug, Serialize)]
pub struct ValidationError(pub String);

impl Deref for ValidationError {
    type Target = String;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl fmt::Display for ValidationError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Error: {}", self.0)
    }
}
