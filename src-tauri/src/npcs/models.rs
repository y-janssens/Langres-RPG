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

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
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

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable, Insertable, AsChangeset)]
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
    pub fn new(_map_id: i32, position: (f32, f32, u32)) -> Result<Npc, Error> {
        Ok(Npc {
            id: Uuid::new_v4().to_string(),
            first_name: "".to_string(),
            last_name: "".to_string(),
            title: Translations::blank(),
            class: Class::Zombie,
            end: 8,
            r#for: 8,
            hab: 8,
            cha: 8,
            int: 8,
            ini: 8,
            pv: 60,
            level: 1,
            gender: Gender::Unknown,
            map_id: _map_id,
            unique: false,
            hostile: true,
            is_alive: true,
            r#static: false,
            can_be_hostile: true,
            inventory: Inventory::empty(),
            quests: NpcQuests::empty(),
            dialogs: NpcDialogs::empty(),
            starting_point: Position::resolve(position),
        })
    }

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
        let _npc = &mut self.clone();

        if !_npc.unique {
            _npc.title = Translations::blank();
            _npc.inventory = Inventory::empty();
            _npc.quests = NpcQuests::empty();
            _npc.dialogs = NpcDialogs::empty();
        }

        if _npc.hostile {
            _npc.can_be_hostile = true;
        }

        let title_json = to_json(&_npc.title)?;
        let class_json = to_json(&_npc.class)?;
        let inventory_json = to_json(&_npc.inventory)?;
        let gender_json = to_json(&_npc.gender)?;
        let quests_json = to_json(&_npc.quests)?;
        let dialogs_json = to_json(&_npc.dialogs)?;
        let starting_point_json = to_json(&_npc.starting_point)?;

        let insertable = InsertableNpc {
            id: _npc.id.clone(),
            first_name: _npc.first_name.clone(),
            last_name: _npc.last_name.clone(),
            title: title_json,
            class: class_json,
            end: _npc.end,
            r#for: _npc.r#for,
            hab: _npc.hab,
            cha: _npc.cha,
            int: _npc.int,
            ini: _npc.ini,
            pv: _npc.pv,
            level: _npc.level,
            gender: gender_json,
            map_id: _npc.map_id,
            unique: _npc.unique,
            r#static: _npc.r#static,
            hostile: _npc.hostile,
            is_alive: _npc.is_alive,
            can_be_hostile: _npc.can_be_hostile,
            inventory: inventory_json,
            quests: quests_json,
            dialogs: dialogs_json,
            starting_point: starting_point_json,
        };

        let exists = npc
            .filter(id.eq(_npc.id.clone()))
            .first::<Npc>(connection)
            .is_ok();

        if exists {
            diesel::update(npc.find(_npc.id.clone()))
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
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct NpcQuests(pub Vec<Quest>);

impl NpcQuests {
    pub fn empty() -> NpcQuests {
        NpcQuests(vec![])
    }
}
