-- Your SQL goes here
CREATE TABLE playerquests (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    quest_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    "primary" BOOLEAN NOT NULL,
    status TEXT NOT NULL,
    visible BOOLEAN NOT NULL
);