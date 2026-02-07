#[cfg(test)]
mod tests {

    use crate::backend::conf_tests::database::allow_db_access;
    use crate::backend::{conf_tests::database::with_permissions, permissions::models::Permission};

    use crate::battle::settings::TamperMode;
    use crate::battle::summary::Summary;
    use crate::battle::tests::test_utils::helpers::{setup_battle_system, with_tampering};
    use crate::battle::types::BattleState;

    #[test]
    fn test_battle_system_compute_summary() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                with_tampering(TamperMode::Success, || {
                    let mut system = setup_battle_system(connection);

                    let battle = system.start_default();
                    assert!(battle.is_ok());

                    while system.state != BattleState::Ended {
                        let action = system.trigger_player_action("attack");
                        assert!(action.is_ok());
                    }

                    assert_eq!(system.state, BattleState::Ended);
                    assert_eq!(system.summary.turns, system.current_turn as i32);
                    assert!(system.summary.max_damages > 0);
                    assert!(system.summary.damages_inflicted > 0);
                });
            });
        });
    }

    #[test]
    fn test_battle_system_default_summary() {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let system = setup_battle_system(connection);

                assert_eq!(system.summary, Summary::default());
            });
        });
    }
}
