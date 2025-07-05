#[cfg(test)]
mod tests {
    use rstest::*;

    use crate::application::models::ApplicationSettings;
    use crate::backend::conf_tests::database::allow_db_access;
    use crate::backend::{permissions::models::Permission, conf_tests::database::with_permissions};
    use crate::battle::actions::Action;
    use crate::battle::alterations::Alteration;
    use crate::battle::objects::Object;
    use crate::battle::tests::test_utils::helpers::setup_battle_system;
    use crate::battle::types::{BattleDifficulty, BattleState, Operator};

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
    async fn test_switch_operator(#[case] current: Operator, #[case] result: Operator) {
        allow_db_access(|connection| {
            let mut system = setup_battle_system(connection);
            system.current = current;
            system.current.switch_operator();

            assert_eq!(system.current, result);
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
                assert_eq!(system.current, Operator::default());
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

                let action = system.player_action("attack");
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

                assert!(system.turn > 1);
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

                let action = system.player_action("attack");
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

                while system.turn < 2 {
                    if system.state == BattleState::Ended {
                        break;
                    }
                    let action = system.player_action("attack");
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
                    let action = system.player_action("attack");
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

            let action = system.player_action("attack");
            assert!(action.is_err());
        });
    }

    #[test]
    fn test_not_started_battle_error() {
        allow_db_access(|connection| {
            let mut system = setup_battle_system(connection);

            let action = system.player_action("attack");
            assert!(action.is_err());
        });
    }
}
