use crate::schema::loot::dsl::*;
use crate::{backend::utils::models::Dice, schema::loot};
use diesel::{
    deserialize::Queryable, prelude::*, result::Error, sqlite::Sqlite, RunQueryDsl,
    SqliteConnection,
};
use serde::{Deserialize, Serialize};
use strum_macros::{Display, EnumIter, EnumString};
use uuid::Uuid;

use crate::backend::translations::models::Translations;

#[derive(
    Debug, Serialize, Deserialize, Clone, PartialEq, Eq, Hash, Display, EnumString, EnumIter,
)]
#[strum(serialize_all = "snake_case")]
pub enum ItemTypes {
    Gold,
    Weapon,
    Equipment,
    Craftable,
    Thrash,
    Consumable,
}

impl ItemTypes {
    pub fn resolve(kind: &str) -> Self {
        match kind {
            "weapon" => Self::Weapon,
            "armor" | "equipment" => Self::Equipment,
            "craftable" => Self::Craftable,
            "consumable" => Self::Consumable,
            "thrash" => Self::Thrash,
            "gold" => Self::Gold,
            _ => Self::Weapon,
        }
    }

    pub fn default_armor(&self) -> Option<i32> {
        match self {
            Self::Gold => None,
            Self::Weapon => None,
            Self::Equipment => Some(10),
            Self::Craftable => None,
            Self::Thrash => None,
            Self::Consumable => None,
        }
    }

    pub fn default_damage(&self) -> Option<i32> {
        match self {
            Self::Gold => None,
            Self::Weapon => Some(14),
            Self::Equipment => None,
            Self::Craftable => None,
            Self::Thrash => None,
            Self::Consumable => None,
        }
    }

    pub fn default_parade(&self) -> Option<i32> {
        match self {
            Self::Gold => None,
            Self::Weapon => Some(10),
            Self::Equipment => Some(10),
            Self::Craftable => None,
            Self::Thrash => None,
            Self::Consumable => None,
        }
    }

    pub fn default_random(&self) -> Option<i32> {
        match self {
            Self::Gold => None,
            Self::Weapon => Some(6),
            Self::Equipment => None,
            Self::Craftable => None,
            Self::Thrash => None,
            Self::Consumable => None,
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, PartialEq, Eq, Hash)]
#[diesel(table_name = crate::schema::loot)]
#[diesel(check_for_backend(Sqlite))]
pub struct Loot {
    pub id: String,
    pub item_type: ItemTypes,
    pub name: Translations,
    pub description: Translations,
    pub armor: Option<i32>,
    pub damage: Option<i32>,
    pub random: Option<i32>,
    pub parade: Option<i32>,
    pub price: Option<i32>,
    pub weight: Option<i32>,
}

impl Loot {
    pub fn resolve_damages(&self) -> i32 {
        let mut dmg = self.damage.unwrap_or(0);
        if let Some(rand) = self.random {
            dmg += Dice::roll(rand as u32) as i32;
        }
        dmg
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::loot)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableLoot {
    pub id: String,
    pub item_type: String,
    pub name: String,
    pub description: String,
    pub armor: Option<i32>,
    pub damage: Option<i32>,
    pub random: Option<i32>,
    pub parade: Option<i32>,
    pub price: Option<i32>,
    pub weight: Option<i32>,
}

impl Loot {
    pub fn new(kind: &str) -> Loot {
        let _type = ItemTypes::resolve(kind);
        Loot {
            id: Uuid::new_v4().to_string(),
            item_type: _type.clone(),
            name: Translations::new(),
            description: Translations::new(),
            armor: ItemTypes::default_armor(&_type),
            damage: ItemTypes::default_damage(&_type),
            parade: ItemTypes::default_parade(&_type),
            random: ItemTypes::default_random(&_type),
            price: Some(1),
            weight: Some(1),
        }
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Self>> {
        let _load = crate::schema::loot::table.load(connection)?;
        Ok(_load)
    }

    pub fn save(self, connection: &mut SqliteConnection) -> Result<(), Error> {
        let item_type_json = serde_json::to_string(&self.item_type)
            .map_err(|e| Error::DeserializationError(Box::new(e)))?;
        let name_json = serde_json::to_string(&self.name)
            .map_err(|e| Error::DeserializationError(Box::new(e)))?;
        let description_json = serde_json::to_string(&self.description)
            .map_err(|e| Error::DeserializationError(Box::new(e)))?;

        let insertable = InsertableLoot {
            id: Uuid::new_v4().to_string(),
            item_type: item_type_json,
            name: name_json,
            description: description_json,
            armor: self.armor,
            damage: self.damage,
            random: self.random,
            parade: self.parade,
            price: self.price,
            weight: self.weight,
        };

        let exists = loot
            .filter(id.eq(self.clone().id))
            .first::<Loot>(connection)
            .is_ok();

        if exists {
            diesel::update(loot.find(self.id))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(loot::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn delete(_id: String, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(loot.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }

    pub fn gold(value: i32) -> Loot {
        Loot {
            id: Uuid::new_v4().to_string(),
            item_type: ItemTypes::Gold,
            name: Translations::blank(),
            description: Translations::blank(),
            armor: None,
            damage: None,
            random: None,
            parade: None,
            price: Some(value),
            weight: None,
        }
    }
}
