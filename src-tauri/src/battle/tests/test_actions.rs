#[cfg(test)]
mod tests {
    use rstest::*;

    use crate::battle::tests::test_utils::helpers::setup_battle_system_with_aps;
    use crate::battle::{
        actions::Action, logs::LogType, settings::TamperMode, tests::test_utils::helpers::setup_battle_system,
        tests::test_utils::helpers::with_tampering, types::BattleState, types::Operator,
    };
    use crate::{
        backend::{
            conf_tests::database::{allow_db_access, with_permissions},
            permissions::models::Permission,
        },
        battle::alterations::Alteration,
    };

    #[rstest]
    #[case("pass", Action::Pass)]
    #[case("flee", Action::Flee)]
    #[case("init", Action::Init)]
    #[case("pray", Action::Pray)]
    #[case("parry", Action::Parry)]
    #[case("dodge", Action::Dodge)]
    #[case("shoot", Action::Shoot)]
    #[case("expose", Action::Expose)]
    #[case("attack", Action::Attack)]
    #[case("protect", Action::Protect)]
    #[case("counter_attack", Action::CounterAttack)]
    async fn test_resolve_action(#[case] action_str: &str, #[case] result: Action) {
        let action = Action::resolve(action_str);
        assert!(action.is_ok_and(|res| res == result));
    }

    #[test]
    fn test_resolve_action_error() {
        let action = Action::resolve("");
        assert!(action.is_err());
    }

    #[test]
    fn test_action_availability_none() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let system = setup_battle_system_with_aps(connection, 0);
                let actions = system.datas.actions;

