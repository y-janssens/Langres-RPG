use super::{fields::Field, serializers::AdminModelSerializer};
use serde_json::{Error, Value};
use ucfirst::ucfirst;

pub trait AdminModel {
    fn id(&self) -> u8;
    fn name(&self) -> &'static str;
    fn command(&self) -> String {
        format!("load_{}s", self.name())
    }
    fn model(&self) -> String {
        ucfirst(self.name())
    }
    fn search(&self) -> bool {
        true
    }
    fn create(&self) -> bool {
        true
    }
    fn actions(&self) -> Vec<&'static str> {
        vec!["edit", "export", "delete"]
    }
    fn fields(&self) -> Vec<Field>;
}

pub struct AdminStoryLineModel;
impl AdminModel for AdminStoryLineModel {
    fn id(&self) -> u8 {
        1
    }
    fn name(&self) -> &'static str {
        "storyline"
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
            Field::pk_field(),
            Field::name_field("name"),
            Field::date_field("created"),
            Field::date_field("modified"),
            Field::cta_field(),
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
    fn fields(&self) -> Vec<Field> {
        vec![
            Field::pk_field(),
            Field::name_field("player"),
            Field::text_field("character", false),
            Field::dict_field("last_known_position", false),
            Field::date_field("date_created"),
            Field::date_field("last_save_date"),
            Field::boolean_field("visible", true),
            Field::cta_field(),
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
    fn fields(&self) -> Vec<Field> {
        vec![
            Field::pk_field(),
            Field::date_field("created"),
            Field::date_field("modified"),
            Field::text_field("map", true),
            Field::boolean_field("visible", true),
            Field::cta_field(),
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
    fn fields(&self) -> Vec<Field> {
        vec![
            Field::pk_field(),
            Field::name_field("name"),
            Field::char_field("value", true),
            Field::dict_field("area", true),
            Field::boolean_field("walkable", true),
            Field::cta_field(),
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
    fn fields(&self) -> Vec<Field> {
        vec![
            Field::pk_field(),
            Field::char_field("icon", true),
            Field::char_field("label", true),
            Field::char_field("command", true),
            Field::cta_field(),
        ]
    }
}

pub struct AdminQuestModel;
impl AdminModel for AdminQuestModel {
    fn id(&self) -> u8 {
        5
    }
    fn name(&self) -> &'static str {
        "quest"
    }
    fn fields(&self) -> Vec<Field> {
        vec![
            Field::pk_field(),
            Field::translatable_field("name", true),
            Field::translatable_field("description", true),
            Field::boolean_field("primary", true),
            Field::dict_field("status", false),
            Field::boolean_field("visible", true),
            Field::number_field("reward", false),
            Field::cta_field(),
        ]
    }
}

pub struct AdminAchievementModel;
impl AdminModel for AdminAchievementModel {
    fn id(&self) -> u8 {
        6
    }
    fn name(&self) -> &'static str {
        "achievement"
    }
    fn fields(&self) -> Vec<Field> {
        vec![
            Field::pk_field(),
            Field::translatable_field("name", true),
            Field::translatable_field("description", true),
            Field::boolean_field("completed", true),
            Field::cta_field(),
        ]
    }
}

pub struct AdminStatisticModel;
impl AdminModel for AdminStatisticModel {
    fn id(&self) -> u8 {
        7
    }
    fn name(&self) -> &'static str {
        "statistic"
    }
    fn fields(&self) -> Vec<Field> {
        vec![
            Field::pk_field(),
            Field::translatable_field("name", true),
            Field::char_field("value", true),
            Field::cta_field(),
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
        dashboard.register_model(AdminQuestModel);
        dashboard.register_model(AdminAchievementModel);
        dashboard.register_model(AdminStatisticModel);

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
