#[cfg(test)]
mod tests {
    use crate::{
        backend::{conf_tests::database::allow_db_access, settings::errors::BASE_ERROR},
        storyline::models::Story,
    };
    use system_macros::storyline_initial_datas;

    #[test]
    fn test_resolve_storyline_from_script() {
        let result = storyline_initial_datas!();
        assert!(result.is_ok());
    }

    #[test]
    fn test_resolve_and_insert_storyline_from_script() {
        allow_db_access(|connection| {
            let story: Story = storyline_initial_datas!().expect(BASE_ERROR);
            let insertion = story.insert_initial_datas(connection);

            assert!(insertion.is_ok());

            let result = Story::load(connection);
            assert!(result.is_ok_and(|res| res.name == story.name));
        });
    }
}
