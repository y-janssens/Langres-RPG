#[allow(dead_code)]
use crate::classes::app::app::App;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

pub fn load_app(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<App, String> {
    let mut connection = connection.get().map_err(|e| e.to_string())?;
    match App::load(&mut connection) {
        Ok(app) => Ok(app),
        Err(err) => Err(err.to_string()),
    }
}

pub fn save_app(
    id: i32,
    data: App,
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<(), Box<dyn std::error::Error>> {
    let mut connection = connection.get().map_err(|e| e.to_string())?;
    let _save = App::save(id, data, &mut connection).expect("Error");
    Ok(())
}
