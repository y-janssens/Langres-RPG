-- Your SQL goes here
CREATE TABLE "settings" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    language TEXT NOT NULL,
    sound BOOLEAN NOT NULL,
    volume INTEGER NOT NULL,
    music INTEGER NOT NULL
);

INSERT INTO "settings"(language, sound, volume, music)
VALUES ("en", 1, 100, 100);