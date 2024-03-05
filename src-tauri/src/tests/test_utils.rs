#[cfg(test)]
mod tests {

    use crate::models::utils::game_utils::FrustumCullingUtility;
    use crate::utils::factories::factories_definitions::WorldFactory;
    use crate::utils::factory::factory_models::Factory;

    #[test]
    fn test_frustum_cull() {
        let map = WorldFactory.generate();
        let ids = FrustumCullingUtility::cull(1122, 50, 18, 16);
        let items = FrustumCullingUtility::cull_filter(1122, 50, 18, 16, map.content);

        assert_eq!(ids.len(), 575);
        assert_eq!(items.len(), 575);
    }
}
