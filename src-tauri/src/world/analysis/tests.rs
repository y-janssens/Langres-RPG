#[cfg(test)]
mod tests {
    use rstest::*;
    use tokio::runtime::Runtime;

    use crate::backend::conf::factories::factories_definitions::WorldFactory;
    use crate::backend::conf::factory::factory_models::Factory;
    use crate::backend::settings::errors::BASE_ERROR;
    use crate::world::analysis::report::MapReportEntry;
    use crate::world::settings::DEFAULT_MAP_SIZE_GRID;

    #[rstest]
    async fn test_map_generation_report() {
        let rt = Runtime::new().unwrap();

        rt.block_on(async {
            let mut world = WorldFactory.generate();
            let _ = world.generate_content(None).await;
            let report = world.generate_report().expect(BASE_ERROR);

            let valid_tolerance = (*DEFAULT_MAP_SIZE_GRID as f64 * 0.9) as u32; // 90%
            let inconsistent_tolerance = (*DEFAULT_MAP_SIZE_GRID as f64 * 0.05) as u32; // 5%

            assert!(report.summary[&MapReportEntry::Valid] >= valid_tolerance);
            assert!(report.summary[&MapReportEntry::Inconsistent] <= inconsistent_tolerance);
            assert_eq!(report.summary[&MapReportEntry::Invalid], 0_u32);
            assert_eq!(report.summary[&MapReportEntry::Unchanged], 0_u32);
        });
    }
}
