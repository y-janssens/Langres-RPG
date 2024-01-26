-- Your SQL goes here
CREATE TABLE functions (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    icon TEXT NOT NULL,
    label TEXT NOT NULL,
    command TEXT NOT NULL
);

INSERT INTO functions (icon, label, command)
VALUES
    ('trees', 'Generate forest', 'generate_basic_map'),
    ('clear', 'Clear Map', 'regenerate');