pub mod admin_dashboard {
    use crate::models::admin::serializer::admin_serializer::AdminModelProxy;
    use serde_json::{Error, Value};

    pub trait AdminModel {
        fn id(&self) -> u8;
        fn name(&self) -> &'static str;
        fn command(&self) -> &'static str;
        fn model(&self) -> &'static str;
        fn search(&self) -> bool {
            true
        }
        fn actions(&self) -> Vec<&'static str> {
            vec!["create", "edit", "delete"]
        }
    }

    pub struct AdminStoryLineModel;
    impl AdminModel for AdminStoryLineModel {
        fn id(&self) -> u8 {
            1
        }
        fn name(&self) -> &'static str {
            "story"
        }
        fn model(&self) -> &'static str {
            "Storyline"
        }
        fn command(&self) -> &'static str {
            "fetch_storyline"
        }
        fn search(&self) -> bool {
            false
        }
        fn actions(&self) -> Vec<&'static str> {
            vec!["edit"]
        }
    }

    pub struct AdminGameModel;
    impl AdminModel for AdminGameModel {
        fn id(&self) -> u8 {
            0
        }
        fn name(&self) -> &'static str {
            "game"
        }
        fn model(&self) -> &'static str {
            "Game"
        }
        fn command(&self) -> &'static str {
            "fetch_games"
        }
    }

    pub struct AdminCollectionModel;
    impl AdminModel for AdminCollectionModel {
        fn id(&self) -> u8 {
            2
        }
        fn name(&self) -> &'static str {
            "collection"
        }
        fn model(&self) -> &'static str {
            "Collection"
        }
        fn command(&self) -> &'static str {
            "load_collections"
        }
    }

    pub struct AdminDashboard {
        models: Vec<Box<dyn AdminModel>>,
    }

    impl AdminDashboard {
        pub fn get() -> Result<Value, Error> {
            let mut dashboard = AdminDashboard { models: Vec::new() };
            dashboard.register_model(AdminGameModel);
            dashboard.register_model(AdminStoryLineModel);
            dashboard.register_model(AdminCollectionModel);

            dashboard.export()
        }

        fn register_model<M: AdminModel + 'static>(&mut self, model: M) {
            self.models.push(Box::new(model));
        }

        fn export(&self) -> Result<Value, Error> {
            let models: Vec<AdminModelProxy> = self
                .models
                .iter()
                .map(|model| AdminModelProxy {
                    model: model.as_ref(),
                })
                .collect();

            serde_json::to_value(models)
        }
    }
}
