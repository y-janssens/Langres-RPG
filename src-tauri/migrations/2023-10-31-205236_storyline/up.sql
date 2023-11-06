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
          "id": 0,
          "name": "Act I",
          "title": "Prologue",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 1,
          "name": "Act I",
          "title": "Genesis",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 2,
          "name": "Act II",
          "title": "Ascension",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 3,
          "name": "Act III",
          "title": "Disgrace",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 4,
          "name": "Act IV",
          "title": "Retribution",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 5,
          "name": "Act V",
          "title": "Exile",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 6,
          "name": "Act VI",
          "title": "Loneliness",
          "content": {
            "maps": []
          },
          "complete": false
        },
        {
          "id": 7,
          "name": "Act VII",
          "title": "Aftermath",
          "content": {
            "maps": []
          },
          "complete": false
        }
      ]
'));




