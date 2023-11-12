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
          "title": "Prologue",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 446550365,
          "order": 1,
          "name": "Act I",
          "title": "Genesis",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 537592778,
          "order": 2,
          "name": "Act II",
          "title": "Ascension",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 793918571,
          "order": 3,
          "name": "Act III",
          "title": "Disgrace",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 199621441,
          "order": 4,
          "name": "Act IV",
          "title": "Retribution",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 129539177,
          "order": 5,
          "name": "Act V",
          "title": "Exile",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 2119487075,
          "order": 6,
          "name": "Act VI",
          "title": "Loneliness",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 550184858,
          "order": 7,
          "name": "Act VII",
          "title": "Aftermath",
          "content": {
            "maps": []
          },
          "complete": false
        }
      ]
'));




