use crate::schema::games;
use crate::schema::games::dsl::*;
use chrono::{DateTime, Local};
use diesel::prelude::*;
use rand::seq::SliceRandom;
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::backend::permissions::models::Credentials;
use crate::backend::settings::errors::BASE_ERROR;
use crate::backend::utils::models::FrustumCullingUtility;
use crate::character::models::Character;
use crate::player::achievements::models::PlayerAchievement;
use crate::player::journal::models::PlayerJournal;
use crate::player::quests::models::PlayerQuest;
use crate::player::statistics::models::PlayerStatistic;
use crate::storyline::models::Story;
use crate::world::models::{Item, World};

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

        let character_json = serde_json::to_string(&self.character).expect(BASE_ERROR);
        let storyline_json = serde_json::to_string(&self.storyline).expect(BASE_ERROR);
        let last_known_position_json =
            serde_json::to_string(&self.last_known_position).expect(BASE_ERROR);

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
        let credentials = Credentials::initialize().config;
        let _games = if credentials.is_admin {
            crate::schema::games::table.load(connection)?
        } else {
            crate::schema::games::table
                .filter(visible.eq(true))
                .load(connection)?
        };
        Ok(_games)
    }

    pub fn delete(_id: String, connection: &mut SqliteConnection) -> QueryResult<()> {
        diesel::delete(games.filter(id.eq(_id))).execute(connection)?;
        Ok(())
    }

    pub fn patch_game_storyline(&mut self, connection: &mut SqliteConnection) {
        let story = Story::load(connection).expect("Failed to load storyline");
        println!("GameId: {} - Patching storyline", self.id);

        let (current_item, current_map, current_act) = self
            .storyline
            .story
            .acts
            .iter()
            .find_map(|act| {
                act.content.maps.iter().find_map(|map| {
                    map.content
                        .iter()
                        .find(|item| {
                            item.id == self.last_known_position.id && !map.complete && map.primary
                        })
                        .map(|item| (item, map, act))
                })
            })
            .unwrap();

        let (storyline_item, storyline_map) = story
            .story
            .acts
            .iter()
            .find_map(|act| {
                act.content.maps.iter().find_map(|map| {
                    map.content
                        .iter()
                        .find(|item| {
                            item.id == self.last_known_position.id
                                && act.id == current_act.id
                                && map.id == current_map.id
                        })
                        .map(|item| (item, map))
                })
            })
            .unwrap();

        if current_item.clone().walkable && !storyline_item.walkable {
            println!("GameId: {} - Relocating character", self.id);
            self.relocate_character(storyline_map.clone());
        }

        for act in self.storyline.story.acts.iter_mut() {
            for map in act.content.maps.iter_mut() {
                if map.id == storyline_map.id {
                    map.content = storyline_map.content.clone();
                }
            }
        }

        let _ = self.save(connection);
    }

    fn relocate_character(&mut self, current_map: World) {
        let current_position = self.last_known_position.id;
        let neighbours = current_map
            .content
            .iter()
            .find(|tile| tile.id == current_position)
            .cloned()
            .map(|t| {
                FrustumCullingUtility::cull_filter(
                    t.id as i32,
                    current_map.size,
                    2_usize,
                    2_usize,
                    current_map.content,
                )
            })
            .unwrap();

        self.get_new_position(neighbours);
    }

    fn get_new_position(&mut self, items: Vec<Item>) {
        let _items: Vec<Item> = items.iter().filter(|i| i.walkable).cloned().collect();
        let new_position = _items.choose(&mut rand::thread_rng()).unwrap();
        self.last_known_position = Position::resolve(Self::resolve_new_position(new_position));
        println!("GameId: {} - New position: {}", self.id, new_position.id);
    }

    /// Convert item's coordinates to game engine coordinates
    fn resolve_new_position(item: &Item) -> (f32, f32, u32) {
        let x = -(item.x as f64) / 1.5 + 0.35;
        let y = if item.y == 0 {
            -(item.y as f64) - 0.5
        } else {
            -(item.y as f64) * (f64::sqrt(3.0) / 1.5) - 0.5
        };
        (x.abs() as f32, y.abs() as f32, item.id)
    }

    pub fn generate_player_datas(&self, connection: &mut SqliteConnection) {
        PlayerQuest::generate(self.id.clone(), connection);
        PlayerAchievement::generate(self.id.clone(), connection);
        PlayerStatistic::generate(self.id.clone(), connection);
    }
}
