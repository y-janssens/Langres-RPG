#[cfg(test)]
mod tests {
    use rstest::*;

    use crate::application::models::ApplicationSettings;
    use crate::backend::conf_tests::database::allow_db_access;
    use crate::backend::settings::variables::BATTLE_SYSTEM_BASE_DAMAGES;
    use crate::backend::{conf_tests::database::with_permissions, permissions::models::Permission};
    use crate::battle::actions::Action;
    use crate::battle::alterations::Alteration;
    use crate::battle::logs::LogType;
    use crate::battle::objects::Object;
    use crate::battle::settings::{BattleDifficulty, TamperMode};
    use crate::battle::tests::test_utils::helpers::{setup_battle_system, with_tampering};
    use crate::battle::types::{BattleState, Operator};
    use crate::character::models::Inventory;

    #[rstest]
    #[case(BattleState::Pending, BattleState::Ongoing)]
    #[case(BattleState::Ongoing, BattleState::Ended)]
    async fn test_validate_battle_system_transition(
        #[case] mut state: BattleState,
        #[case] result: BattleState,
    ) {
        let transition = state.transition();
        assert!(transition.is_ok());
        assert_eq!(state, result);
    }

    #[test]
    fn test_validate_battle_system_transition_error() {
        let state = &mut BattleState::Ended;
        let transition = state.transition();
        assert!(transition.is_err());
    }

    #[rstest]
    #[case(Operator::System, Operator::Character)]
    #[case(Operator::Character, Operator::Npc)]
    #[case(Operator::Npc, Operator::Character)]
    async fn test_switch_operator(#[case] current_operator: Operator, #[case] result: Operator) {
        allow_db_access(|connection| {
            let mut system = setup_battle_system(connection);
            system.current_operator = current_operator;
            system.current_operator.switch_operator();

            assert_eq!(system.current_operator, result);
        });
    }

    #[rstest]
    #[case(BattleDifficulty::Normal, 0)]
    #[case(BattleDifficulty::Hard, 1)]
    #[case(BattleDifficulty::Extreme, 2)]
    async fn test_battle_with_difficulty(#[case] difficulty: BattleDifficulty, #[case] value: i32) {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut application_settings = ApplicationSettings::load(connection).unwrap();
                application_settings.difficulty = difficulty.get_value();
                application_settings.save(connection).unwrap();

                let system = setup_battle_system(connection);

                assert_eq!(system.settings.difficulty, difficulty);
                assert_eq!(system.settings.difficulty.get_value(), value);
            });
        });
    }

    #[test]
    fn test_init_battle_system() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let system = setup_battle_system(connection);

                assert!(system.state == BattleState::Pending);
                assert!(system.history.is_empty());
                assert!(!system.datas.actions.is_empty());
                assert!(!system.datas.objects.is_empty());
                assert!(!system.datas.alterations.is_empty());
                assert_eq!(system.current_operator, Operator::default());
                assert_eq!(system.datas.actions, Action::get_list(&system.character));
                assert_eq!(system.datas.objects, Object::get_list(&system.character));
                assert_eq!(system.datas.alterations, Alteration::get_list());
            });
        });
    }

    #[test]
    fn test_start_battle_default() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system(connection);

                let battle = system.start_default();
                assert!(battle.is_ok());

                let action = system.trigger_player_action("attack");
                assert!(action.is_ok());

                assert!(!system.history.is_empty());
            });
        });
    }

    #[tokio::test]
    async fn test_start_battle_automatic() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system(connection);

                let battle = system.start_auto();
                assert!(battle.is_ok());

                assert!(system.current_turn > 1);
                assert_eq!(system.state, BattleState::Ended);
            });
        });
    }

    #[test]
    fn test_start_battle_range() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system(connection);

                let battle = system.start_range();
                assert!(battle.is_ok());

                assert_eq!(system.history[2].initiator, Operator::Character);
                assert_eq!(system.history[2].event, "Roll marksmanship");
            });
        });
    }

    #[test]
    fn test_start_battle_with_initiative() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system(connection);

                let battle = system.start_initiative();
                assert!(battle.is_ok());

                let action = system.trigger_player_action("attack");
                assert!(action.is_ok());

                assert_eq!(system.history[2].initiator, Operator::Character);
            });
        });
    }

    #[test]
    fn test_battle_system_next_turn() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system(connection);

                let battle = system.start_default();
                assert!(battle.is_ok());

                while system.current_turn < 2 {
                    if system.state == BattleState::Ended {
                        break;
                    }
                    let action = system.trigger_player_action("attack");
                    assert!(action.is_ok());
                }
            });
        });
    }

    #[test]
    fn test_battle_system_finish() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system(connection);

                let battle = system.start_default();
                assert!(battle.is_ok());

                while system.state != BattleState::Ended {
                    let action = system.trigger_player_action("attack");
                    assert!(action.is_ok());
                }
                assert_eq!(system.state, BattleState::Ended);
            });
        });
    }

    #[test]
    fn test_ended_battle_error() {
        allow_db_access(|connection| {
            let mut system = setup_battle_system(connection);

            let battle = system.start_default();
            assert!(battle.is_ok());

            let ending = system.end();
            assert!(ending.is_ok());

            let action = system.trigger_player_action("attack");
            assert!(action.is_err());
        });
    }

    #[test]
    fn test_not_started_battle_error() {
        allow_db_access(|connection| {
            let mut system = setup_battle_system(connection);

            let action = system.trigger_player_action("attack");
            assert!(action.is_err());
        });
    }

    #[test]
    fn test_start_battle_minimal_damages() {
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::CriticalSuccess, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system(connection);
                    system.npc.inventory = Inventory::empty();

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let action = system.trigger_player_action("attack");
                    assert!(action.is_ok());

                    let last_log = &system.history[*&system.history.len() - 1];
                    let last_log_text = last_log.text.to_lowercase();

                    assert_eq!(last_log.r#type, LogType::Damage);
                    assert_eq!(last_log.initiator, Operator::System);
                    assert_eq!(last_log.value, Some(BATTLE_SYSTEM_BASE_DAMAGES));
                    assert!(last_log_text.contains(&Operator::Character.to_string()));
                });
            });
        });
    }

    #[test]
    fn test_identify_battle_logs() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                with_tampering(TamperMode::Success, || {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_default();
                    assert!(battle.is_ok());

                    // First system logs, not identified
                    assert!(system.history.iter().all(|log| !log.identified));

                    let first_logs_batch_index = system.history.len();
                    let action = system.trigger_player_action("attack");
                    assert!(action.is_ok());

                    // System logs are now identified, new action logs aren't
                    assert!(system
                        .history
                        .iter()
                        .enumerate()
                        .filter(|(index, _)| index >= &first_logs_batch_index)
                        .all(|(_, log)| !log.identified));
                });
            });
        });
    }
}
