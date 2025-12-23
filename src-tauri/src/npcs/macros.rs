use std::io::{Error, ErrorKind::InvalidData};

use diesel::SqliteConnection;
use serde_yaml::{Sequence, Value};
use system_macros::npcs_initial_datas;

use super::models::{Class, Gender, Npc};
use crate::{
    backend::{
        translations::models::Translations,
        utils::parse::{get_boolean_value, get_content, get_mapping, get_numeric_value, get_sequence, get_string_value},
    },
    character::models::Inventory,
    game::models::Position,
    npcs::models::{NpcDialogs, NpcQuests, Quote, QuoteType},
    quests::models::Quest,
};

impl Npc {
    pub fn from_value(content: Sequence) -> Result<Vec<Self>, Error> {
        content.into_iter().map(Self::parse).collect()
    }

    fn parse(content: Value) -> Result<Self, Error> {
        Ok(Self {
            id: get_string_value(&content, "id"),
            first_name: get_string_value(&content, "first_name"),
            last_name: get_string_value(&content, "last_name"),
            end: get_numeric_value(&content, "end") as i32,
            r#for: get_numeric_value(&content, "for") as i32,
            hab: get_numeric_value(&content, "hab") as i32,
            cha: get_numeric_value(&content, "cha") as i32,
            int: get_numeric_value(&content, "int") as i32,
            ini: get_numeric_value(&content, "ini") as i32,
            att: get_numeric_value(&content, "att") as i32,
            par: get_numeric_value(&content, "par") as i32,
            tir: get_numeric_value(&content, "tir") as i32,
            ap: get_numeric_value(&content, "ap") as i32,
            pv: get_numeric_value(&content, "pv") as i32,
            lvl: get_numeric_value(&content, "lvl") as i32,
            max_ap: get_numeric_value(&content, "max_ap") as i32,
            max_pv: get_numeric_value(&content, "max_pv") as i32,
            map_id: get_numeric_value(&content, "map_id") as i32,
            unique: get_boolean_value(&content, "unique"),
            r#static: get_boolean_value(&content, "static"),
            hostile: get_boolean_value(&content, "hostile"),
            is_alive: get_boolean_value(&content, "is_alive"),
            can_be_hostile: get_boolean_value(&content, "can_be_hostile"),
            title: Translations::from_value(get_mapping(&content, "title")?)?,
            class: Class::parse(get_string_value(&content, "class").to_lowercase().as_str())?,
            gender: Gender::parse(get_string_value(&content, "gender").to_lowercase().as_str())?,
            quests: NpcQuests(Quest::from_value(get_sequence(&content, "quests")?.clone())?),
            dialogs: NpcDialogs(Quote::from_value(get_sequence(&content, "dialogs")?)?),
            starting_point: Position::parse(get_mapping(&content, "starting_point")?)?,
            inventory: Inventory::from_value(get_content(&content, "inventory")?)?,
        })
    }

    pub fn get_and_insert_initial_datas(connection: &mut SqliteConnection) -> Result<(), Error> {
        let objects: Vec<Self> = npcs_initial_datas!().map_err(|e| std::io::Error::new(InvalidData, e.to_string()))?;

        for object in objects {
            object
                .save(connection)
                .map_err(|e| std::io::Error::new(InvalidData, e.to_string()))?;
        }

        Ok(())
    }
}

impl Quote {
    pub fn from_value(content: &Sequence) -> Result<Vec<Self>, Error> {
        if content.is_empty() {
            return Ok(vec![]);
        }
        let quotes = content
            .iter()
            .map(|c| Self::parse(c).map_err(|e| Error::new(InvalidData, e)))
            .collect::<Result<Vec<Self>, Error>>()?;
        Ok(quotes)
    }

    fn parse(content: &Value) -> Result<Self, Error> {
        Ok(Self {
            r#type: QuoteType::parse(get_string_value(content, "type").to_lowercase().as_str())?,
            order: get_numeric_value(content, "order") as u8,
            quote: Translations::from_value(get_mapping(content, "quote")?)?,
        })
    }
}
