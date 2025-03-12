use diesel::{prelude::*, sqlite::Sqlite};
use serde::{Deserialize, Serialize};
use std::ops::{Deref, DerefMut};

use crate::{
    backend::permissions::models::{Config, Credentials},
    game::models::Game,
    schema::settings::dsl::*,
};

#[derive(Debug, Clone, Serialize, Deserialize, Queryable)]
pub struct Values {
    pub key: String,
    pub value: String,
}

#[derive(Debug, Clone, Serialize, Deserialize, Queryable)]
pub struct Languages(pub Vec<Values>);

#[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
#[diesel(table_name = crate::schema::settings)]
#[diesel(check_for_backend(Sqlite))]
pub struct ApplicationSettings {
    pub id: i32,
    pub language: String,
    pub languages: Languages,
    pub sound: bool,
    pub volume: i32,
    pub music: i32,
}

impl ApplicationSettings {
    pub fn load(connection: &mut SqliteConnection) -> QueryResult<ApplicationSettings> {
        let _load = crate::schema::settings::table.first(connection)?;
        Ok(_load)
    }

    pub fn save(
        _id: i32,
        data: ApplicationSettings,
        connection: &mut SqliteConnection,
    ) -> QueryResult<usize> {
        let languages_json = serde_json::to_string(&data.languages.0).map_err(|e| {
            diesel::result::Error::DatabaseError(
                diesel::result::DatabaseErrorKind::UnableToSendCommand,
                Box::new(e.to_string()),
            )
        })?;

        diesel::update(settings.find(_id))
            .set((
                id.eq(_id),
                language.eq(&data.language),
                languages.eq(&languages_json),
                sound.eq(data.sound),
                volume.eq(data.volume),
                music.eq(data.music),
            ))
            .execute(connection)
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Func {
    r#type: Option<String>,
    value: String,
}

impl Func {
    fn new(r#type: Option<&str>, value: &str) -> Self {
        Self {
            r#type: r#type.map(|s| s.to_string()),
            value: value.to_string(),
        }
    }
}

pub struct MenuOrdering {
    current: u8,
}

impl Default for MenuOrdering {
    fn default() -> Self {
        Self::new()
    }
}

impl MenuOrdering {
    pub fn new() -> Self {
        Self { current: 0 }
    }

    pub fn next_item(&mut self) -> u8 {
        let current_order = self.current;
        self.current += 1;
        current_order
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Menu {
    pub order: u8,
    name: String,
    func: Option<Func>,
}

impl Menu {
    fn new(order: u8, name: &str, func: Option<Func>) -> Self {
        Self {
            order,
            name: name.to_string(),
            func,
        }
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub struct ApplicationMenu(Vec<Menu>);

impl Deref for ApplicationMenu {
    type Target = Vec<Menu>;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl DerefMut for ApplicationMenu {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

impl ApplicationMenu {
    fn new() -> Self {
        Self(vec![])
    }
    pub fn load_main_menu(connection: &mut SqliteConnection) -> Self {
        let mut menu = Self::new();
        let mut order = MenuOrdering::new();
        let credentials = Credentials::initialize().config;
        let games = Game::fetch(connection).expect("Failed to load games");

        menu.add_main_menu_items(&mut order, games);
        menu.add_common_items(&mut order);
        menu.add_admin_menu_items(&credentials, &mut order);
        menu.add_item(&mut order, "exit", Some(Func::new(Some("exit"), "/")));

        menu
    }

    pub fn load_ingame_menu() -> Self {
        let mut menu = Self::new();
        let mut order = MenuOrdering::new();

        menu.add_ingame_items(&mut order);
        menu.add_common_items(&mut order);
        menu.add_item(&mut order, "exit-game", Some(Func::new(Some("exit"), "/")));

        menu
    }

    fn add_item(&mut self, order: &mut MenuOrdering, name: &str, func: Option<Func>) {
        self.push(Menu::new(order.next_item(), name, func))
    }

    fn add_common_items(&mut self, order: &mut MenuOrdering) {
        self.add_item(
            order,
            "settings",
            Some(Func::new(Some("popup"), "settings")),
        )
    }

    fn add_ingame_items(&mut self, order: &mut MenuOrdering) {
        self.add_item(order, "continue", Some(Func::new(None, "continue")));
        self.add_item(order, "save", Some(Func::new(None, "save")));
    }

    fn add_main_menu_items(&mut self, order: &mut MenuOrdering, games: Vec<Game>) {
        let last_played_game = games
            .iter()
            .find(|g| g.visible && !g.last_save_date.is_empty());

        if let Some(game) = last_played_game {
            self.add_item(order, "continue", Some(Func::new(None, &game.id)));
        }

        if !games.is_empty() {
            self.add_item(order, "load", Some(Func::new(Some("popup"), "saved_games")));
        }

        if games.len() < 3 {
            self.add_item(order, "new", Some(Func::new(Some("popup"), "new_game")));
        }
    }

    fn add_admin_menu_items(&mut self, credentials: &Config, order: &mut MenuOrdering) {
        if !credentials.is_admin {
            return;
        }

        if credentials.editor_enabled {
            self.add_item(order, "builder", Some(Func::new(Some("link"), "editor")));
        }
        if credentials.dev_tools_enabled {
            self.add_item(order, "tools", Some(Func::new(Some("link"), "tools")));
        }
        if credentials.dashboard_enabled {
            self.add_item(
                order,
                "dashboard",
                Some(Func::new(Some("link"), "dashboard")),
            );
        }
    }
}
