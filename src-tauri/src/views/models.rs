use crate::permissions::models::{Credentials, Permission};
use serde::Serialize;
use serde_json::json;

pub fn authenticated_command<T, R>(permissions: Permission, func: T) -> serde_json::Value
where
    T: FnOnce() -> R,
    R: Serialize,
{
    let credentials = Credentials::initialize().config;

    if credentials.has_permission(permissions) {
        match serde_json::to_value(func()) {
            Ok(result) => result,
            Err(_) => json!({
                "error": "Failed to serialize the result"
            }),
        }
    } else {
        json!({
            "error": "Permission denied"
        })
    }
}
