#[cfg(test)]
pub mod tests_utils {
    use crate::models::utils::game_utils::FrustumCullingUtility;

    #[test]
    fn test_rationalizer() {
        let rationalizer = FrustumCullingUtility::cull(1122, 50, 18, 16);

        assert_eq!(rationalizer.len(), 851)
    }
}
