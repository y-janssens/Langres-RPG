-- Your SQL goes here
CREATE TABLE playerstatistics (
    id TEXT NOT NULL PRIMARY KEY,
    game_id TEXT NOT NULL,
    statistic_id TEXT NOT NULL,
    name TEXT NOT NULL,
    value TEXT NOT NULL
);