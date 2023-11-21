-- Your SQL goes here
CREATE TABLE objects (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    value TEXT,
    area TEXT NOT NULL
);

INSERT INTO objects (name, value, area)
VALUES
    ('start', NULL, json('{"x": 1, "y": 1}')),
    ('clear', '-', json('{"x": 1, "y": 1}')),
    ('tree', 'F', json('{"x": 1, "y": 1}')),
    ('tree', 'T', json('{"x": 1, "y": 1}')),
    ('rock', 'R', json('{"x": 1, "y": 1}')),
    ('water', 'W', json('{"x": 1, "y": 1}')),
    ('bridge', 'BR', json('{"x": 1, "y": 1}'));
