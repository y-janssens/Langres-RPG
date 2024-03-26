use crate::schema::loot::dsl::*;
use crate::{config::factory::factory_models::AbstractModel, schema::loot};
use diesel::{
    deserialize::Queryable, prelude::*, sql_types::Text, sqlite::Sqlite, RunQueryDsl,
    SqliteConnection,
};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

impl AbstractModel for Loot {}
impl AbstractModel for ItemTypes {}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct BaseItem {
    pub name: String,
    pub price: u32,
    pub weight: f32,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct BaseWeapon {
    pub name: String,
    pub damage: u32,
    pub parade: u32,
    pub price: u32,
    pub weight: f32,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct BaseEquipment {
    pub name: String,
    pub armor: u32,
    pub parade: u32,
    pub price: u32,
    pub weight: f32,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub enum ItemTypes {
    Gold(u32, BaseItem),
    Thrash(BaseItem),
    Weapon(BaseWeapon),
    Equipment(BaseEquipment),
    Craftable(BaseItem),
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, PartialEq)]
#[diesel(table_name = crate::schema::loot)]
#[diesel(check_for_backend(Sqlite))]
pub struct Loot {
    pub id: String,
    pub item: ItemTypes,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::loot)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableLoot {
    pub id: String,
    pub item: String,
}

impl Queryable<Text, Sqlite> for ItemTypes {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Loot {
    pub fn new(kind: &str) -> Self {
        Loot {
            id: Uuid::new_v4().to_string(),
            item: match kind {
                "weapon" => ItemTypes::Weapon(BaseWeapon {
                    name: String::from(""),
                    damage: 14,
                    parade: 10,
                    price: 1,
                    weight: 1.0,
                }),
                "armor" => ItemTypes::Equipment(BaseEquipment {
                    name: String::from(""),
                    armor: 14,
                    parade: 10,
                    price: 1,
                    weight: 1.0,
                }),
                "craftable" | "thrash" => ItemTypes::Craftable(BaseItem {
                    name: String::from(""),
                    price: 1,
                    weight: 1.0,
                }),
                _ => panic!("Unknown item kind: {}", kind),
            },
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
        let item_json = serde_json::to_string(&_item.item).expect("error");

        let insertable = InsertableLoot {
            id: Uuid::new_v4().to_string(),
            item: item_json,
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
