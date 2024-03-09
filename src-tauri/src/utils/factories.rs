#[allow(dead_code)]
pub mod factories_definitions {
    use diesel::SqliteConnection;

    use crate::models::collection::collections::Collection;
    use crate::models::game::games::Game;
    use crate::models::story::storyline::{Act, Acts, Content, Story};
    use crate::models::world::maps::World;
    use crate::utils::factory::factory_models::{ApiFactory, Factory};
    use crate::utils::faker::faker_definitions::{BoolFaker, Faker, IdFaker, StringFaker};

    pub struct StoryLineFactory;
    pub struct ActsFactory;
    pub struct ActFactory;
    pub struct ContentFactory;
    pub struct WorldFactory;
    pub struct CollectionFactory;
    pub struct GameFactory;

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
}
