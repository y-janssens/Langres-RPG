use crate::character::models::Character;
use crate::settings::factory::factory_models::AbstractModel;
use crate::player::achievements::models::PlayerAchievement;
use crate::player::journal::models::PlayerJournal;
use crate::player::quests::models::PlayerQuest;
use crate::player::statistics::models::PlayerStatistic;
use crate::schema::games;
use crate::schema::games::dsl::*;
use crate::storyline::models::Story;
use chrono::{DateTime, Local};
use diesel::deserialize::{self, FromSql};
use diesel::prelude::*;
use diesel::sql_types::Text;
use diesel::sqlite::{Sqlite, SqliteValue};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

impl AbstractModel for Game {}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, Queryable)]
pub struct Position {
    pub x: f32,
    pub y: f32,
    pub id: u32,
}

impl Position {
    pub fn resolve(args: (f32, f32, u32)) -> Position {
        Position {
            x: args.0,
            y: args.1,
            id: args.2,
        }
    }
}

impl FromSql<Text, Sqlite> for Position {
    fn from_sql(bytes: SqliteValue<'_, '_, '_>) -> deserialize::Result<Self> {
        let tstr = <String as FromSql<Text, Sqlite>>::from_sql(bytes)?;
        serde_json::from_str(&tstr)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

impl Queryable<Text, Sqlite> for Position {
    type Row = String;
    fn build(row: Self::Row) -> Result<Self, Box<dyn std::error::Error + Send + Sync>> {
        serde_json::from_str(&row)
            .map_err(|e| Box::new(e) as Box<dyn std::error::Error + Send + Sync>)
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
#[diesel(table_name = crate::schema::games)]
#[diesel(check_for_backend(Sqlite))]
pub struct Game {
    pub id: String,
    pub player: String,
    pub date_created: String,
    pub last_save_date: String,
    pub save_count: i32,
    pub character: Character,
    pub storyline: Story,
    pub visible: bool,
    pub last_known_position: Position,
}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Insertable, AsChangeset)]
#[diesel(table_name = crate::schema::games)]
#[diesel(check_for_backend(Sqlite))]
pub struct InsertableGame {
    id: String,
    player: String,
    date_created: String,
    last_save_date: String,
    save_count: i32,
    character: String,
    storyline: String,
    visible: bool,
    last_known_position: String,
}

#[derive(Debug, Clone, Serialize)]
pub struct GameDatas {
    pub id: String,
    pub player: String,
    pub date_created: String,
    pub last_save_date: String,
    pub save_count: i32,
    pub character: Character,
    pub storyline: Story,
    pub visible: bool,
    pub last_known_position: Position,
    pub journal: PlayerJournal,
}

impl Game {
    pub fn new(name: String, connection: &mut SqliteConnection) -> Self {
        println!("Generating game data...");

        Game {
            id: Uuid::new_v4().to_string(),
            player: String::from(&name),
            date_created: Self::get_date(),
            last_save_date: Self::get_date(),
            save_count: 0,
            character: Character::new(name),
            storyline: Story::load(connection).unwrap(),
            visible: true,
            last_known_position: Position {
                x: 0.0,
                y: 0.0,
                id: 0,
            },
        }
    }

    fn get_date() -> String {
        let local: DateTime<Local> = Local::now();
        local.to_string()
    }

    pub fn save(&mut self, connection: &mut SqliteConnection) -> Result<(), diesel::result::Error> {
        self.save_count += 1;
        self.last_save_date = Self::get_date();

        let character_json = serde_json::to_string(&self.character).expect("error");
        let storyline_json = serde_json::to_string(&self.storyline).expect("error");
        let last_known_position_json =
            serde_json::to_string(&self.last_known_position).expect("error");

        let insertable = InsertableGame {
            id: self.id.clone(),
            player: self.player.clone(),
            date_created: self.date_created.clone(),
            last_save_date: self.last_save_date.clone(),
            save_count: self.save_count,
            character: character_json,
            storyline: storyline_json,
            visible: self.visible,
            last_known_position: last_known_position_json,
        };
        let exists = games
            .filter(id.eq(self.id.clone()))
            .first::<Game>(connection)
            .is_ok();

        if exists {
            diesel::update(games.find(self.id.clone()))
                .set(&insertable)
                .execute(connection)?;
        } else {
            Self::generate_player_datas(self, connection);
            diesel::insert_into(games::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn compute_character_xp(&mut self, xp: i32, connection: &mut SqliteConnection) {
        self.character.compute_xp(xp as u32);
        let _ = Self::save(self, connection);
    }

    pub fn get(_id: String, connection: &mut SqliteConnection) -> QueryResult<Self> {
        let game: Self = games.find(_id).first(connection)?;
        Ok(game)
    }

    pub fn load(_id: String, connection: &mut SqliteConnection) -> QueryResult<GameDatas> {
        let mut game: Self = games.find(_id).first(connection)?;
        for act in &mut game.storyline.story.acts {
            act.validate_acts();
        }
        let datas = GameDatas {
            id: game.id.clone(),
            player: game.player,
            date_created: game.date_created,
            last_save_date: game.last_save_date,
            save_count: game.save_count,
            character: game.character,
            storyline: game.storyline,
            visible: game.visible,
            last_known_position: game.last_known_position,
            journal: PlayerJournal::load(game.id, connection)
                .expect("Failed to fetch player journal"),
        };
        Ok(datas)
    }

    pub fn fetch(connection: &mut SqliteConnection) -> QueryResult<Vec<Self>> {
        let _load = crate::schema::games::table.load(connection)?;
        Ok(_load)
    }

    pub fn delete(_id: String, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(games.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }

    pub fn generate_player_datas(&self, connection: &mut SqliteConnection) {
        PlayerQuest::generate(self.id.clone(), connection);
        PlayerAchievement::generate(self.id.clone(), connection);
        PlayerStatistic::generate(self.id.clone(), connection);
    }
}
