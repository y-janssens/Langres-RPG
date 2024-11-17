use std::ops::Deref;

use serde::Serialize;
use serde_json::Value;

use super::utils::errors::ValidationError;

#[derive(Debug, Serialize)]
pub struct Response(pub Value);

impl Deref for Response {
    type Target = Value;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl Response {
    pub fn success(data: Value) -> Self {
        Response(data)
    }

    pub fn error(message: &str) -> ValidationError {
        ValidationError(message.to_string())
    }
}
