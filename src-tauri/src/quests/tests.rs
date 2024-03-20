#[cfg(test)]
mod tests {
    use crate::config::conf::test_conf::allow_db_access;
    use crate::config::factories::factories_definitions::QuestFactory;
    use crate::config::factory::factory_models::Factory;
    use crate::quests::models::Quest;

    #[test]
    fn test_load_quests() {
        allow_db_access(|connection| {
            let quest = QuestFactory.generate();
            let _ = Quest::save(quest, connection);
            let result = Quest::load(connection).unwrap();

            assert_eq!(result.len(), 1);
        });
    }

    #[test]
    fn test_patch_quest() {
        allow_db_access(|connection| {
            let quest = QuestFactory.generate();
            let _ = Quest::save(quest, connection);
            let result = Quest::load(connection).unwrap();

            let mut patch_quest = Quest {
                id: result[0].id,
                name: result[0].clone().name,
                description: result[0].clone().description,
                primary: result[0].clone().primary,
                status: result[0].clone().status,
                visible: result[0].clone().visible,
            };

            patch_quest.visible = true;

            let _ = Quest::save(patch_quest, connection);
            let patch_result = Quest::load(connection).unwrap();

            assert_eq!(patch_result[0].visible, true);
        });
    }

    #[test]
    fn test_delete_quest() {
        allow_db_access(|connection| {
            let quest = QuestFactory.generate();
            let _ = Quest::save(quest, connection);
            let result = Quest::load(connection).unwrap();

            let delete = Quest::delete(result[0].id, connection);

            assert!(delete.is_ok());
        });
    }
}
