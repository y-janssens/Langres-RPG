use serde::Serialize;

#[derive(Serialize)]
pub struct Field {
    name: String,
    field: String,
    primary: bool,
}

#[allow(dead_code)]
impl Field {
    pub fn char_field(name: &str, primary: bool) -> Self {
        Field {
            name: String::from(name),
            field: "character_field".into(),
            primary,
        }
    }

    pub fn number_field(name: &str, primary: bool) -> Self {
        Field {
            name: String::from(name),
            field: "number_field".into(),
            primary,
        }
    }

    pub fn name_field(name: &str) -> Self {
        Field {
            name: String::from(name),
            field: "character_field".into(),
            primary: true,
        }
    }

    pub fn pk_field() -> Self {
        Field {
            name: "id".into(),
            field: "primary_key_field".into(),
            primary: true,
        }
    }

    pub fn date_field(name: &str) -> Self {
        Field {
            name: String::from(name),
            field: "date_field".into(),
            primary: true,
        }
    }

    pub fn boolean_field(name: &str, primary: bool) -> Self {
        Field {
            name: String::from(name),
            field: "boolean_field".into(),
            primary,
        }
    }

    pub fn dict_field(name: &str, primary: bool) -> Self {
        Field {
            name: String::from(name),
            field: "dict_field".into(),
            primary,
        }
    }

    pub fn translatable_field(name: &str, primary: bool) -> Self {
        Field {
            name: String::from(name),
            field: "translatable_field".into(),
            primary,
        }
    }

    pub fn text_field(name: &str, primary: bool) -> Self {
        Field {
            name: String::from(name),
            field: "text_field".into(),
            primary,
        }
    }

    pub fn choice_field(name: &str, primary: bool) -> Self {
        Field {
            name: String::from(name),
            field: "choice_field".into(),
            primary,
        }
    }

    pub fn cta_field() -> Self {
        Field {
            name: "actions".into(),
            field: "cta_field".into(),
            primary: true,
        }
    }
}
