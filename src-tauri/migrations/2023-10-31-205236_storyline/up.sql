-- Your SQL goes here
CREATE TABLE "storyline" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    created TEXT NOT NULL,
    modified TEXT NOT NULL
);

INSERT INTO
    "storyline"(id, name, created, modified)
VALUES
(1, 'Scénario', '2023-03-23 17:54:05.174732 +01:00', '2024-03-08 17:54:05.174732 +01:00')