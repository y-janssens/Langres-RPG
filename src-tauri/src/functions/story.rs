use crate::models::story::story::Story;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

pub fn fetch_storyline(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Story, String> {
    let mut connection = connection.get().map_err(|e| e.to_string())?;
    match Story::load(&mut connection) {
        Ok(story) => Ok(story),
        Err(err) => Err(err.to_string()),
    }
}

pub fn save_storyline(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    data: Story,
    id: u32,
) -> Result<(), String> {
    let mut connection = connection.get().map_err(|e| e.to_string())?;
    match Story::save(&mut connection, id as i32, &data) {
        Ok(rows_affected) => {
            if rows_affected > 0 {
                Ok(())
            } else {
                Err("No rows were updated.".to_string())
            }
        }
        Err(err) => Err(err.to_string()),
    }
}
