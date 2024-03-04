#[cfg(test)]
mod tests {
    use crate::models::character::characters::Character;

    #[test]
    fn test_lvl_up_character() {
        let mut character = Character::new("Adam".to_string());
        character.compute_xp(153);

        assert_eq!(character.lvl, 2);
        assert_eq!(character.xp, 3);
        assert_eq!(character.max_xp, 183);
    }
}
