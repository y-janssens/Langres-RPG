-- Your SQL goes here
CREATE TABLE achievements (
    id TEXT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    completed BOOLEAN NOT NULL
);