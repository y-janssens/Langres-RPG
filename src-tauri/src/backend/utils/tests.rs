#[cfg(test)]
mod tests {
    use crate::backend::conf::factories::factories_definitions::WorldFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::utils::models::FrustumCullingUtility;

    #[test]
    fn test_frustum_cull() {
        let map = WorldFactory.generate();
        let ids = FrustumCullingUtility::cull(1122, 50, 18, 16);
        let items = FrustumCullingUtility::cull_filter(1122, 50, 18, 16, map.content);

        assert_eq!(ids.len(), 1221);
        assert_eq!(items.len(), 1221);
    }

    #[test]
    fn test_get_neighbours_ids() {
        let ids = FrustumCullingUtility::cull(1122, 50, 3, 3);
        assert_eq!(ids.len(), 49);
    }
}
