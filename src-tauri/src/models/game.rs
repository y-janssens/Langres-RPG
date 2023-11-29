#[allow(dead_code)]

pub mod game {
    use crate::models::story::story::Story;
    use crate::schema::games::dsl::*;
    use crate::{models::character::character::Character, schema::games};
    use chrono::{DateTime, Local};
    use diesel::prelude::*;
    use serde::{Deserialize, Serialize};

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable)]
    #[diesel(table_name = crate::schema::games)]
    #[diesel(check_for_backend(Sqlite))]
    pub struct Game {
        id: i32,
        player: String,
        date_created: String,
        last_save_date: String,
        save_count: i32,
        pub character: Character,
        pub storyline: Story,
    }

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable, Insertable)]
    #[diesel(table_name = crate::schema::games)]
    #[diesel(check_for_backend(Sqlite))]
    pub struct InsertableGame {
        id: i32,
        player: String,
        date_created: String,
        last_save_date: String,
        save_count: i32,
        character: String, // JSON string of Character
        storyline: String, // JSON string of Story
    }

    impl Game {
        pub fn new(name: String, story: Story) -> Game {
            println!("Generating game data...");

            Game {
                player: String::from(&name),
                save_count: 0,
                id: Self::generate_id(),
                date_created: Self::get_date(),
                last_save_date: Self::get_date(),
                storyline: story,
                character: Character::new(name),
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

            let insertable = InsertableGame {
                id: game.id,
                player: game.player.clone(),
                date_created: game.date_created.clone(),
                last_save_date: game.last_save_date.clone(),
                save_count: game.save_count,
                character: character_json,
                storyline: storyline_json,
            };
            diesel::insert_into(games::table)
                .values(&insertable)
                .execute(connection)?;

            Ok(())
        }

        pub fn load(_id: i32, connection: &mut SqliteConnection) -> QueryResult<Game> {
            let _load = games.find(_id).first(connection)?;
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
}
