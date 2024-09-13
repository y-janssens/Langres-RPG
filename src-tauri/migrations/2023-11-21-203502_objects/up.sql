-- Your SQL goes here
CREATE TABLE objects (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    value TEXT,
    area TEXT NOT NULL,
    walkable BOOLEAN NOT NULL,
    interactive BOOLEAN NOT NULL
);

INSERT INTO objects (name, value, area, interactive, walkable)
VALUES
    -- Base
    ('start', NULL, json('{"x": 1, "y": 1}'), 0, 1),
    ('gate', NULL, json('{"x": 1, "y": 1}'), 0, 1),
    -- Landscape
    ('grass', '-', json('{"x": 1, "y": 1}'), 0, 1),
    ('clearing', 'C', json('{"x": 1, "y": 1}'), 0, 1),
    ('tree', 'T', json('{"x": 1, "y": 1}'), 0, 0),
    ('road', 'R', json('{"x": 1, "y": 1}'), 0, 1),
    ('water', 'W', json('{"x": 1, "y": 1}'), 0, 0),
    ('shore', 'S', json('{"x": 1, "y": 1}'), 0, 1),
    -- Objects
    ('bridge', 'BR', json('{"x": 1, "y": 1}'), 1, 1),
    ('house', 'H', json('{"x": 0, "y": 0}'), 1, 1),
    ('house', 'H_1', json('{"x": 1, "y": 1}'), 1, 1),
    ('house', 'H_2', json('{"x": 2, "y": 2}'), 1, 1);
