use core::fmt;
use magic_crypt::{new_magic_crypt, MagicCrypt256, MagicCryptError, MagicCryptTrait};
use serde::{Deserialize, Serialize};
use serde_json::{json, Error, Value};
use std::env;

use crate::backend::utils::errors::ValidationError;

#[derive(Debug)]
pub enum ConfigError {
    DecryptionError(String),
    ValidationError(String),
    JsonError(serde_json::Error),
}

impl From<MagicCryptError> for ConfigError {
    fn from(err: MagicCryptError) -> Self {
        ConfigError::DecryptionError(err.to_string())
    }
}
impl From<ValidationError> for ConfigError {
    fn from(err: ValidationError) -> Self {
        ConfigError::ValidationError(err.to_string())
    }
}

impl From<Error> for ConfigError {
    fn from(err: Error) -> Self {
        ConfigError::JsonError(err)
    }
}

impl fmt::Display for ConfigError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            ConfigError::DecryptionError(msg) => write!(f, "{}", msg),
            ConfigError::ValidationError(msg) => write!(f, "{}", msg),
            ConfigError::JsonError(err) => write!(f, "{}", err),
        }
    }
}

#[allow(dead_code)]
#[derive(Debug, Clone)]
pub enum Permission {
    Admin,
    Editor,
    DevTools,
    Dashboard,
    DevSettings,
    RegularUser,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Config {
    pub is_admin: bool,
    pub dashboard_enabled: bool,
    pub editor_enabled: bool,
    pub dev_tools_enabled: bool,
    pub dev_settings_enabled: bool,
}

impl Config {
    pub fn has_permission(&self, permission: Permission) -> bool {
        match permission {
            Permission::Admin => self.is_admin,
            Permission::Dashboard => self.is_admin && self.dashboard_enabled,
            Permission::Editor => self.is_admin && self.editor_enabled,
            Permission::DevTools => self.is_admin && self.dev_tools_enabled,
            Permission::DevSettings => self.is_admin && self.dev_settings_enabled,
            Permission::RegularUser => true,
        }
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Credentials {
    pub config: Config,
    configuration_key: Option<String>,
    status: String,
}

#[allow(dead_code)]
impl Credentials {
    /// Initialize credentials retrieval
    pub fn initialize() -> Result<Self, ConfigError> {
        let mut credentials = Self {
            config: Self::get_default_config(),
            configuration_key: None,
            status: String::from("default_credentials"),
        };

        if let Some(configuration_key) = Self::check_key("USER_KEY") {
            if let Some(security_key) = Self::check_key("SECRET_KEY") {
                credentials.config = Self::decrypt_secret_key(&security_key, &configuration_key)?;
                credentials.configuration_key = Some(configuration_key);
                credentials.status = String::from("authenticated_credentials");
            }
        }

        Ok(credentials)
    }

    /// Parse proper credentials config is environment variables are provided
    pub fn decrypt_secret_key(key: &str, configuration_key: &str) -> Result<Config, ConfigError> {
        let encryption_key = Self::get_key(key.to_string());
        let config = encryption_key.decrypt_base64_to_string(configuration_key)?;

        Ok(serde_json::from_str(&config)?)
    }

    pub fn get_default() -> Self {
        Self {
            config: Self::get_default_config(),
            configuration_key: None,
            status: String::from("default_credentials"),
        }
    }

    /// Default config fallback
    fn get_default_config() -> Config {
        Config {
            is_admin: false,
            dashboard_enabled: false,
            editor_enabled: false,
            dev_tools_enabled: false,
            dev_settings_enabled: false,
        }
    }

    /// Parse encryption key
    fn get_key(key: String) -> MagicCrypt256 {
        new_magic_crypt!(key, 256)
    }

    /// Check environment variables existence
    pub fn check_key(key: &str) -> Option<String> {
        env::var(key).ok()
    }

    pub fn generate_full_admin_secret_key() -> Result<String, Box<dyn std::error::Error>> {
        let values = json!({
            "is_admin": true,
            "dashboard_enabled": true,
            "editor_enabled": true,
            "dev_tools_enabled": true,
            "dev_settings_enabled": true,
        });
        let key = Self::generate_key(values)?;
        Ok(key)
    }

    pub fn generate_admin_secret_key() -> Result<String, Box<dyn std::error::Error>> {
        let values = json!({
            "is_admin": true,
            "dashboard_enabled": false,
            "editor_enabled": false,
            "dev_tools_enabled": true,
            "dev_settings_enabled": true,
        });
        let key = Self::generate_key(values)?;
        Ok(key)
    }

    pub fn generate_regular_user_secret_key() -> Result<String, Box<dyn std::error::Error>> {
        let values = json!({
            "is_admin": false,
            "dashboard_enabled": false,
            "editor_enabled": false,
            "dev_tools_enabled": false,
            "dev_settings_enabled": false,
        });
        let key = Self::generate_key(values)?;
        Ok(key)
    }

    /// Generate new credentials from json values
    pub fn generate_key(values: Value) -> Result<String, Box<dyn std::error::Error>> {
        let secret_key = Self::check_key("SECRET_KEY").unwrap();
        let encrypt = Self::get_key(secret_key.to_string());
        let json = serde_json::to_string(&values)?;
        let key = encrypt.encrypt_str_to_base64(json);
        Ok(key)
    }
}
