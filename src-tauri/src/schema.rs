// @generated automatically by Diesel CLI.

diesel::table! {
    functions (id) {
        id -> Integer,
        icon -> Text,
        label -> Text,
        command -> Text,
    }
}

diesel::table! {
    games (id) {
        id -> Integer,
        player -> Text,
        date_created -> Text,
        last_save_date -> Text,
        save_count -> Integer,
        character -> Text,
        storyline -> Text,
    }
}

diesel::table! {
    objects (id) {
        id -> Integer,
        name -> Text,
        value -> Nullable<Text>,
        area -> Text,
        walkable -> Bool,
    }
}

diesel::table! {
    settings (id) {
        id -> Integer,
        language -> Text,
        sound -> Bool,
        volume -> Integer,
        music -> Integer,
    }
}

diesel::table! {
    storyline (id) {
        id -> Integer,
        story -> Text,
    }
}

diesel::allow_tables_to_appear_in_same_query!(
    functions,
    games,
    objects,
    settings,
    storyline,
);
