-- Your SQL goes here
CREATE TABLE functions (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    icon TEXT NOT NULL,
    label TEXT NOT NULL,
    command TEXT NOT NULL
);

INSERT INTO functions (icon, label, command)
VALUES
    ('trees', 'Generate Trees', 'populate_trees'),
    ('clear', 'Clear Map', 'regenerate');