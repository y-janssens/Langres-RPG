#[cfg(test)]
mod tests {
    use rstest::rstest;

    use crate::backend::{
        permissions::models::Permission,
        tests::database::{allow_db_access, with_permissions},
    };
    use crate::battle::{
        settings::TamperMode, tests::test_utils::helpers::setup_battle_system,
        tests::test_utils::helpers::with_tampering, types::Operator,
    };

    #[test]
    fn test_default_cta() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let system = setup_battle_system(connection);

                assert!(system.cta.is_empty());
            });
        });
    }

    #[test]
    fn test_init_cta() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system(connection);

                let battle = system.start_default();
                assert!(battle.is_ok());

                assert!(!system.cta.is_empty());
                assert_eq!(system.cta.len(), 10);
            });
        });
    }

    #[rstest]
    #[case(Operator::Character, Operator::Npc)]
    #[case(Operator::Npc, Operator::Character)]
    async fn test_evaluate_cta(#[case] current: Operator, #[case] result: Operator) {
        allow_db_access(|connection| {
            let mut system = setup_battle_system(connection);

            let evaluation = system.cta.evaluate(current);
            assert_eq!(evaluation[0].operator, result);
        });
    }

    #[rstest]
    // Will cause Character to attack, opening counter action for Npc, giving hand to Character again
    #[case(TamperMode::Success, Operator::Character)]
    // Will cause Character to attack, opening counter action for Npc, giving hand to Character again
    #[case(TamperMode::CriticalSuccess, Operator::Character)]
    // Will cause Npc to attack and fail, giving hand to Character
    #[case(TamperMode::Failure, Operator::Character)]
    // Will cause Npc to attack and fail, Character counter attack doesn't account, giving hand to Character
    #[case(TamperMode::CriticalFailure, Operator::Character)]
    async fn test_allocate_cta(#[case] tampering: TamperMode, #[case] result: Operator) {
        with_tampering(tampering.clone(), || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system(connection);

                let battle = system.start_default();
                assert!(battle.is_ok());

                assert!(!system.cta.is_empty());
                assert_eq!(system.cta.len(), 10);
                assert_eq!(system.cta[0].operator, result);
            });
        });
    }
}
