-- Your SQL goes here
CREATE TABLE objects (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    value TEXT,
    display_value TEXT,
    display_color TEXT,
    texture TEXT,
    area TEXT NOT NULL,
    walkable BOOLEAN NOT NULL,
    interactive BOOLEAN NOT NULL
);