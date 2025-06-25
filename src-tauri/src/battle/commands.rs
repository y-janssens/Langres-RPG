use diesel::{r2d2::ConnectionManager, SqliteConnection};

use super::models::BattleSystem;
use crate::{
    backend::{
        database::{authenticated_command, get_connection},
        permissions::models::Permission,
        response::Response,
        utils::errors::ValidationError,
    },
    character::models::Character,
    npcs::models::Npc,
};

#[tauri::command]
pub fn start_battle(
    connection: tauri::State<r2d2::Pool<ConnectionManager<SqliteConnection>>>,
    character: Character,
    npc: Npc,
) -> Result<Response, ValidationError> {
    let mut connection = get_connection(connection);
    authenticated_command(Permission::RegularUser, || {
        let mut battle_system = BattleSystem::initialize(character, npc, &mut connection)?;
        battle_system.start_default()?;
        Ok(battle_system)
    })
}

#[tauri::command]
pub fn battle_action(
    mut system: BattleSystem,
    action_str: &str,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        system.action(action_str)?;
        Ok(system)
    })
}

#[tauri::command]
pub fn battle_object(
    mut system: BattleSystem,
    object_str: &str,
) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        system.object(object_str)?;
        Ok(system)
    })
}

#[tauri::command]
pub fn evaluate_battle_atb(mut system: BattleSystem) -> Result<Response, ValidationError> {
    authenticated_command(Permission::RegularUser, || {
        let current = system.current;
        Ok(system.cta.evaluate(current))
    })
}
