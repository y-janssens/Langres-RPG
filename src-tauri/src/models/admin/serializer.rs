pub mod admin_serializer {
    use crate::models::admin::dashboard::admin_dashboard::AdminModel;
    use serde::ser::{SerializeStruct, Serializer};
    use serde::Serialize;

    pub struct AdminModelProxy<'a> {
        pub model: &'a dyn AdminModel,
    }

    impl<'a> Serialize for AdminModelProxy<'a> {
        fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
        where
            S: Serializer,
        {
            let mut state = serializer.serialize_struct("AdminModel", 5)?;
            state.serialize_field("id", &self.model.id())?;
            state.serialize_field("name", self.model.name())?;
            state.serialize_field("command", self.model.command())?;
            state.serialize_field("model", self.model.model())?;
            state.serialize_field("search", &self.model.search())?;
            state.serialize_field("create", &self.model.create())?;
            state.serialize_field("actions", &self.model.actions())?;
            state.serialize_field("fields", &self.model.fields())?;
            state.end()
        }
    }
}
