#[cfg(test)]
mod tests {
    use rstest::*;

    use crate::backend::conf_tests::database::allow_db_access;
    use crate::backend::settings::errors::BASE_ERROR;
    use crate::backend::{conf_tests::database::with_permissions, permissions::models::Permission};
    use crate::battle::actions::Action;
    use crate::battle::alterations::Alteration;
    use crate::battle::logs::LogType;
    use crate::battle::models::BattleSystem;
    use crate::battle::objects::Object;
    use crate::battle::settings::TamperMode;
    use crate::battle::tests::test_utils::helpers::{setup_battle_system_with_loot, with_tampering};
    use crate::battle::types::Operator;
    use crate::character::models::Character;
    use crate::npcs::models::Npc;

    #[rstest]
    #[case("dirt", Object::Dirt)]
    #[case("torch", Object::Torch)]
    #[case("bandage", Object::Bandage)]
    #[case("water_vial", Object::WaterVial)]
    async fn test_resolve_object(#[case] object_str: &str, #[case] result: Object) {
        let object = Object::resolve(object_str);
        assert!(object.is_ok_and(|res| res == result));
    }

    #[rstest]
    #[case("")]
    #[case("flex")]
    async fn test_resolve_object_error(#[case] object_str: &str) {
        let object = Object::resolve(object_str);
        assert!(object.is_err());
    }

