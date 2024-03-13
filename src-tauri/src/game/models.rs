use crate::character::models::Character;
use crate::config::factory::factory_models::AbstractModel;
use crate::schema::games;
use crate::schema::games::dsl::*;
use crate::storyline::models::Story;
use chrono::{DateTime, Local};
use diesel::deserialize::{self, FromSql};
use diesel::prelude::*;
use diesel::sql_types::Text;
use diesel::sqlite::{Sqlite, SqliteValue};
use serde::{Deserialize, Serialize};

impl AbstractModel for Game {}

#[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
pub struct Position {
    pub x: f32,
    pub y: f32,
    pub id: u32,
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
    pub id: i32,
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
    id: i32,
    player: String,
    date_created: String,
    last_save_date: String,
    save_count: i32,
    character: String,
    storyline: String,
    visible: bool,
    last_known_position: String,
}

impl Game {
    pub fn new(name: String, connection: &mut SqliteConnection) -> Game {
        println!("Generating game data...");

        Game {
            id: Self::generate_id(),
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

    fn generate_id() -> i32 {
        use rand::Rng;
        let mut rng = rand::thread_rng();
        rng.gen_range(1..=i32::MAX)
    }

    fn get_date() -> String {
        let local: DateTime<Local> = Local::now();
        local.to_string()
    }

    pub fn save(
        mut game: Game,
        connection: &mut SqliteConnection,
    ) -> Result<(), diesel::result::Error> {
        game.save_count += 1;
        game.last_save_date = Self::get_date();

        let character_json = serde_json::to_string(&game.character).expect("error");
        let storyline_json = serde_json::to_string(&game.storyline).expect("error");
        let last_known_position_json =
            serde_json::to_string(&game.last_known_position).expect("error");

        let insertable = InsertableGame {
            id: game.id,
            player: game.player.clone(),
            date_created: game.date_created.clone(),
            last_save_date: game.last_save_date.clone(),
            save_count: game.save_count,
            character: character_json,
            storyline: storyline_json,
            visible: game.visible,
            last_known_position: last_known_position_json,
        };
        let exists = games
            .filter(id.eq(game.id))
            .first::<Game>(connection)
            .is_ok();

        if exists {
            diesel::update(games.find(game.id))
                .set(&insertable)
                .execute(connection)?;
        } else {
            diesel::insert_into(games::table)
                .values(&insertable)
                .execute(connection)?;
        }

        Ok(())
    }

    pub fn load(_id: i32, connection: &mut SqliteConnection) -> QueryResult<Game> {
        let mut _load: Game = games.find(_id).first(connection)?;
        for act in &mut _load.storyline.story.acts {
            act.validate_acts();
        }
        Ok(_load)
    }

    pub fn fetch(connection: &mut SqliteConnection) -> QueryResult<Vec<Game>> {
        let _load = crate::schema::games::table.load(connection)?;
        Ok(_load)
    }

    pub fn delete(_id: i32, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(games.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }
}
