use diesel_migrations::{embed_migrations, EmbeddedMigrations};

pub const DATABASE_URL: &str = "langres.db";
#[allow(dead_code)]
pub const TEST_DATABASE_URL: &str = "test_db.db";
pub const MIGRATIONS: EmbeddedMigrations = embed_migrations!("./migrations/");
