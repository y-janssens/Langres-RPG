-- Your SQL goes here
CREATE TABLE playerquests (
    id TEXT NOT NULL PRIMARY KEY,
    quest_id TEXT NOT NULL,
    game_id TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    "primary" BOOLEAN NOT NULL,
    status TEXT NOT NULL,
    visible BOOLEAN NOT NULL,
    reward INTEGER NOT NULL,
    next TEXT
);