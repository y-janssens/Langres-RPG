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
        visible -> Bool,
        last_known_position -> Text,
    }
}

diesel::table! {
    maps (id) {
        id -> Integer,
        map -> Text,
        created -> Text,
        modified -> Text,
        visible -> Bool,
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
        languages -> Text,
        sound -> Bool,
        volume -> Integer,
        music -> Integer,
    }
}

diesel::table! {
    storyline (id) {
        id -> Integer,
        name -> Text,
        created -> Text,
        modified -> Text,
        story -> Text,
    }
}

diesel::allow_tables_to_appear_in_same_query!(
    functions,
    games,
    maps,
    objects,
    settings,
    storyline,
);
