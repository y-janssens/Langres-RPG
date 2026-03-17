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
    collections (id) {
        id -> Integer,
        map -> Text,
        created -> Text,
        modified -> Text,
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
        random -> Nullable<Integer>,
        parade -> Nullable<Integer>,
        price -> Nullable<Integer>,
        weight -> Nullable<Integer>,
    }
}

diesel::table! {
    npc (id) {
        id -> Text,
        first_name -> Text,
        last_name -> Text,
        title -> Text,
        class -> Text,
        end -> Integer,
        #[sql_name = "for"]
        for_ -> Integer,
        hab -> Integer,
        cha -> Integer,
        int -> Integer,
        ini -> Integer,
        att -> Integer,
        par -> Integer,
        tir -> Integer,
        ap -> Integer,
        pv -> Integer,
        max_ap -> Integer,
        max_pv -> Integer,
        lvl -> Integer,
        gender -> Text,
        map_id -> Integer,
        unique -> Bool,
        #[sql_name = "static"]
        static_ -> Bool,
        hostile -> Bool,
        can_be_hostile -> Bool,
        is_alive -> Bool,
        inventory -> Text,
        quests -> Text,
        dialogs -> Text,
        starting_point -> Text,
    }
}

diesel::table! {
    objects (id) {
        id -> Integer,
        name -> Text,
        value -> Nullable<Text>,
        display_value -> Nullable<Text>,
        display_color -> Nullable<Text>,
        texture -> Nullable<Text>,
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
    quests (id) {
        id -> Text,
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
    settings (id) {
        id -> Integer,
        language -> Text,
        languages -> Text,
        sound -> Bool,
        volume -> Integer,
        music -> Integer,
        difficulty -> Integer,
        battle_realtime -> Bool,
        battle_automatic -> Bool,
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
        acts -> Text,
    }
}

diesel::allow_tables_to_appear_in_same_query!(
    achievements,
    collections,
    functions,
    games,
    loot,
    npc,
    objects,
    playerachievements,
    playerquests,
    playerstatistics,
    quests,
    settings,
    statistics,
    storyline,
);
