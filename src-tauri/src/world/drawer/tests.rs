#[cfg(test)]
mod tests {
    use rstest::*;
    use std::io::ErrorKind::{self, InvalidInput, NotFound};

    use crate::{
        backend::{
            conf::{factories::factories_definitions::WorldFactory, factory::factory_models::Factory},
            settings::errors::{BASE_ERROR, DRAWER_BRUSH_ERROR, DRAWER_INPUT_ERROR},
        },
        world::{
            drawer::{models::Drawer, types::Brush},
            models::World,
            settings::{BORDER, DEFAULT_MAP_VALUE, SHORE, TREE, WATER},
        },
    };

    const TILES: [u32; 13] = [565, 566, 567, 568, 614, 615, 616, 617, 618, 665, 666, 667, 668];
    const NEIGHBOURS: [u32; 16] = [514, 515, 516, 517, 518, 564, 569, 613, 619, 664, 669, 714, 715, 716, 717, 718];

    #[rstest]
    #[case::tree("tree", Brush::Tree, Some(0), Some(1), false)]
    #[case::tree("tree", Brush::Tree, Some(50), Some(50), false)]
    #[case::tree("tree", Brush::Tree, Some(200), Some(100), false)]
    #[case::grass("grass", Brush::Grass, Some(0), None, false)]
    #[case::grass("grass", Brush::Grass, Some(50), None, false)]
    #[case::grass("grass", Brush::Grass, Some(200), None, false)]
    #[case::ground("ground", Brush::Ground, Some(50), None, false)]
    #[case::mud("mud", Brush::Mud, Some(50), None, false)]
    #[case::fence("fence", Brush::Fence, Some(50), None, false)]
    #[case::water("water", Brush::Water, Some(50), None, false)]
    #[case::road("road", Brush::Road, Some(50), None, false)]
    #[case::road("empty", Brush::Empty, Some(50), None, true)]
    fn test_drawer_init(
        #[case] brush: &str,
        #[case] brush_result: Brush,
        #[case] density: Option<u8>,
        #[case] density_result: Option<u8>,
        #[case] overwrite_result: bool,
    ) {
        let tiles = vec![122, 333, 12, 111];
        let drawer = Drawer::init(tiles, brush, false, density);

        assert!(drawer.is_ok_and(|res| { res.brush == brush_result && res.density == density_result && res.overwrite == overwrite_result }));
    }

    #[rstest]
    #[case::tree(vec![122, 333, 12, 111], "test", NotFound, DRAWER_BRUSH_ERROR)]
    #[case::tree(vec![], "tree", InvalidInput, DRAWER_INPUT_ERROR)]
    fn test_drawer_init_error(#[case] tiles: Vec<u32>, #[case] brush: &str, #[case] kind: ErrorKind, #[case] error: &str) {
        let drawer = Drawer::init(tiles, brush, true, None);
        assert!(drawer.is_err_and(|e| e.kind() == kind && e.to_string() == error));
    }

    #[test]
    fn test_drawer_execute_overwrite() {
        let mut map = WorldFactory.generate();
        map.content = World::generate();

        let tiles = TILES.to_vec();
        let neighbours = NEIGHBOURS.to_vec();

        let drawer = Drawer::execute(map.clone(), tiles.clone(), "water", true, None).expect(BASE_ERROR);

        assert!(drawer
            .iter()
            .filter(|it| tiles.contains(&it.id))
            .all(|it| it.value == WATER.value()));

        assert!(drawer
            .iter()
            .filter(|it| neighbours.contains(&it.id))
            .all(|it| it.value == SHORE.value()));
    }

    #[test]
    fn test_drawer_execute_draw() {
        let mut map = WorldFactory.generate();
        map.content = World::generate();

        let tiles = TILES.to_vec();
        let neighbours = NEIGHBOURS.to_vec();

        for item in map.content.iter_mut().filter(|it| [565, 566, 567, 568].contains(&it.id)) {
            item.edit(&TREE.value());
        }

        let drawer = Drawer::execute(map, tiles.clone(), "water", false, None).expect(BASE_ERROR);

        assert!(drawer.iter().filter(|it| tiles.contains(&it.id)).any(|it| it.value == TREE.value()));
        assert!(drawer
            .iter()
            .filter(|it| [565, 566, 567, 568].contains(&it.id))
            .all(|it| it.value == TREE.value()));

        assert!(drawer
            .iter()
            .filter(|it| neighbours.contains(&it.id))
            .all(|it| it.value == DEFAULT_MAP_VALUE.value()));
    }

    #[test]
    fn test_drawer_execute_with_density() {
        let mut map = WorldFactory.generate();
        map.content = World::generate();

        let tiles = TILES.to_vec();
        let neighbours = NEIGHBOURS.to_vec();

        let drawer = Drawer::execute(map, tiles.clone(), "tree", true, Some(50)).expect(BASE_ERROR);

        assert!(drawer.iter().filter(|it| tiles.contains(&it.id)).any(|it| it.value == TREE.value()));
        assert!(drawer.iter().filter(|it| tiles.contains(&it.id)).any(|it| it.value != TREE.value()));

        assert!(drawer
            .iter()
            .filter(|it| neighbours.contains(&it.id))
            .all(|it| it.value != BORDER.value()));
    }

    #[rstest]
    #[case(Some(100))]
    #[case(None)]
    fn test_drawer_execute_with_full_density(#[case] density: Option<u8>) {
        let mut map = WorldFactory.generate();
        map.content = World::generate();

        let tiles = TILES.to_vec();
        let neighbours = NEIGHBOURS.to_vec();

        let drawer = Drawer::execute(map, tiles.clone(), "tree", true, density).expect(BASE_ERROR);

        assert!(drawer.iter().filter(|it| tiles.contains(&it.id)).all(|it| it.value == TREE.value()));
        assert!(drawer
            .iter()
            .filter(|it| neighbours.contains(&it.id))
            .all(|it| it.value == BORDER.value()));
    }

    #[test]
    fn test_drawer_execute_erase_mode() {
        let mut map = WorldFactory.generate();

        let tiles = TILES.to_vec();

        for item in map.content.iter_mut() {
            item.edit(&WATER.value());
        }

        assert!(map.content.iter().all(|it| it.value != DEFAULT_MAP_VALUE.value()));

        let drawer = Drawer::execute(map.clone(), tiles.clone(), "empty", true, None).expect(BASE_ERROR);

        assert!(drawer
            .iter()
            .filter(|it| tiles.contains(&it.id))
            .all(|it| it.value == DEFAULT_MAP_VALUE.value()));
        assert!(drawer
            .iter()
            .filter(|it| !tiles.contains(&it.id))
            .all(|it| it.value == WATER.value()));
    }
}
