// @generated automatically by Diesel CLI.

diesel::table! {
    achievements (id) {
        id -> Text,
        name -> Text,
        description -> Text,
        completed -> Bool,
        visible -> Bool,
    }
}

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
        id -> Text,
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
    loot (id) {
        id -> Text,
        item_type -> Text,
        name -> Text,
        description -> Text,
        armor -> Nullable<Integer>,
        damage -> Nullable<Integer>,
        parade -> Nullable<Integer>,
        price -> Nullable<Integer>,
        weight -> Nullable<Integer>,
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
        interactive -> Bool,
    }
}

diesel::table! {
    playerachievements (id) {
        id -> Text,
        achievement_id -> Text,
        game_id -> Text,
        name -> Text,
        description -> Text,
        completed -> Bool,
    }
}

diesel::table! {
    playerquests (id) {
        id -> Text,
        quest_id -> Text,
        game_id -> Text,
        name -> Text,
        description -> Text,
        primary -> Bool,
        status -> Text,
        visible -> Bool,
        reward -> Integer,
        next -> Nullable<Text>,
    }
}

diesel::table! {
    playerstatistics (id) {
        id -> Text,
        game_id -> Text,
        statistic_id -> Text,
        name -> Text,
        value -> Text,
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
    statistics (id) {
        id -> Text,
        name -> Text,
        description -> Text,
        value -> Text,
        visible -> Bool,
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
    achievements,
    functions,
    games,
    loot,
    maps,
    objects,
    playerachievements,
    playerquests,
    playerstatistics,
    settings,
    statistics,
    storyline,
);
