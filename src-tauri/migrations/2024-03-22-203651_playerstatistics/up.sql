-- Your SQL goes here
CREATE TABLE playerstatistics (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    game_id INTEGER NOT NULL,
    statistic_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    value TEXT NOT NULL
);