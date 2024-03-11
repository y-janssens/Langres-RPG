#[allow(dead_code)]
pub mod messages {
    pub const MIGRATION_ERROR: &str = "Error while migrating.";
    pub const POOL_ERROR: &str = "Failed to create pool.";
    pub const DATABASE_ERROR: &str = "Failed to initialize database.";
    pub const RUNTIME_ERROR: &str = "error while running tauri application.";
    pub const FLUSH_DATABASE_ERROR: &str = "Failed to flush test database.";
}
