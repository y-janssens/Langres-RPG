#[cfg(test)]
mod tests {
    use crate::app::models::App;
    use crate::settings::tests::database::allow_db_access;

    #[test]
    fn test_load_application_datas() {
        allow_db_access(|connection| {
            let response = App::load(connection).unwrap();

            assert_eq!(response.language, "en");
            assert!(response.sound);
            assert_eq!(response.volume, 100);
            assert_eq!(response.music, 100);
        });
    }

    #[test]
    fn test_patch_application_datas() {
        allow_db_access(|connection| {
            let settings = App::load(connection).unwrap();
            let patch_datas = App {
                id: settings.id,
                language: "en".to_string(),
                languages: settings.languages,
                sound: true,
                volume: 100,
                music: 100,
            };

            let _ = App::save(settings.id, patch_datas, connection);
            let patch_response = App::load(connection).unwrap();

            assert_eq!(patch_response.language, "en");
            assert!(patch_response.sound);
            assert_eq!(patch_response.volume, 100);
            assert_eq!(patch_response.music, 100);
        });
    }
}
