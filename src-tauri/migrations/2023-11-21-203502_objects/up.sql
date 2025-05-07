-- Your SQL goes here
CREATE TABLE objects (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    value TEXT,
    display_value TEXT,
    display_color TEXT,
    area TEXT NOT NULL,
    walkable BOOLEAN NOT NULL,
    interactive BOOLEAN NOT NULL
);

INSERT INTO objects (name, value, display_value, display_color, area, interactive, walkable)
VALUES
    -- Base
    ('start', NULL, NULL, NULL, json('{"x": 1, "y": 1}'), 0, 1),
    ('gate', NULL, NULL, NULL, json('{"x": 1, "y": 1}'), 0, 1),
    ('npc', NULL, NULL, NULL, json('{"x": 1, "y": 1}'), 0, 1),
    -- Landscape
    ('grass', '-', 'grass', '#BDB76B', json('{"x": 1, "y": 1}'), 0, 1),
    ('clearing', 'C', 'border', '#C8FF1380', json('{"x": 1, "y": 1}'), 0, 1),
    ('tree', 'T', 'tree', '#5EDB35CC', json('{"x": 1, "y": 1}'), 0, 0),
    ('road', 'R', 'road', '#DBD257', json('{"x": 1, "y": 1}'), 0, 1),
    ('water', 'W', 'water', '#87CEFA', json('{"x": 1, "y": 1}'), 0, 0),
    ('shore', 'S', 'shore', '#DBD257', json('{"x": 1, "y": 1}'), 0, 1),
    -- ('ground', 'G', 'ground', '#D2B48C', json('{"x": 1, "y": 1}'), 0, 1),
    -- ('mud', 'M', 'mud', '#654321', json('{"x": 1, "y": 1}'), 0, 1),
    -- ('fence', 'F', 'fence', '#D2B48C', json('{"x": 1, "y": 1}'), 0, 1),
    -- Objects
    ('bridge', 'BR', NULL, NULL, json('{"x": 1, "y": 1}'), 1, 1),
    ('house', 'H', NULL, NULL, json('{"x": 0, "y": 0}'), 1, 1),
    ('house', 'H_1', NULL, NULL, json('{"x": 1, "y": 1}'), 1, 1),
    ('house', 'H_2', NULL, NULL, json('{"x": 2, "y": 2}'), 1, 1);
    