-- Your SQL goes here
CREATE TABLE "games" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    player TEXT NOT NULL,
    date_created TEXT NOT NULL,
    last_save_date TEXT NOT NULL,
    save_count INTEGER NOT NULL,
    character TEXT NOT NULL,
    storyline TEXT NOT NULL,
    last_known_position TEXT NOT NULL
);