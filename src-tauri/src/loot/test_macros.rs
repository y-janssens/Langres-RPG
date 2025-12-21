#[cfg(test)]
mod tests {
    use crate::{
        backend::{conf_tests::database::allow_db_access, settings::errors::BASE_ERROR},
        loot::models::Loot,
    };
    use system_macros::loot_initial_datas;

    #[test]
    fn test_resolve_loot_from_script() {
        let result = loot_initial_datas!();
        assert!(result.is_ok());
    }

    #[test]
    fn test_resolve_and_insert_loot_from_script() {
        allow_db_access(|connection| {
            let loot: Vec<Loot> = loot_initial_datas!().expect(BASE_ERROR);

            for function in loot {
                let insertion = function.save(connection);
                assert!(insertion.is_ok());
            }

            let result = Loot::load(connection);
            assert!(result.is_ok_and(|res| !res.is_empty()));
        });
    }
}
