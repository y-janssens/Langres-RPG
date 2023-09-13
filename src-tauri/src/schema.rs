// @generated automatically by Diesel CLI.

diesel::table! {
    game (id) {
        id -> Integer,
        player -> Text,
        date_created -> Text,
        last_save_date -> Nullable<Text>,
        save_count -> Integer,
        character -> Nullable<Text>,
        world -> Nullable<Text>,
    }
}
