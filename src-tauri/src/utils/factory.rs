pub mod factory {
    pub trait AbstractModel {}

    pub trait Factory {
        type Output: AbstractModel;
        fn generate(&self) -> Self::Output;
    }
}
