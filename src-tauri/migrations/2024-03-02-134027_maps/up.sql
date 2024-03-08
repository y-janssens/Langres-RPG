-- Your SQL goes here
CREATE TABLE maps (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    map TEXT NOT NULL,
    created TEXT NOT NULL,
    modified TEXT NOT NULL,
    visible BOOLEAN NOT NULL
);
