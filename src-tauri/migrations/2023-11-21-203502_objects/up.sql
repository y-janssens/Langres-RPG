-- Your SQL goes here
CREATE TABLE objects (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    value TEXT,
    area TEXT NOT NULL,
    walkable BOOLEAN NOT NULL
);

INSERT INTO objects (name, value, area, walkable)
VALUES
    ('start', NULL, json('{"x": 1, "y": 1}'), 1),
    ('gate', NULL, json('{"x": 1, "y": 1}'), 1),
    ('grass', '-', json('{"x": 1, "y": 1}'), 1),
    ('clearing', 'C', json('{"x": 1, "y": 1}'), 1),
    ('tree', 'T', json('{"x": 1, "y": 1}'), 0),
    ('road', 'R', json('{"x": 1, "y": 1}'), 1),
    ('water', 'W', json('{"x": 1, "y": 1}'), 0),
    ('shore', 'S', json('{"x": 1, "y": 1}'), 1),
    ('bridge', 'BR', json('{"x": 1, "y": 1}'), 1);
