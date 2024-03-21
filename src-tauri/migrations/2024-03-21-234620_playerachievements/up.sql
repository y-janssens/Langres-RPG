-- Your SQL goes here
CREATE TABLE playerachievements (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    achievement_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    completed BOOLEAN NOT NULL
);