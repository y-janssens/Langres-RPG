#[cfg(test)]
mod tests {
    use crate::{
        backend::{conf_tests::database::allow_db_access, settings::errors::BASE_ERROR},
        quests::models::Quest,
    };
    use core_macros::quests_initial_datas;

    #[test]
    fn test_resolve_quests_from_script() {
        let result = quests_initial_datas!();
        assert!(result.is_ok());
    }

    #[test]
    fn test_resolve_and_insert_quests_from_script() {
        allow_db_access(|connection| {
            let quests: Vec<Quest> = quests_initial_datas!().expect(BASE_ERROR);

            for quest in quests {
                let insertion = quest.save(connection);
                assert!(insertion.is_ok());
            }

            let result = Quest::load(connection);
            assert!(result.is_ok_and(|res| !res.is_empty()));
        });
    }
}
