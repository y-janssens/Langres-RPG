pub mod faker {
    use rand::{distributions::Alphanumeric, Rng};
    pub trait AbstractFake {}

    pub struct FakeId(i32);
    pub struct FakeString(String);
    pub struct FakeInt(i32);
    pub struct FakeFloat(f32);
    pub struct FakeBool(bool);

    pub struct IdFaker;
    pub struct StringFaker;
    pub struct IntFaker;
    pub struct FloatFaker;
    pub struct BoolFaker;

    impl AbstractFake for FakeId {}
    impl AbstractFake for FakeString {}
    impl AbstractFake for FakeInt {}
    impl AbstractFake for FakeFloat {}
    impl AbstractFake for FakeBool {}

    pub trait Faker {
        type Output: AbstractFake;
        fn generate(&self) -> Self::Output;
    }

    impl Faker for IdFaker {
        type Output = FakeId;
        fn generate(&self) -> Self::Output {
            let rand_id = rand::thread_rng().gen_range(1..=i32::MAX);
            FakeId(rand_id)
        }
    }

    impl Faker for StringFaker {
        type Output = FakeString;
        fn generate(&self) -> Self::Output {
            let rand_string: String = rand::thread_rng()
                .sample_iter(&Alphanumeric)
                .take(10)
                .map(char::from)
                .collect();
            FakeString(rand_string)
        }
    }

    impl Faker for IntFaker {
        type Output = FakeInt;
        fn generate(&self) -> Self::Output {
            let rand_int = rand::thread_rng().gen::<i32>();
            FakeInt(rand_int)
        }
    }

    impl Faker for FloatFaker {
        type Output = FakeFloat;
        fn generate(&self) -> Self::Output {
            let rand_float = rand::thread_rng().gen::<f32>();
            FakeFloat(rand_float)
        }
    }

    impl Faker for BoolFaker {
        type Output = FakeBool;
        fn generate(&self) -> Self::Output {
            let rand_bool = rand::thread_rng().gen::<bool>();
            FakeBool(rand_bool)
        }
    }
}
