use crate::backend::utils::functions::to_json;
use crate::schema::npc;
use crate::schema::npc::dsl::*;
use crate::world::models::World;
use diesel::prelude::AsChangeset;
use diesel::result::Error;
use diesel::sqlite::Sqlite;
use diesel::{
    ExpressionMethods, Insertable, QueryDsl, QueryResult, Queryable, RunQueryDsl, Selectable,
    SqliteConnection,
};
use serde::{Deserialize, Serialize};
use strum_macros::{Display, EnumString};
use uuid::Uuid;

use crate::{
    backend::translations::models::Translations, character::models::Inventory,
    game::models::Position, quests::models::Quest,
};

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum Gender {
    Male,
    Female,
    Unknown,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum Class {
    Human,
    Soldier,
    Zombie,
    Zealot,
    Bandit,
    Priest,
    Merchant,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, Queryable, Selectable)]
#[diesel(table_name = crate::schema::npc)]
#[diesel(check_for_backend(Sqlite))]
pub struct Npc {
    pub id: String,
    pub first_name: String,
    pub last_name: String,
    pub title: Translations,
    pub class: Class,
    pub end: i32,
    #[diesel(column_name = "for_")]
    pub r#for: i32,
    pub hab: i32,
    pub cha: i32,
    pub int: i32,
    pub ini: i32,
    pub pv: i32,
    pub level: i32,
    pub gender: Gender,
    pub map_id: i32,
    pub unique: bool,
    #[diesel(column_name = "static_")]
    pub r#static: bool,
    pub hostile: bool,
    pub is_alive: bool,
    pub can_be_hostile: bool,
    pub inventory: Inventory,
    pub quests: NpcQuests,
    pub dialogs: NpcDialogs,
    pub starting_point: Position,
}

#[derive(
    Debug, Serialize, Deserialize, Clone, PartialEq, Queryable, Selectable, Insertable, AsChangeset,
)]
#[diesel(table_name = crate::schema::npc)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableNpc {
    pub id: String,
    pub first_name: String,
    pub last_name: String,
    pub title: String,
    pub class: String,
    pub end: i32,
    #[diesel(column_name = "for_")]
    pub r#for: i32,
    pub hab: i32,
    pub cha: i32,
    pub int: i32,
    pub ini: i32,
    pub pv: i32,
    pub level: i32,
    pub gender: String,
    pub map_id: i32,
    pub unique: bool,
    #[diesel(column_name = "static_")]
    pub r#static: bool,
    pub hostile: bool,
    pub is_alive: bool,
    pub can_be_hostile: bool,
    pub inventory: String,
    pub quests: String,
    pub dialogs: String,
    pub starting_point: String,
}

impl Npc {
    pub fn get_for_map(_map_id: i32, connection: &mut SqliteConnection) -> QueryResult<Vec<Self>> {
        let npcs: Vec<Npc> = crate::schema::npc::table
            .filter(map_id.eq(&_map_id))
            .load::<Npc>(connection)?;

        Ok(npcs)
    }

    pub fn load(_id: String, connection: &mut SqliteConnection) -> QueryResult<Self> {
        let _npc: Npc = crate::schema::npc::table
            .filter(id.eq(_id))
            .first::<Npc>(connection)?;

        Ok(_npc)
    }

    pub fn save(&self, connection: &mut SqliteConnection) -> Result<(), Error> {
        let title_json = to_json(&Translations::blank())?;
        let class_json = to_json(&self.class)?;
        let inventory_json = to_json(&self.inventory)?;
        let gender_json = to_json(&self.gender)?;
        let quests_json = to_json(&self.quests)?;
        let dialogs_json = to_json(&self.dialogs)?;
        let starting_point_json = to_json(&self.starting_point)?;

        let insertable = InsertableNpc {
            id: self.id.clone(),
            first_name: self.first_name.clone(),
            last_name: self.last_name.clone(),
            title: title_json,
            class: class_json,
            end: self.end,
            r#for: self.r#for,
            hab: self.hab,
            cha: self.cha,
            int: self.int,
            ini: self.ini,
            pv: self.pv,
            level: self.level,
            gender: gender_json,
            map_id: self.map_id,
            unique: self.unique,
            r#static: self.r#static,
            hostile: self.hostile,
            is_alive: self.is_alive,
            can_be_hostile: self.can_be_hostile,
            inventory: inventory_json,
            quests: quests_json,
            dialogs: dialogs_json,
            starting_point: starting_point_json,
        };

        let exists = npc
            .filter(id.eq(self.id.clone()))
            .first::<Npc>(connection)
            .is_ok();

        if exists {
            diesel::update(npc.find(self.id.clone()))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(npc::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn delete(&self, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(npc.filter(id.eq(&self.id))).execute(connection)?;
        Ok(())
    }

    pub fn clear(map: &World, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(npc.filter(map_id.eq(&map.id))).execute(connection)?;
        Ok(())
    }

    pub fn get_zombie(_map_id: i32, position: (f32, f32, u32)) -> Result<Npc, Error> {
        Ok(Npc {
            id: Uuid::new_v4().to_string(),
            first_name: "???".to_string(),
            last_name: "???".to_string(),
            title: Translations::blank(),
            class: Class::Zombie,
            end: 12,
            r#for: 12,
            hab: 12,
            cha: 12,
            int: 12,
            ini: 12,
            pv: 100,
            level: 1,
            gender: Gender::Unknown,
            map_id: _map_id,
            unique: false,
            hostile: true,
            is_alive: true,
            r#static: false,
            can_be_hostile: true,
            inventory: Inventory::basic(vec![]),
            quests: NpcQuests::empty(),
            dialogs: NpcDialogs::empty(),
            starting_point: Position::resolve(position),
        })
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct Quote {
    pub order: u8,
    pub quote: Translations,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct NpcDialogs {
    pub npc: Vec<Quote>,
    pub player: Vec<Quote>,
}

impl NpcDialogs {
    pub fn empty() -> NpcDialogs {
        NpcDialogs {
            npc: vec![],
            player: vec![],
        }
    }

    pub fn get_merchant_dialogs() -> NpcDialogs {
        NpcDialogs {
            npc: vec![
                Quote {
                    order: 0,
                    quote: Translations::generate("Bonjour", "Hello"),
                },
                Quote {
                    order: 1,
                    quote: Translations::generate(
                        "Jetez donc un oeil à mes marchandises!",
                        "Take a look at my goods",
                    ),
                },
            ],
            player: vec![],
        }
    }

    pub fn generate(quotes: Vec<Translations>) -> NpcDialogs {
        let mut result = NpcDialogs {
            npc: vec![],
            player: vec![],
        };

        for (index, quote) in quotes.iter().enumerate() {
            if index % 2 == 0 {
                result.npc.push(Quote {
                    order: index as u8,
                    quote: quote.clone(),
                })
            } else {
                result.player.push(Quote {
                    order: index as u8,
                    quote: quote.clone(),
                })
            }
        }

        result
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct NpcQuests(pub Vec<Quest>);

impl NpcQuests {
    pub fn empty() -> NpcQuests {
        NpcQuests(vec![])
    }

    pub fn get_quests(ids: Option<Vec<String>>) -> NpcQuests {
        let mut result: Vec<Quest> = Vec::new();

        if let Some(ids) = ids {
            let _quests = Quest::load();

            for quest in _quests {
                if ids.contains(&quest.id) {
                    result.push(quest);
                }
            }
        }

        NpcQuests(result)
    }
}
