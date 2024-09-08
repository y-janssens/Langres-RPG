#[cfg(test)]
mod tests {
    use crate::config::factories::factories_definitions::WorldFactory;
    use crate::config::factory::factory_models::Factory;
    use crate::utils::models::FrustumCullingUtility;

    #[test]
    fn test_frustum_cull() {
        let map = WorldFactory.generate();
        let ids = FrustumCullingUtility::cull(1122, 50, 18, 16);
        let items = FrustumCullingUtility::cull_filter(1122, 50, 18, 16, map.content);

        assert_eq!(ids.len(), 1221);
        assert_eq!(items.len(), 1221);
    }
}
