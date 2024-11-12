use magic_crypt::{new_magic_crypt, MagicCrypt256, MagicCryptTrait};
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use std::env;

#[derive(Debug, Serialize, Deserialize)]
pub struct Config {
    pub is_admin: bool,
    pub dashboard_enabled: bool,
    pub editor_enabled: bool,
    pub dev_tools_enabled: bool,
    pub dev_settings_enabled: bool,
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
    pub fn initialize() -> Self {
        let mut credentials = Self {
            config: Self::get_default_config(),
            configuration_key: None,
            status: String::from("default_credentials"),
        };

        if let Some(configuration_key) = Self::check_key("USER_KEY") {
            if let Some(security_key) = Self::check_key("SECRET_KEY") {
                credentials.config = Self::decrypt_secret_key(&security_key, &configuration_key);
                credentials.configuration_key = Some(configuration_key);
                credentials.status = String::from("authenticated_credentials");
            }
        }

        credentials
    }

    /// Parse proper credentials config is environment variables are provided
    pub fn decrypt_secret_key(key: &str, configuration_key: &str) -> Config {
        let encryption_key = Self::get_key(key.to_string());
        let config = encryption_key
            .decrypt_base64_to_string(configuration_key)
            .expect("Error while decrypting configuration");

        serde_json::from_str(&config).expect("Configuration is not valid json")
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
    fn check_key(key: &str) -> Option<String> {
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
        let key = Self::generate_key(values).unwrap();
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
        let key = Self::generate_key(values).unwrap();
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
        let key = Self::generate_key(values).unwrap();
        Ok(key)
    }

    /// Generate new credentials from json values
    pub fn generate_key(values: Value) -> Result<String, Box<dyn std::error::Error>> {
        let key = Self::check_key("SECRET_KEY").unwrap();
        let encrypt = Self::get_key(key.to_string());
        let json = serde_json::to_string(&values)?;
        let key = encrypt.encrypt_str_to_base64(json);
        Ok(key)
    }
}
