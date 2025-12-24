#[cfg(test)]
mod tests {
    use crate::{
        backend::{conf_tests::database::allow_db_access, settings::errors::BASE_ERROR},
        npcs::models::Npc,
    };
    use core_macros::npcs_initial_datas;

    #[test]
    fn test_resolve_npcs_from_script() {
        let result = npcs_initial_datas!();
        assert!(result.is_ok());
    }

    #[test]
    fn test_resolve_and_insert_npcs_from_script() {
        allow_db_access(|connection| {
            let npcs: Vec<Npc> = npcs_initial_datas!().expect(BASE_ERROR);

            for npc in npcs {
                let insertion = npc.save(connection);
                assert!(insertion.is_ok());
            }

            let result = Npc::fetch(connection);
            assert!(result.is_ok_and(|res| !res.is_empty()));
        });
    }
}
