-- Your SQL goes here
CREATE TABLE playerachievements (
    id TEXT NOT NULL PRIMARY KEY,
    achievement_id TEXT NOT NULL,
    game_id TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    completed BOOLEAN NOT NULL
);