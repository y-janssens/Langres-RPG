#[cfg(test)]
mod tests {
    use rstest::rstest;

    use crate::backend::permissions::models::Permission;
    use crate::backend::tests::database::{allow_db_access, with_permissions};
    use crate::battle::actions::Action;
    use crate::battle::logs::LogType;
    use crate::battle::settings::TamperMode;
    use crate::battle::tests::test_utils::helpers::{setup_battle_system, with_tampering};
    use crate::battle::{alterations::Alteration, types::Operator};

    #[rstest]
    #[case(Alteration::Burn)]
    #[case(Alteration::Clear)]
    #[case(Alteration::Bleed)]
    #[case(Alteration::Expose)]
    #[case(Alteration::Protect)]
    #[case(Alteration::Enlighten)]
    async fn test_set_alteration(#[case] alteration: Alteration) {
        allow_db_access(|connection| {
            let mut system = setup_battle_system(connection);

            system.alterations.set(Operator::Character, alteration);

            assert_eq!(system.alterations.get(Operator::Character), alteration);
        });
    }

    #[test]
    fn test_consume_alteration() {
        allow_db_access(|connection| {
            let alteration = Alteration::Burn;
            let operator = Operator::Character;
            let mut system = setup_battle_system(connection);

            system.alterations.set(operator, alteration);
            assert_eq!(system.alterations.get(operator), alteration);

            system.alterations.consume(operator);
            assert_eq!(system.alterations.get(operator), Alteration::Clear);
        });
    }

    #[rstest]
    #[case(Action::Expose, Alteration::Expose)]
    #[case(Action::Pray, Alteration::Enlighten)]
    #[case(Action::Protect, Alteration::Protect)]
    async fn test_apply_alteration_action_success(
        #[case] act: Action,
        #[case] alteration: Alteration,
    ) {
        let result = Alteration::Clear;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    // First roll and apply alteration
                    let action = system.player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("success".to_string()));
                    assert_eq!(result_log.r#type, LogType::Alteration);
                    assert_eq!(result_log.alteration, Some(alteration));
                    assert_eq!(system.alterations.get(Operator::Character), alteration);

                    // Second use and consume
                    let action = system.player_action(&Action::Attack.to_string());
                    assert!(action.is_ok());

                    assert_eq!(system.alterations.get(Operator::Character), result);
                });
            });
        });
    }

    #[rstest]
    #[case(Action::Pray)]
    async fn test_apply_alteration_action_error(#[case] act: Action) {
        let alteration = Alteration::Clear;

        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Failure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("failure".to_string()));
                    assert_ne!(result_log.r#type, LogType::Alteration);
                    assert_eq!(result_log.r#type, LogType::Action);
                    assert_eq!(system.alterations.get(Operator::Character), alteration);
                });
            });
        });
    }
}
