use serde_yaml::{Mapping, Value};
use std::io::{Error, ErrorKind::InvalidData};

use crate::backend::settings::errors::SCRIPT_ERROR;

pub fn get_optional_string_value(content: &Value, key: &str) -> Option<String> {
    match content.get(key) {
        Some(value) => match value {
            Value::String(val) => Some(val.to_string()),
            _ => None,
        },
        _ => None,
    }
}

pub fn get_string_value(content: &Value, key: &str) -> String {
    get_optional_string_value(content, key).unwrap_or("".to_string())
}

pub fn get_boolean_value(content: &Value, key: &str) -> bool {
    content
        .get(key)
        .map(|c| c.as_bool().unwrap_or(false))
        .unwrap_or(false)
}

pub fn parse_string_value(content: &Value) -> String {
    content.as_str().unwrap_or("").to_string()
}

pub fn parse_numeric_value(content: &Value) -> f64 {
    content.as_f64().unwrap_or(0.0)
}

pub fn get_numeric_value(content: &Value, key: &str) -> u32 {
    content
        .get(key)
        .and_then(|v| v.as_u64())
        .map(|s| s as u32)
        .unwrap_or(0)
}

pub fn get_sequence<'a>(content: &'a Value, key: &'a str) -> Result<&'a Vec<Value>, Error> {
    content
        .get(key)
        .and_then(|v| v.as_sequence())
        .ok_or_else(|| Error::new(InvalidData, SCRIPT_ERROR))
}

pub fn get_mapping<'a>(content: &'a Value, key: &'a str) -> Result<&'a Mapping, Error> {
    content
        .get(key)
        .and_then(|v| v.as_mapping())
        .ok_or_else(|| Error::new(InvalidData, SCRIPT_ERROR))
}

pub fn get_value<'a>(content: &'a Mapping, key: &'a str) -> Result<f64, Error> {
    content
        .get(key)
        .map(parse_numeric_value)
        .ok_or_else(|| Error::new(InvalidData, SCRIPT_ERROR))
}
