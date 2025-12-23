#[cfg(test)]
mod tests {
    use chrono::Local;

    use crate::application::models::{ApplicationMenu, ApplicationSettings};
    use crate::backend::conf::factories::factories_definitions::GameFactory;
    use crate::backend::conf::factory::factory_models::ApiFactory;
    use crate::backend::conf_tests::database::{allow_db_access, with_permissions};
    use crate::backend::permissions::models::Permission;
    use crate::backend::settings::errors::BASE_ERROR;

    #[test]
    fn test_load_application_datas() {
        allow_db_access(|connection| {
            let response = ApplicationSettings::load(connection).unwrap();

            assert_eq!(response.language, "en");
            assert!(response.sound);
            assert_eq!(response.volume, 100);
            assert_eq!(response.music, 100);
            assert_eq!(response.difficulty, 0);
            assert!(!response.battle_automatic);
            assert!(!response.battle_realtime);
        });
    }

    #[test]
    fn test_patch_application_datas() {
        allow_db_access(|connection| {
            let settings = ApplicationSettings::load(connection).unwrap();
            let patch_datas = ApplicationSettings {
                language: "en".to_string(),
                sound: true,
                volume: 100,
                music: 100,
                ..settings
            };

            let _ = patch_datas.save(connection);
            let patch_response = ApplicationSettings::load(connection).unwrap();

            assert_eq!(patch_response.language, "en");
            assert!(patch_response.sound);
            assert_eq!(patch_response.volume, 100);
            assert_eq!(patch_response.music, 100);
        });
    }

    #[test]
    fn test_load_ingame_menu() {
        let response = ApplicationMenu::load_ingame_menu();
        assert_eq!(response.len(), 4);
        for i in 0..response.len() {
            assert_eq!(response[i].order, i as u8)
        }
    }

    #[test]
    fn test_load_main_menu_admin() {
        allow_db_access(|connection| {
            with_permissions(Permission::Admin, || {
                let response = ApplicationMenu::load_main_menu(connection).expect(BASE_ERROR);
                assert_eq!(response.len(), 6);
                for i in 0..response.len() {
                    assert_eq!(response[i].order, i as u8)
                }
            });
        });
    }

    #[test]
    fn test_load_main_menu_user() {
        allow_db_access(|connection| {
            with_permissions(Permission::RegularUser, || {
                let response = ApplicationMenu::load_main_menu(connection).expect(BASE_ERROR);
                assert_eq!(response.len(), 3);
                for i in 0..response.len() {
                    assert_eq!(response[i].order, i as u8)
                }
            });
        });
    }

    #[test]
    fn test_load_main_menu_saved_games() {
        allow_db_access(|connection| {
            with_permissions(Permission::RegularUser, || {
                let mut g1 = GameFactory.generate(connection);
                g1.last_save_date = Local::now().to_string();
                let mut g2 = GameFactory.generate(connection);
                let _ = g1.save(connection);
                let _ = g2.save(connection);

                let response = ApplicationMenu::load_main_menu(connection).expect(BASE_ERROR);
                assert_eq!(response.len(), 5);
                for i in 0..response.len() {
                    assert_eq!(response[i].order, i as u8)
                }
            });
        });
    }
}
