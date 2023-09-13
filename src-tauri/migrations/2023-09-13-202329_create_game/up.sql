-- Your SQL goes here
CREATE TABLE "game" (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    player TEXT NOT NULL,
    date_created TEXT NOT NULL,
    last_save_date TEXT,
    save_count INTEGER NOT NULL,
    character Text,
    world Text
);

INSERT INTO
    "game"(player, date_created, last_save_date, save_count)
VALUES
("Adam de Corveil", "2023-09-08 21:51:25.746416 +02:00", "2023-09-09 18:01:28.216002 +02:00", 1);