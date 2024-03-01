#[cfg(test)]
pub mod tests_utils {
    use crate::{
        models::utils::game_utils::FrustumCullingUtility,
        tests::factories::tests_factories::world_factory,
    };

    #[test]
    fn test_frustum_cull() {
        let map = world_factory("test", 50);
        let ids = FrustumCullingUtility::cull(1122, 50, 18, 16);
        let items = FrustumCullingUtility::cull_filter(1122, 50, 18, 16, map.content);

        assert_eq!(ids.len(), 851);
        assert_eq!(items.len(), 851);
    }
}
