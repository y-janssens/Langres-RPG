#[cfg(test)]
mod tests {
    use rstest::*;

    use crate::backend::conf::factories::factories_definitions::WorldFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::utils::models::FrustumCullingUtility;

    #[rstest]
    #[case(0, 0, 6)]
    #[case(1, 1, 6)]
    #[case(1, 2, 12)]
    #[case(2, 1, 12)]
    #[case(2, 2, 18)]
    fn test_frustum_cull(#[case] horizontal: usize, #[case] vertical: usize, #[case] result: usize) {
        let map = WorldFactory.generate();
        let ids = FrustumCullingUtility::cull(1122, 50, horizontal, vertical);
        let items = FrustumCullingUtility::cull_filter(1122, 50, horizontal, vertical, map.content);

        assert_eq!(ids.len(), result);
        assert_eq!(items.len(), result);
    }

    #[test]
    fn test_get_neighbours_ids() {
        let ids = FrustumCullingUtility::cull(1122, 50, 3, 3);
        assert_eq!(ids.len(), 49);
    }
}
