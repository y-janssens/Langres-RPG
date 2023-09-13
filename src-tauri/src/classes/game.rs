#[allow(dead_code)]

pub mod game {
    use crate::classes::character::character::Character;
    use crate::classes::world::world::World;
    use chrono::{DateTime, Local};
    use clipboard::ClipboardContext;
    use clipboard::ClipboardProvider;
    use dotenv::dotenv;
    use magic_crypt::{new_magic_crypt, MagicCrypt256, MagicCryptTrait};
    use serde::{Deserialize, Serialize};

    #[derive(Debug, Serialize, Deserialize, Clone)]
    pub struct Game {
        player: String,
        id: u32,
        date_created: String,
        last_save_date: Option<String>,
        save_count: i32,
        pub character: Character,
        pub world: World,
    }

    impl Game {
        pub fn new() -> Game {
            Game {
                player: String::new(),
                save_count: 0,
                id: Self::generate_id(),
                date_created: Self::get_date(),
                last_save_date: None,
                world: World::new(50),
                character: Character::new(),
            }
        }

        fn generate_id() -> u32 {
            use rand::Rng;
            let mut rng = rand::thread_rng();
            rng.gen::<u32>()
        }

        fn get_date() -> String {
            let local: DateTime<Local> = Local::now();
            local.to_string()
        }

        pub fn initiate(&mut self, name: String) {
            self.player = name;
            Self::get_date();
        }

        pub fn save(&mut self) -> Result<(), Box<dyn std::error::Error>> {
            self.save_count += 1;
            self.last_save_date = Some(Self::get_date());
            let json = serde_json::to_string_pretty(&self)?;
            let mut file_path = std::path::PathBuf::new();
            file_path.push("../datas/saved");
            file_path.push(format!("{}.json", self.id));
            std::fs::write(&file_path, json)?;
            Ok(())
        }

        pub fn load(id: u32) -> Result<Game, Box<dyn std::error::Error>> {
            let file_name = format!("../datas/saved/{}.json", { &id });
            let json_content = std::fs::read_to_string(file_name)?;
            let saved_game: Game = serde_json::from_str(&json_content)?;
            Ok(saved_game)
        }

        pub fn export(self) -> Result<(), Box<dyn std::error::Error>> {
            let encrypt = Self::encrypt()?;
            let json = serde_json::to_string(&self)?;
            let export = encrypt.encrypt_str_to_base64(json);
            let mut ctx: ClipboardContext = ClipboardProvider::new()?;
            ctx.set_contents(export.to_owned())?;
            Ok(())
        }

        pub fn import(self, data: &str) -> Result<Game, Box<dyn std::error::Error>> {
            let decrypt = Self::encrypt()?;
            let import = decrypt.decrypt_base64_to_string(&data).unwrap();
            let imported_game: Game = serde_json::from_str(&import)?;
            Ok(imported_game)
        }

        pub fn regenerate_world(&mut self) -> Result<(), Box<(dyn std::error::Error + 'static)>> {
            let world = &mut self.world;
            World::regenerate(world);
            return Self::save(self);
        }

        fn encrypt() -> Result<MagicCrypt256, Box<dyn std::error::Error>> {
            dotenv().ok();
            let key = std::env::var("KEY").unwrap();
            Ok(new_magic_crypt!(key, 256))
        }
    }
}
