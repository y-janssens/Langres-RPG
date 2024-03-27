pub mod factory_models {
    use diesel::SqliteConnection;

    pub trait AbstractModel {}

    pub trait Factory {
        type Output: AbstractModel;
        fn generate(&self) -> Self::Output;
    }
    pub trait NamedFactory {
        type Output: AbstractModel;
        fn generate(&self, name: &str) -> Self::Output;
    }

    pub trait ApiFactory {
        type Output: AbstractModel;
        fn generate(&self, connection: &mut SqliteConnection) -> Self::Output;
    }
}
