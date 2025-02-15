-- Your SQL goes here
CREATE TABLE "acts" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "order" INTEGER NOT NULL,
    name TEXT NOT NULL,
    title TEXT NOT NULL,
    date TEXT NOT NULL,
    complete BOOLEAN NOT NULL,
    storyline_id INTEGER NOT NULL
);

INSERT INTO
    "acts"(id, "order", name, title, date, complete, storyline_id)
VALUES
(1, 1, 'Act I', 'Rétribution', '21/09/1164', false, 1)