                assert!(actions.iter().filter(|ac| ac.cost > 0).all(|it| it.disabled));
            });
        });
    }

    #[test]
    fn test_action_availability_all() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let system = setup_battle_system_with_aps(connection, 8);
                let actions = system.datas.actions;

                assert!(!actions.iter().all(|it| it.disabled));
            });
        });
    }

    #[test]
    fn test_action_availability() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let system = setup_battle_system_with_aps(connection, 2);
                let actions = system.datas.actions;

                assert!(actions.iter().filter(|ac| ac.cost > 2).all(|it| it.disabled));

                assert!(!actions.iter().filter(|ac| ac.cost < 2).all(|it| it.disabled));
            });
        });
    }

    #[rstest]
    #[case("pass", Action::Pass)]
    #[case("flee", Action::Flee)]
    #[case("init", Action::Init)]
    #[case("pray", Action::Pray)]
    #[case("parry", Action::Parry)]
    #[case("dodge", Action::Dodge)]
    #[case("shoot", Action::Shoot)]
    #[case("expose", Action::Expose)]
    #[case("attack", Action::Attack)]
    #[case("protect", Action::Protect)]
    #[case("counter_attack", Action::CounterAttack)]
    async fn test_apply_action(#[case] action_str: &str, #[case] result: Action) {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system(connection);

                let battle = system.start_initiative();
                assert!(battle.is_ok());

                let action = system.trigger_player_action(action_str);
                assert!(action.is_ok());

                let action_log = &system.history[2];

                assert_eq!(action_log.action, Some(result));
                assert_eq!(action_log.initiator, Operator::Character);
            });
        });
    }

    #[test]
    fn test_apply_stand() {
        let act = Action::Pass;
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system(connection);

                let battle = system.start_initiative();
                assert!(battle.is_ok());

                let action = system.trigger_player_action(&act.to_string());
                assert!(action.is_ok());

                let roll_log = system.history[2].clone();

                assert_eq!(roll_log.action, Some(act));
            });
        });
    }

    #[test]
    fn test_apply_attack_success() {
        let act = Action::Attack;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("success".to_string()));

                    assert_eq!(result_log.action, Some(Action::Parry));
                });
            });
        });
    }

    #[test]
    fn test_apply_attack_failure() {
        let act = Action::Attack;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Failure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("failure".to_string()));
                });
            });
        });
    }

    #[test]
    fn test_apply_attack_critical_success() {
        let act = Action::Attack;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::CriticalSuccess, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let alteration_log = system.history[3].clone();
                    let result_log = system.history[4].clone();
                    let damages_log = system.history[5].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("critical_success".to_string()));
                    assert_eq!(alteration_log.r#type, LogType::Alteration);
                    assert_eq!(alteration_log.alteration, Some(Alteration::Bleed));
                    assert_eq!(result_log.r#type, LogType::Location);
                    assert_eq!(damages_log.r#type, LogType::Damage);
                });
            });
        });
    }

    #[test]
    fn test_apply_attack_critical_failure() {
        let act = Action::Attack;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::CriticalFailure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("critical_failure".to_string()));
                    assert_eq!(result_log.initiator, Operator::Npc);
                    assert_eq!(result_log.action, Some(Action::CounterAttack));
                });
            });
        });
    }

    #[test]
    fn test_apply_flee_success() {
        let act = Action::Flee;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.initiator, Operator::Character);
                    assert_eq!(result_log.initiator, Operator::default());
                    assert_eq!(result_log.event, "Battle over");
                    assert_eq!(system.state, BattleState::Ended);
                });
            });
        });
    }

    #[test]
    fn test_apply_flee_failure() {
        let act = Action::Flee;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Failure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.initiator, Operator::Character);
                    assert_eq!(result_log.initiator, Operator::Npc);
                    assert_eq!(result_log.action, Some(Action::Attack));
                });
            });
        });
    }

    #[test]
    fn test_apply_counter_attack_success() {
        let act = Action::CounterAttack;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();
                    let damages_log = system.history[4].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("success".to_string()));
                    assert_eq!(result_log.r#type, LogType::Location);
                    assert_eq!(damages_log.r#type, LogType::Damage);
                });
            });
        });
    }

    #[test]
    fn test_apply_counter_attack_failure() {
        let act = Action::CounterAttack;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Failure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("failure".to_string()));
                });
            });
        });
    }

    #[test]
    fn test_apply_parry_success() {
        let act = Action::Parry;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();
                    let damages_log = system.history[4].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("success".to_string()));
                    assert_eq!(result_log.r#type, LogType::Location);
                    assert_eq!(damages_log.r#type, LogType::Damage);
                    assert!(system.character.pv < system.character.max_pv);
                });
            });
        });
    }

    #[test]
    fn test_apply_parry_failure() {
        let act = Action::Parry;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Failure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();
                    let damages_log = system.history[4].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("failure".to_string()));
                    assert_eq!(result_log.r#type, LogType::Location);
                    assert_eq!(damages_log.r#type, LogType::Damage);
                    assert!(system.character.pv < system.character.max_pv);
                });
            });
        });
    }

    #[test]
    fn test_apply_dodge_success() {
        let act = Action::Dodge;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("success".to_string()));
                });
            });
        });
    }

    #[test]
    fn test_apply_dodge_failure() {
        let act = Action::Dodge;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Failure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();
                    let damages_log = system.history[4].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("failure".to_string()));
                    assert_eq!(result_log.r#type, LogType::Location);
                    assert_eq!(damages_log.r#type, LogType::Damage);
                    assert!(system.character.pv < system.character.max_pv);
                });
            });
        });
    }

    #[test]
    fn test_apply_shoot_success() {
        let act = Action::Shoot;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();
                    let damages_log = system.history[4].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("success".to_string()));
                    assert_eq!(result_log.r#type, LogType::Location);
                    assert_eq!(damages_log.r#type, LogType::Damage);
                    assert!(system.npc.pv < system.npc.max_pv);
                });
            });
        });
    }

    #[test]
    fn test_apply_shoot_failure() {
        let act = Action::Shoot;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Failure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("failure".to_string()));
                });
            });
        });
    }

    #[test]
    fn test_apply_shoot_critical_failure() {
        let act = Action::Shoot;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::CriticalFailure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action(&act.to_string());
                    assert!(action.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();

                    assert_eq!(roll_log.action, Some(act));
                    assert_eq!(roll_log.roll, Some("critical_failure".to_string()));
                    assert_eq!(result_log.initiator, Operator::Npc);
                    assert_eq!(result_log.action, Some(Action::CounterAttack));
                });
            });
        });
    }
}
