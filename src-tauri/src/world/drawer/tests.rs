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
    // #[case::ground("ground", Brush::Ground, Some(50), None, false)]
    // #[case::mud("mud", Brush::Mud, Some(50), None, false)]
    // #[case::fence("fence", Brush::Fence, Some(50), None, false)]
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
            .all(|it| it.value == SHORE.value()));
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

    #[test]
    fn test_drawer_link_areas() {
        use std::collections::{HashMap, HashSet};

        let mut map = WorldFactory.generate();
        map.content = World::generate();

        let water_tiles = vec![
            455, 456, 457, 458, 459, 466, 467, 468, 469, 470, 505, 506, 507, 508, 516, 517, 518, 519, 555, 556, 557, 558, 559, 566, 567,
            568, 569, 570, 605, 606, 607, 608, 616, 617, 618, 619,
        ];
        let shore_tiles = vec![
            404, 405, 406, 407, 408, 409, 415, 416, 417, 418, 419, 420, 454, 460, 465, 471, 504, 509, 515, 520, 554, 560, 565, 571, 604,
            609, 615, 620, 655, 656, 657, 658, 659, 666, 667, 668, 669, 670,
        ];

        for item in map.content.iter_mut() {
            if water_tiles.contains(&item.id) {
                item.edit("W");
            }
            if shore_tiles.contains(&item.id) {
                item.edit("S");
            }
        }

        let tiles = vec![508, 509, 510, 511, 512, 559, 560, 561, 562, 563, 513, 564, 514, 565, 515, 566, 516];

        let content_map: HashMap<u32, _> = map.content.iter().map(|it| (it.id, it)).collect();
        let tiles_set: HashSet<u32> = tiles.iter().copied().collect();
        let expected_shore_tiles: HashSet<u32> = tiles_set
            .iter()
            .filter_map(|id| content_map.get(id))
            .flat_map(|it| it.neighbours_ids.iter().copied())
            .filter(|id| !tiles_set.contains(id))
            .filter(|id| content_map.get(id).is_some_and(|it| it.walkable))
            .collect();

        let drawer = Drawer::execute(map.clone(), tiles.clone(), "water", false, None).expect(BASE_ERROR);

        assert!(drawer
            .iter()
            .filter(|it| tiles.contains(&it.id))
            .all(|it| it.value == WATER.value()));
        assert!(drawer
            .iter()
            .filter(|it| water_tiles.contains(&it.id))
            .all(|it| it.value == WATER.value()));
        assert!(drawer
            .iter()
            .filter(|it| expected_shore_tiles.contains(&it.id))
            .all(|it| it.value == SHORE.value()));
    }
}
