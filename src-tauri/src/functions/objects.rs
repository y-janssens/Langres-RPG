#[allow(dead_code)]
use diesel::{r2d2::ConnectionManager, SqliteConnection};

use crate::models::objects::objects::Function;
use crate::models::objects::objects::Object;

pub fn load_objects(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Vec<Object>, String> {
    let mut connection = connection.get().map_err(|e| e.to_string())?;
    match Object::load(&mut connection) {
        Ok(objects) => Ok(objects),
        Err(err) => Err(err.to_string()),
    }
}

pub fn load_functions(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Result<Vec<Function>, String> {
    let mut connection = connection.get().map_err(|e| e.to_string())?;
    match Function::load(&mut connection) {
        Ok(functions) => Ok(functions),
        Err(err) => Err(err.to_string()),
    }
}