    #[test]
    fn test_object_availability() {
        let obj = Object::Torch;
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let system = setup_battle_system_with_loot(&obj, connection);
                let objects = system.datas.objects;

                assert!(!objects.iter().find(|it| it.name == obj.to_string()).unwrap().disabled);
                assert!(objects.iter().filter(|it| it.name != obj.to_string()).all(|it| it.disabled));
            });
        });
    }

    #[rstest]
    #[case("dirt", Object::Dirt)]
    #[case("torch", Object::Torch)]
    #[case("bandage", Object::Bandage)]
    #[case("water_vial", Object::WaterVial)]
    async fn test_use_object(#[case] object_str: &str, #[case] obj: Object) {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let mut system = setup_battle_system_with_loot(&obj, connection);
                assert_eq!(system.character.get_consumables(Some(&obj)).len(), 2);

                let battle = system.start_initiative();
                assert!(battle.is_ok());

                let object = system.trigger_player_object(object_str);
                assert!(object.is_ok());

                let object_log = &system.history[2];

                assert!(object_log.object.clone().is_some_and(|ob| ob == obj));
                assert_eq!(object_log.initiator, Operator::Character);
                assert_eq!(object_log.text, format!("Character {}", obj.to_value()));
                assert_eq!(system.character.get_consumables(Some(&obj)).len(), 1);
            });
        });
    }

    #[rstest]
    #[case("dirt")]
    #[case("torch")]
    #[case("bandage")]
    #[case("water_vial")]
    async fn test_use_object_error(#[case] object_str: &str) {
        with_permissions(Permission::Admin, || {
            allow_db_access(|connection| {
                let character = Character::new("test".to_string(), connection).expect(BASE_ERROR);
                let npc = Npc::new(1, (0.0, 0.0, 0));

                let mut system = BattleSystem::initialize(character, npc, connection).unwrap();

                let battle = system.start_initiative();
                assert!(battle.is_ok());

                let object = system.trigger_player_object(object_str);
                assert!(object.is_ok());

                let object_log = &system.history[2];

                assert_eq!(object_log.initiator, Operator::Character);
                assert_eq!(&object_log.text, "Character cannot use this object");
            });
        });
    }

    #[test]
    fn test_use_water_vial_success() {
        let obj = Object::WaterVial;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system_with_loot(&obj, connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let object = system.trigger_player_object(&obj.to_string());
                    assert!(object.is_ok());

                    let roll_log = system.history[2].clone();

                    assert_eq!(roll_log.object, Some(obj));
                    assert_eq!(roll_log.roll, Some("success".to_string()));
                    assert!(system.npc.pv < system.npc.max_pv);
                });
            });
        });
    }

    #[test]
    fn test_use_water_vial_failure() {
        let obj = Object::WaterVial;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Failure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system_with_loot(&obj, connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let object = system.trigger_player_object(&obj.to_string());
                    assert!(object.is_ok());

                    let roll_log = system.history[2].clone();

                    assert_eq!(roll_log.object, Some(obj));
                    assert_eq!(roll_log.roll, Some("failure".to_string()));
                    assert!(system.npc.pv == system.npc.max_pv);
                });
            });
        });
    }

    #[test]
    fn test_use_water_vial_critical_failure() {
        let obj = Object::WaterVial;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::CriticalFailure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system_with_loot(&obj, connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let object = system.trigger_player_object(&obj.to_string());
                    assert!(object.is_ok());

                    let roll_log = system.history[2].clone();
                    let last_log = system.history[3].clone();

                    assert_eq!(roll_log.object, Some(obj));
                    assert_eq!(roll_log.roll, Some("critical_failure".to_string()));
                    assert!(system.npc.pv == system.npc.max_pv);

                    assert_eq!(last_log.action, Some(Action::CounterAttack));
                });
            });
        });
    }

    #[test]
    fn test_use_bandage_success() {
        let obj = Object::Bandage;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system_with_loot(&obj, connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let object = system.trigger_player_object(&obj.to_string());
                    assert!(object.is_ok());

                    let roll_log = system.history[2].clone();
                    let result_log = system.history[3].clone();

                    assert_eq!(roll_log.object, Some(obj));
                    assert_eq!(roll_log.roll, Some("success".to_string()));
                    assert_eq!(result_log.r#type, LogType::Heal);
                    assert!(result_log.value.is_some_and(|v| v > 0));
                });
            });
        });
    }

    #[test]
    fn test_use_bandage_failure() {
        let obj = Object::Bandage;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Failure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system_with_loot(&obj, connection);
                    let base_pvs = system.character.pv.clone();

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let object = system.trigger_player_object(&obj.to_string());
                    assert!(object.is_ok());

                    let roll_log = system.history[2].clone();

                    assert_eq!(roll_log.object, Some(obj));
                    assert_eq!(roll_log.roll, Some("failure".to_string()));
                    assert!(system.character.pv == base_pvs);
                });
            });
        });
    }

    #[test]
    fn test_use_dirt_success() {
        let obj = Object::Dirt;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system_with_loot(&obj, connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let object = system.trigger_player_object(&obj.to_string());
                    assert!(object.is_ok());

                    let roll_log = system.history[2].clone();
                    let last_log = system.history[3].clone();

                    assert_eq!(roll_log.object, Some(obj));
                    assert_eq!(roll_log.roll, Some("success".to_string()));
                    assert_eq!(last_log.action, Some(Action::Pass));
                });
            });
        });
    }

    #[test]
    fn test_use_dirt_critical_failure() {
        let obj = Object::Dirt;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::CriticalFailure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system_with_loot(&obj, connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let object = system.trigger_player_object(&obj.to_string());
                    assert!(object.is_ok());

                    let roll_log = system.history[2].clone();
                    let last_log = system.history[3].clone();

                    assert_eq!(roll_log.object, Some(obj));
                    assert_eq!(roll_log.roll, Some("critical_failure".to_string()));
                    assert_eq!(last_log.action, Some(Action::CounterAttack));
                });
            });
        });
    }

    #[test]
    fn test_use_torch_success() {
        let obj = Object::Torch;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::Success, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system_with_loot(&obj, connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let object = system.trigger_player_object(&obj.to_string());
                    assert!(object.is_ok());

                    let roll_log = system.history[2].clone();
                    let alteration_log = system.history[3].clone();
                    let damage_log = system.history[4].clone();

                    assert_eq!(roll_log.object, Some(obj));
                    assert_eq!(roll_log.roll, Some("success".to_string()));

                    assert_eq!(alteration_log.alteration, Some(Alteration::Burn));
                    assert_eq!(damage_log.alteration, Some(Alteration::Burn));

                    assert!(system.npc.pv < system.npc.max_pv);
                });
            });
        });
    }

    #[test]
    fn test_use_torch_critical_failure() {
        let obj = Object::Torch;
        with_permissions(Permission::Admin, || {
            with_tampering(TamperMode::CriticalFailure, || {
                allow_db_access(|connection| {
                    let mut system = setup_battle_system_with_loot(&obj, connection);

                    let battle = system.start_initiative();
                    assert!(battle.is_ok());

                    let object = system.trigger_player_object(&obj.to_string());
                    assert!(object.is_ok());

                    let roll_log = system.history[2].clone();
                    let last_log = system.history[3].clone();

                    assert_eq!(roll_log.object, Some(obj));
                    assert_eq!(roll_log.roll, Some("critical_failure".to_string()));
                    assert_eq!(last_log.action, Some(Action::CounterAttack));
                });
            });
        });
    }
}
