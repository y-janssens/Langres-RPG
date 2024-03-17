-- Your SQL goes here
CREATE TABLE "settings" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    language TEXT NOT NULL,
    languages TEXT NOT NULL,
    sound BOOLEAN NOT NULL,
    volume INTEGER NOT NULL,
    music INTEGER NOT NULL
);

INSERT INTO "settings"(language, languages, sound, volume, music)
VALUES ("en", json('
[
  {
    "key": "en",
    "value": "English"
  },
  {
    "key": "fr",
    "value": "Français"
  }
]
'), 1, 100, 100);