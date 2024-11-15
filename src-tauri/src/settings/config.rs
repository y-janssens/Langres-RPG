#[allow(dead_code)]
pub mod vars {
    use diesel_migrations::{embed_migrations, EmbeddedMigrations};

    pub const DATABASE_URL: &str = "langres.db";
    pub const MIGRATIONS: EmbeddedMigrations = embed_migrations!("./migrations/");

    pub const TEST_SECRET_KEY: &str = "azw5B9YZXAKIFNFeZmoQtMCokTyddVkI";
    pub const TEST_ADMIN_KEY: &str = "Aq6B1S0kkaS4dt8kXObmOS1YX2GMnhHtjPlsTUI5KDLQV1eUoVSLpU3uemgcXY07hqnhNMdh1onInsAeX00itnA8tnoyHmzeV3wnytFVDbQqS9w+87HU9hfiYGtPmnQJw3SFhE25cTux6v95LksRpHUVyrtD2NEE8/LGhnF2tZ4=";
    pub const TEST_USER_KEY: &str = "d5INc+gLPH4DyCCRc7vgQgZnvhdtMwzA3xMcOvCpYL+kuAcXcX9arzSaAegD2TivYctIMSQp2oZWeYuKasO5IeIPOXIo/s7mkVvxJPfg8YrHUKqykf1T7DaduRpj97BdCsKR49FS0lwQrYgYMPx8PszsXHNg3qzNXbkvSKr/r7c=";
}
