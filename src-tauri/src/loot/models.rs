use crate::schema::loot::dsl::*;
use crate::translations::models::Translations;
use crate::{config::factory::factory_models::AbstractModel, schema::loot};
use diesel::{
    deserialize::Queryable, prelude::*, sql_types::Text, sqlite::Sqlite, RunQueryDsl,
    SqliteConnection,
};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

impl AbstractModel for Loot {}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub enum ItemTypes {
    Gold,
    Weapon,
    Equipment,
    Craftable,
    Thrash,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, PartialEq)]
#[diesel(table_name = crate::schema::loot)]
#[diesel(check_for_backend(Sqlite))]
pub struct Loot {
    pub id: String,
    pub item_type: ItemTypes,
    pub name: Translations,
    pub description: Translations,
    pub armor: Option<i32>,
    pub damage: Option<i32>,
    pub parade: Option<i32>,
    pub price: Option<i32>,
    pub weight: Option<f32>,
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
    pub parade: Option<i32>,
    pub price: Option<i32>,
    pub weight: Option<f32>,
}

impl Queryable<Text, Sqlite> for ItemTypes {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Loot {
    pub fn new(kind: &str) -> Loot {
        let _type = ItemTypes::resolve(kind);
        Loot {
            id: Uuid::new_v4().to_string(),
            item_type: _type.clone(),
            name: Translations::default(),
            description: Translations::default(),
            armor: if _type == ItemTypes::Equipment {
                Some(10)
            } else {
                None
            },
            damage: if _type == ItemTypes::Weapon {
                Some(14)
            } else {
                None
            },
            parade: if _type == ItemTypes::Equipment || _type == ItemTypes::Weapon {
                Some(10)
            } else {
                None
            },
            price: Some(1),
            weight: Some(1.0),
        }
    }

    pub fn load(connection: &mut SqliteConnection) -> QueryResult<Vec<Loot>> {
        let _load = crate::schema::loot::table.load(connection)?;
        Ok(_load)
    }

    pub fn save(
        _item: Loot,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        let item_type_json = serde_json::to_string(&_item.item_type).expect("error");
        let name_json = serde_json::to_string(&_item.name).expect("error");
        let description_json = serde_json::to_string(&_item.description).expect("error");

        let insertable = InsertableLoot {
            id: Uuid::new_v4().to_string(),
            item_type: item_type_json,
            name: name_json,
            description: description_json,
            armor: _item.armor,
            damage: _item.damage,
            parade: _item.parade,
            price: _item.price,
            weight: _item.weight,
        };

        let exists = loot
            .filter(id.eq(_item.clone().id))
            .first::<Loot>(connection)
            .is_ok();

        if exists {
            diesel::update(loot.find(_item.id))
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
}

impl ItemTypes {
    pub fn resolve(kind: &str) -> ItemTypes {
        match kind {
            "weapon" => ItemTypes::Weapon,
            "armor" => ItemTypes::Equipment,
            "craftable" => ItemTypes::Craftable,
            "thrash" => ItemTypes::Thrash,
            "gold" => ItemTypes::Gold,
            _ => ItemTypes::Weapon,
        }
    }
}
