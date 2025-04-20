-- Your SQL goes here
CREATE TABLE functions (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    icon TEXT NOT NULL,
    label TEXT NOT NULL,
    command TEXT NOT NULL
);

INSERT INTO functions (icon, label, command)
VALUES
    ('trees', 'Generate forest', 'generate_forest'),
    ('reload', 'Regenerate Map', 'regenerate'),
    ('clear', 'Clear Map', 'clear'),
    ('npc', 'Generate Npcs', 'generate_npcs'),
    ('clear', 'Clear Npcs', 'clear_npcs');