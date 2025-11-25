pub mod variables {
    pub const TEST_SECRET_KEY: &str = "azw5B9YZXAKIFNFeZmoQtMCokTyddVkI";
    pub const TEST_ADMIN_KEY: &str = "Aq6B1S0kkaS4dt8kXObmOS1YX2GMnhHtjPlsTUI5KDLQV1eUoVSLpU3uemgcXY07hqnhNMdh1onInsAeX00itnA8tnoyHmzeV3wnytFVDbQqS9w+87HU9hfiYGtPmnQJw3SFhE25cTux6v95LksRpHUVyrtD2NEE8/LGhnF2tZ4=";
    pub const TEST_USER_KEY: &str = "d5INc+gLPH4DyCCRc7vgQgZnvhdtMwzA3xMcOvCpYL+kuAcXcX9arzSaAegD2TivYctIMSQp2oZWeYuKasO5IeIPOXIo/s7mkVvxJPfg8YrHUKqykf1T7DaduRpj97BdCsKR49FS0lwQrYgYMPx8PszsXHNg3qzNXbkvSKr/r7c=";

    // Battle system
    pub const BATTLE_SYSTEM_CTA_LENGTH: usize = 10;
    pub const BATTLE_SYSTEM_HISTORY_LENGTH: usize = 200;
    pub const BATTLE_SYSTEM_BASE_DAMAGES: i32 = 5;
    pub const BATTLE_SYSTEM_TAMPERING_ENV: &str = "TAMPERING_MODE";
}

pub mod errors {
    pub const BASE_ERROR: &str = "Error";
    pub const POOL_ERROR: &str = "Failed to create pool.";
    pub const RUNTIME_ERROR: &str = "error while running tauri application.";
    pub const NOT_SUPPORTED_LANGUAGE_ERROR: &str = "This language is not supported.";
    pub const VALIDATION_ERROR: &str = "Failed to serialize result";
    pub const PERMISSION_DENIED: &str = "Permission denied";
    pub const SCRIPT_ERROR: &str = "Invalid or missing script";

    // Battle system
    pub const BATTLE_SYSTEM_PENDING_ERROR: &str = "Cannot execute action, battle hasn't started";
    pub const BATTLE_SYSTEM_ENDED_ERROR: &str = "Cannot execute action, battle has ended";
    pub const BATTLE_SYSTEM_ACTION_ERROR: &str = "Action not recognized";
    pub const BATTLE_SYSTEM_OBJECT_ERROR: &str = "Object not recognized";
    pub const BATTLE_SYSTEM_TRANSITION_ERROR: &str = "Transition not valid";
    pub const BATTLE_SYSTEM_AUTOMATIC_ERROR: &str = "Cannot run automatic battle";
}

pub mod database {
    use diesel_migrations::{embed_migrations, EmbeddedMigrations};

    pub const DATABASE_URL: &str = "langres.db";
    pub const TEST_DATABASE_URL: &str = "test_db.db";
    pub const MIGRATIONS_PATH: EmbeddedMigrations = embed_migrations!("./migrations/");

    pub const MIGRATION_ERROR: &str = "Error while running migrations.";
    pub const INITIAL_DATAS_ERROR: &str = "Error while inserting initial datas.";
    pub const DATABASE_ERROR: &str = "Failed to initialize database.";
    pub const APPLICATION_PATH_ERROR: &str = "Failed to get current path";
    pub const DATABASE_PATH_ERROR: &str = "Failed to get database path";
    pub const FLUSH_DATABASE_ERROR: &str = "Failed to flush test database.";
    pub const DATABASE_CONNECTION_ERROR: &str = "Failed to get DB connection";
}
