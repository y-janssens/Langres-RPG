-- Your SQL goes here
CREATE TABLE quests (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    "primary" BOOLEAN NOT NULL,
    status TEXT NOT NULL,
    visible BOOLEAN NOT NULL
);