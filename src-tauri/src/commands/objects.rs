use crate::classes::objects::objects::Function;
use crate::classes::objects::objects::Object;
use crate::functions;
use diesel::r2d2::ConnectionManager;
use diesel::SqliteConnection;

#[tauri::command]
pub fn load_objects(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Object> {
    let _load = functions::objects::load_objects(connection);
    _load.unwrap()
}

#[tauri::command]
pub fn load_functions(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
) -> Vec<Function> {
    let _load = functions::objects::load_functions(connection);
    _load.unwrap()
}
