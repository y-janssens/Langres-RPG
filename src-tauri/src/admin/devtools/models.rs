use crate::backend::permissions::models::Credentials;
use serde::Serialize;
use std::collections::HashMap;
use std::ops::Deref;

#[derive(Debug, Serialize, PartialEq)]
pub enum SettingType {
    Boolean,
    Number,
}

#[derive(Debug, Serialize, PartialEq)]
pub struct Setting {
    pub order: i8,
    pub value: SettingValue,
    pub dynamic: bool,
    pub r#type: SettingType,
    pub step: Option<f64>,
    pub mutable: bool,
}

#[derive(Debug, Serialize, PartialEq)]
#[serde(untagged)]
pub enum SettingValue {
    Boolean(bool),
    Number(f64),
}

#[derive(Debug, Serialize, PartialEq)]
pub struct SettingGroup(HashMap<String, Setting>);

impl Deref for SettingGroup {
    type Target = HashMap<String, Setting>;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

#[derive(Debug, Serialize, PartialEq)]
pub struct DevSettings {
    pub global: SettingGroup,
    pub game: SettingGroup,
    pub scene: SettingGroup,
}

impl SettingGroup {
    pub fn new() -> Self {
        SettingGroup(HashMap::new())
    }

    pub fn add(&mut self, name: &str, setting: Setting) {
        self.0.insert(name.to_string(), setting);
    }
}

impl DevSettings {
    pub fn get() -> Self {
        let is_admin = Credentials::initialize().config.is_admin;
        let mut global = SettingGroup::new();
        let mutable = is_admin;

        global.add(
            "performances",
            Setting {
                order: 0,
                value: SettingValue::Boolean(false),
                dynamic: true,
                r#type: SettingType::Boolean,
                step: None,
                mutable,
            },
        );
        global.add(
            "collisions",
            Setting {
                order: 1,
                value: SettingValue::Boolean(true),
                dynamic: false,
                r#type: SettingType::Boolean,
                step: None,
                mutable,
            },
        );
        global.add(
            "displayLoadingScreen",
            Setting {
                order: 2,
                value: SettingValue::Boolean(!is_admin),
                dynamic: false,
                r#type: SettingType::Boolean,
                step: None,
                mutable,
            },
        );

        let mut game = SettingGroup::new();
        game.add(
            "displayText",
            Setting {
                order: 0,
                value: SettingValue::Boolean(false),
                dynamic: false,
                r#type: SettingType::Boolean,
                step: None,
                mutable,
            },
        );
        game.add(
            "displayMeshes",
            Setting {
                order: 1,
                value: SettingValue::Boolean(true),
                dynamic: false,
                r#type: SettingType::Boolean,
                step: None,
                mutable,
            },
        );
        game.add(
            "displayObstacles",
            Setting {
                order: 2,
                value: SettingValue::Boolean(true),
                dynamic: false,
                r#type: SettingType::Boolean,
                step: None,
                mutable,
            },
        );
        game.add(
            "displayTextures",
            Setting {
                order: 3,
                value: SettingValue::Boolean(true),
                dynamic: true,
                r#type: SettingType::Boolean,
                step: None,
                mutable,
            },
        );
        game.add(
            "displayWater",
            Setting {
                order: 4,
                value: SettingValue::Boolean(true),
                dynamic: true,
                r#type: SettingType::Boolean,
                step: None,
                mutable,
            },
        );

        let mut scene = SettingGroup::new();
        scene.add(
            "isometric",
            Setting {
                order: 0,
                value: SettingValue::Boolean(true),
                dynamic: true,
                r#type: SettingType::Boolean,
                step: None,
                mutable,
            },
        );
        scene.add(
            "zoom",
            Setting {
                order: 1,
                value: SettingValue::Number(1.25),
                dynamic: true,
                r#type: SettingType::Number,
                step: Some(0.1),
                mutable,
            },
        );
        scene.add(
            "pixelization",
            Setting {
                order: 2,
                value: SettingValue::Number(2.0),
                dynamic: false,
                r#type: SettingType::Number,
                step: Some(1.0),
                mutable,
            },
        );

        DevSettings {
            global,
            game,
            scene,
        }
    }
}
