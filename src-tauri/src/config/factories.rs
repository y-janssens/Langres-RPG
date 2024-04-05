#[allow(dead_code)]
pub mod factories_definitions {
    use diesel::SqliteConnection;
    use rand::seq::IteratorRandom;

    use crate::achievements::models::Achievement;
    use crate::collection::models::Collection;
    use crate::functions::models::Function;
    use crate::game::models::Game;
    use crate::loot::models::{ItemTypes, Loot};

    use crate::config::factory::factory_models::{ApiFactory, Factory};
    use crate::config::faker::faker_definitions::*;
    use crate::objects::models::{Area, Object};
    use crate::statistics::models::Statistic;
    use crate::storyline::models::{Act, Acts, Content, Story};
    use crate::translations::models::Translations;
    use crate::world::models::World;

    pub struct StoryLineFactory;
    pub struct ActsFactory;
    pub struct ActFactory;
    pub struct ContentFactory;
    pub struct WorldFactory;
    pub struct CollectionFactory;
    pub struct GameFactory;
    pub struct ObjectFactory;
    pub struct FunctionFactory;
    pub struct QuestFactory;
    pub struct AchievementFactory;
    pub struct StatisticFactory;
    pub struct LootFactory;
    pub struct ItemFactory;

    impl Factory for StoryLineFactory {
        type Output = Story;

        fn generate(&self) -> Self::Output {
            Story {
                id: IdFaker.generate().value(),
                name: StringFaker.generate().value(),
                created: StringFaker.generate().value(),
                modified: StringFaker.generate().value(),
                story: Acts {
                    acts: vec![ActFactory.generate()],
                },
            }
        }
    }

    impl Factory for ActsFactory {
        type Output = Acts;

        fn generate(&self) -> Self::Output {
            Acts {
                acts: vec![ActFactory.generate()],
            }
        }
    }

    impl Factory for ActFactory {
        type Output = Act;

        fn generate(&self) -> Self::Output {
            Act {
                id: IdFaker.generate().value(),
                order: 0,
                name: "name".to_string(),
                title: StringFaker.generate().value().to_string(),
                date: StringFaker.generate().value().to_string(),
                content: ContentFactory.generate(),
                complete: false,
            }
        }
    }

    impl Factory for ContentFactory {
        type Output = Content;

        fn generate(&self) -> Self::Output {
            Content {
                maps: vec![Some(WorldFactory.generate()), Some(WorldFactory.generate())],
            }
        }
    }

    impl Factory for WorldFactory {
        type Output = World;

        fn generate(&self) -> Self::Output {
            World::new(50, "test".to_string(), 0, true)
        }
    }

    impl Factory for CollectionFactory {
        type Output = Collection;

        fn generate(&self) -> Self::Output {
            Collection {
                id: IdFaker.generate().value(),
                map: WorldFactory.generate(),
                created: StringFaker.generate().value().to_string(),
                modified: StringFaker.generate().value().to_string(),
                visible: BoolFaker.generate().value(),
            }
        }
    }

    impl ApiFactory for GameFactory {
        type Output = Game;

        fn generate(&self, connection: &mut SqliteConnection) -> Self::Output {
            Game::new("game".to_string(), connection)
        }
    }

    impl Factory for ObjectFactory {
        type Output = Object;

        fn generate(&self) -> Self::Output {
            Object {
                id: IdFaker.generate().value(),
                name: StringFaker.generate().value().to_string(),
                value: Some(StringFaker.generate().value().to_string()),
                area: Area { x: 1, y: 1 },
                walkable: BoolFaker.generate().value(),
            }
        }
    }

    impl Factory for FunctionFactory {
        type Output = Function;

        fn generate(&self) -> Self::Output {
            Function {
                id: IdFaker.generate().value(),
                icon: StringFaker.generate().value().to_string(),
                label: StringFaker.generate().value().to_string(),
                command: StringFaker.generate().value().to_string(),
            }
        }
    }

    impl Factory for AchievementFactory {
        type Output = Achievement;

        fn generate(&self) -> Self::Output {
            Achievement {
                id: UUIdFaker.generate().value(),
                name: Translations::generate(
                    &StringFaker.generate().value(),
                    &StringFaker.generate().value(),
                ),
                description: Translations::generate(
                    &StringFaker.generate().value(),
                    &StringFaker.generate().value(),
                ),
                completed: false,
            }
        }
    }

    impl Factory for StatisticFactory {
        type Output = Statistic;

        fn generate(&self) -> Self::Output {
            Statistic {
                id: UUIdFaker.generate().value(),
                name: Translations::generate(
                    &StringFaker.generate().value(),
                    &StringFaker.generate().value(),
                ),
                value: StringFaker.generate().value(),
            }
        }
    }

    impl Factory for LootFactory {
        type Output = Loot;

        fn generate(&self) -> Self::Output {
            let mut rng = rand::thread_rng();
            let types = ["weapon", "equipment", "craftable", "thrash"];
            let item = *types.iter().choose(&mut rng).unwrap();
            Loot {
                id: UUIdFaker.generate().value(),
                item_type: ItemTypes::resolve(item),
                name: Translations::generate(
                    &StringFaker.generate().value(),
                    &StringFaker.generate().value(),
                ),
                description: Translations::generate(
                    &StringFaker.generate().value(),
                    &StringFaker.generate().value(),
                ),
                armor: Some(IntFaker.generate().value()),
                damage: Some(IntFaker.generate().value()),
                parade: Some(IntFaker.generate().value()),
                price: Some(IntFaker.generate().value()),
                weight: Some(IntFaker.generate().value()),
            }
        }
    }
}
