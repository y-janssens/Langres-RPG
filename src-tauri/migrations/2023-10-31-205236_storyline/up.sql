-- Your SQL goes here
CREATE TABLE "storyline" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    story TEXT NOT NULL
);

INSERT INTO
    "storyline"(story)
VALUES
(json('
      [
        {
          "id": 1323375008,
          "order": 0,
          "name": "Act I",
          "title": "Rétribution",
          "date": "21/09/1164",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 446550365,
          "order": 1,
          "name": "Act I",
          "title": "Prologue",
          "date": "02/06/1164",
          "content": {
            "maps": []
          },
          "complete": false
        }
      ]
'));




