use crate::{
    backend::{
        database::authenticated_command, permissions::models::Permission, response::Response,
        utils::errors::ValidationError,
    },
    loot::models::Loot,
};

use super::models::{Character, Inventory};

#[tauri::command]
pub fn compute_xp(mut character: Character, xp: i32) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        Ok(Character::compute_xp(&mut character, xp).clone())
    })
}

#[tauri::command]
pub fn add_gold(mut inventory: Inventory, loot: Loot) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        Inventory::add_gold(&mut inventory, loot);
        Ok(())
    })
}

#[tauri::command]
pub fn remove_gold(mut inventory: Inventory, gold: i32) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        Inventory::remove_gold(&mut inventory, gold);
        Ok(())
    })
}

#[tauri::command]
pub fn add_objects(mut inventory: Inventory, loot: Vec<Loot>) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        Inventory::add_objects(&mut inventory, loot);
        Ok(())
    })
}

#[tauri::command]
pub fn remove_object(mut inventory: Inventory, id: String) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        Inventory::remove_object(&mut inventory, id);
        Ok(())
    })
}
