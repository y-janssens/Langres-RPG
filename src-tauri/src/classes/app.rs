#[allow(dead_code)]

pub mod app {
    use crate::schema::settings::dsl::*;
    use diesel::{prelude::*, sqlite::Sqlite};
    use serde::{Deserialize, Serialize};

    #[derive(Debug, Serialize, Deserialize, Clone, Queryable, Selectable)]
    #[diesel(table_name = crate::schema::settings)]
    #[diesel(check_for_backend(Sqlite))]
    pub struct App {
        id: i32,
        language: String,
        sound: bool,
        volume: i32,
        music: i32,
    }

    impl App {
        pub fn load(connection: &mut SqliteConnection) -> QueryResult<App> {
            let _load = crate::schema::settings::table.first(connection)?;
            Ok(_load)
        }

        pub fn save(_id: i32, data: App, connection: &mut SqliteConnection) -> QueryResult<usize> {
            diesel::update(settings.find(_id))
                .set((
                    id.eq(_id),
                    language.eq(&data.language),
                    sound.eq(data.sound),
                    volume.eq(data.volume),
                    music.eq(data.music),
                ))
                .execute(connection)
        }
    }
}
