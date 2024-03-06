pub mod admin_serializer {
    use serde::Serialize;
    use serde::ser::{SerializeStruct, Serializer};
    use crate::models::admin::dashboard::admin_dashboard::AdminModel;


    pub struct AdminModelProxy<'a> {
        pub model: &'a dyn AdminModel,
    }
    
    impl<'a> Serialize for AdminModelProxy<'a> {
        fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
        where
            S: Serializer,
        {
            let mut state = serializer.serialize_struct("AdminModel", 3)?;
            state.serialize_field("name", self.model.name())?;
            state.serialize_field("command", self.model.command())?;
            state.serialize_field("model", self.model.model())?;
            state.end()
        }
    }
}