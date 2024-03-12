use super::serializers::AdminModelSerializer;
use serde::Serialize;
use serde_json::{Error, Value};

#[derive(Serialize)]
pub struct Field {
    name: String,
    field: String,
}

pub trait AdminModel {
    fn id(&self) -> u8;
    fn name(&self) -> &'static str;
    fn command(&self) -> &'static str;
    fn model(&self) -> &'static str;
    fn search(&self) -> bool {
        true
    }
    fn create(&self) -> bool {
        true
    }
    fn actions(&self) -> Vec<&'static str> {
        vec!["edit", "delete"]
    }
    fn fields(&self) -> Vec<Field>;
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
    fn create(&self) -> bool {
        false
    }
    fn actions(&self) -> Vec<&'static str> {
        vec!["edit"]
    }
    fn fields(&self) -> Vec<Field> {
        vec![
            Field {
                name: "id".into(),
                field: "primary_key_field".into(),
            },
            Field {
                name: "name".into(),
                field: "character_field".into(),
            },
            Field {
                name: "created".into(),
                field: "date_field".into(),
            },
            Field {
                name: "modified".into(),
                field: "date_field".into(),
            },
            Field {
                name: "actions".into(),
                field: "cta_field".into(),
            },
        ]
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
        "load_games"
    }
    fn create(&self) -> bool {
        false
    }
    fn fields(&self) -> Vec<Field> {
        vec![
            Field {
                name: "id".into(),
                field: "primary_key_field".into(),
            },
            Field {
                name: "player".into(),
                field: "character_field".into(),
            },
            Field {
                name: "date_created".into(),
                field: "date_field".into(),
            },
            Field {
                name: "last_save_date".into(),
                field: "date_field".into(),
            },
            Field {
                name: "visible".into(),
                field: "boolean_field".into(),
            },
            Field {
                name: "actions".into(),
                field: "cta_field".into(),
            },
        ]
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
    fn fields(&self) -> Vec<Field> {
        vec![
            Field {
                name: "id".into(),
                field: "primary_key_field".into(),
            },
            Field {
                name: "created".into(),
                field: "date_field".into(),
            },
            Field {
                name: "modified".into(),
                field: "date_field".into(),
            },
            Field {
                name: "map".into(),
                field: "text_field".into(),
            },
            Field {
                name: "visible".into(),
                field: "boolean_field".into(),
            },
            Field {
                name: "actions".into(),
                field: "cta_field".into(),
            },
        ]
    }
}

pub struct AdminMapObjectsModel;
impl AdminModel for AdminMapObjectsModel {
    fn id(&self) -> u8 {
        3
    }
    fn name(&self) -> &'static str {
        "object"
    }
    fn model(&self) -> &'static str {
        "Object"
    }
    fn command(&self) -> &'static str {
        "load_objects"
    }
    fn fields(&self) -> Vec<Field> {
        vec![
            Field {
                name: "id".into(),
                field: "primary_key_field".into(),
            },
            Field {
                name: "name".into(),
                field: "character_field".into(),
            },
            Field {
                name: "value".into(),
                field: "character_field".into(),
            },
            Field {
                name: "area".into(),
                field: "dict_field".into(),
            },
            Field {
                name: "walkable".into(),
                field: "boolean_field".into(),
            },
            Field {
                name: "actions".into(),
                field: "cta_field".into(),
            },
        ]
    }
}

pub struct AdminMapFunctionsModel;
impl AdminModel for AdminMapFunctionsModel {
    fn id(&self) -> u8 {
        4
    }
    fn name(&self) -> &'static str {
        "function"
    }
    fn model(&self) -> &'static str {
        "Function"
    }
    fn command(&self) -> &'static str {
        "load_functions"
    }
    fn fields(&self) -> Vec<Field> {
        vec![
            Field {
                name: "id".into(),
                field: "primary_key_field".into(),
            },
            Field {
                name: "icon".into(),
                field: "character_field".into(),
            },
            Field {
                name: "label".into(),
                field: "character_field".into(),
            },
            Field {
                name: "command".into(),
                field: "character_field".into(),
            },
            Field {
                name: "actions".into(),
                field: "cta_field".into(),
            },
        ]
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
        dashboard.register_model(AdminMapObjectsModel);
        dashboard.register_model(AdminMapFunctionsModel);

        dashboard.export()
    }

    fn register_model<M: AdminModel + 'static>(&mut self, model: M) {
        self.models.push(Box::new(model));
    }

    fn export(&self) -> Result<Value, Error> {
        let models: Vec<AdminModelSerializer> = self
            .models
            .iter()
            .map(|model| AdminModelSerializer {
                model: model.as_ref(),
            })
            .collect();

        serde_json::to_value(models)
    }
}
