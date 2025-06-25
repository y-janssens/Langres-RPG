-- Your SQL goes here
CREATE TABLE "settings" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    language TEXT NOT NULL,
    languages TEXT NOT NULL,
    sound BOOLEAN NOT NULL,
    volume INTEGER NOT NULL,
    music INTEGER NOT NULL,
    difficulty INTEGER NOT NULL,
    battle_realtime BOOLEAN NOT NULL,
    battle_automatic BOOLEAN NOT NULL
);

INSERT INTO "settings"(language, languages, sound, volume, music, difficulty, battle_realtime, battle_automatic)
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
'), 1, 100, 100, 0, 0, 0);