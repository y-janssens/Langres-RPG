#[allow(dead_code)]
use crate::classes::app::app::App;

pub fn load_app() -> Result<App, Box<dyn std::error::Error>> {
    let load = App::load()?;
    Ok(load)
}

pub fn save_app(mut data: App) -> Result<(), Box<dyn std::error::Error>> {
    let _save = App::save(&mut data)?;
    Ok(())
}
