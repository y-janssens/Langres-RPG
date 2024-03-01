#[cfg(test)]
pub mod tests_character {
    use crate::models::character::characters::Character;

    #[test]
    fn test_create_character() {
        let character = Character::new("Adam".to_string());

        assert_eq!(character.name, "Adam");
        assert_eq!(character.lvl, 1);
        assert_eq!(character.xp, 0);
        assert_eq!(character.max_xp, 150);
    }

    #[test]
    fn test_lvl_up_character() {
        let mut character = Character::new("Adam".to_string());
        character.compute_xp(153);

        assert_eq!(character.lvl, 2);
        assert_eq!(character.xp, 3);
        assert_eq!(character.max_xp, 183);
    }
}
