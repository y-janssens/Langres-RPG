#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]
use std::env;
use tauri::{utils::config::AppUrl, WindowUrl};

mod functions {
    pub mod games;
    pub mod world;
}

mod classes {
    pub mod character;
    pub mod game;
    pub mod inventory;
    pub mod world;
}

mod commands {
    pub mod games;
    pub mod world;
}

fn main() {
    let port = portpicker::pick_unused_port().expect("failed to find unused port");

    let mut context = tauri::generate_context!();
    let url = format!("http://localhost:{}", port).parse().unwrap();
    let window_url = WindowUrl::External(url);
    context.config_mut().build.dist_dir = AppUrl::Url(window_url.clone());

    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![
            commands::games::new,
            commands::games::load_game,
            commands::games::load_saves,
            commands::games::save,
            commands::games::delete,
            commands::world::regenerate
        ])
        .run(context)
        .expect("error while running tauri application");
}
