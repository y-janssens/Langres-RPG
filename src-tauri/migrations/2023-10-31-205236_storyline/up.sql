-- Your SQL goes here
CREATE TABLE "storyline" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    created TEXT NOT NULL,
    modified TEXT NOT NULL,
    story TEXT NOT NULL
);

INSERT INTO
    "storyline"(name, created, modified, story)
VALUES
('Scénario', '2023-03-23 17:54:05.174732 +01:00', '2024-03-08 17:54:05.174732 +01:00', json('
  [
    {
        "id": 1323375008,
        "order": 0,
        "name": "Act I",
        "title": "Rétribution",
        "date": "21/09/1164",
        "content": {
            "maps": [
                {
                    "complete": false,
                    "content": [
                        {
                            "id": 0,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 1,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 0,
                            "z": 1
                        },
                        {
                            "id": 2,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 0,
                            "z": 1
                        },
                        {
                            "id": 3,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 0,
                            "z": 1
                        },
                        {
                            "id": 4,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 0,
                            "z": 1
                        },
                        {
                            "id": 5,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 6,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 7,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 8,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 9,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 10,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 11,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 12,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 13,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 14,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 15,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 16,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 17,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 0,
                            "z": 1
                        },
                        {
                            "id": 18,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 19,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 20,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 21,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 22,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 45,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 23,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 24,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 25,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 26,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 27,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 28,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 29,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 59,
                            "y": 0,
                            "z": 4
                        },
                        {
                            "id": 30,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 61,
                            "y": 0,
                            "z": 4
                        },
                        {
                            "id": 31,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 63,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 32,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 33,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 34,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 69,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 35,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 71,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 36,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 73,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 37,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 38,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 39,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 40,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 41,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 42,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 43,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 44,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 45,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 46,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 47,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 48,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 49,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 50,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 51,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 52,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 53,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 54,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 55,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 56,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 57,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 58,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 59,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 60,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 61,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 62,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 63,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 64,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 65,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 66,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 67,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 68,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 69,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 70,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 40,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 71,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 42,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 72,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 44,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 73,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 46,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 74,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 75,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 50,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 76,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 52,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 77,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 54,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 78,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 56,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 79,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 58,
                            "y": 1,
                            "z": 4
                        },
                        {
                            "id": 80,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 60,
                            "y": 1,
                            "z": 4
                        },
                        {
                            "id": 81,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 62,
                            "y": 1,
                            "z": 4
                        },
                        {
                            "id": 82,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 83,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 66,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 84,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 68,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 85,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 70,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 86,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 72,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 87,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 74,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 88,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 89,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 90,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 91,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 92,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 93,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 94,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 95,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 96,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 97,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 98,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 99,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 100,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 101,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 102,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 103,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 104,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 105,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 106,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 107,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 108,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 109,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 110,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 111,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 112,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 113,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 114,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 115,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 116,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 117,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 118,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 119,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 120,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 121,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 122,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 45,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 123,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 124,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 125,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 126,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 53,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 127,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 128,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 129,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 59,
                            "y": 2,
                            "z": 4
                        },
                        {
                            "id": 130,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 61,
                            "y": 2,
                            "z": 4
                        },
                        {
                            "id": 131,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 132,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 133,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 134,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 69,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 135,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 71,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 136,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 137,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 138,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 139,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 140,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 141,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 142,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 143,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 144,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 145,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 146,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 147,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 95,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 148,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 149,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 150,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 151,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 152,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 153,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 154,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 155,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 156,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 157,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 158,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 159,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 160,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 161,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 162,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 163,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 164,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 165,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 166,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 167,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 168,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 169,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 170,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 40,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 171,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 42,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 172,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 44,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 173,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 46,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 174,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 175,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 50,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 176,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 52,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 177,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 54,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 178,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 56,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 179,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 58,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 180,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 60,
                            "y": 3,
                            "z": 4
                        },
                        {
                            "id": 181,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 62,
                            "y": 3,
                            "z": 4
                        },
                        {
                            "id": 182,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 183,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 184,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 185,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 70,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 186,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 187,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 188,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 189,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 190,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 191,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 192,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 193,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 194,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 195,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 196,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 197,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 198,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 199,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 200,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 201,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 202,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 203,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 204,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 205,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 206,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 207,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 208,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 209,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 210,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 211,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 212,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 213,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 214,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 215,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 216,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 217,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 218,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 219,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 220,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 221,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 222,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 45,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 223,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 224,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 225,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 226,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 227,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 228,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 229,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 59,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 230,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 61,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 231,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 232,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 233,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 234,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 235,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 236,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 237,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 75,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 238,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 239,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 240,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 241,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 242,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 243,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 244,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 245,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 246,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 247,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 248,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 249,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 250,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 251,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 252,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 253,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 6,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 254,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 255,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 256,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 257,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 258,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 259,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 260,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 261,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 262,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 263,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 264,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 265,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 266,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 267,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 268,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 269,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 270,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 40,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 271,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 42,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 272,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 44,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 273,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 46,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 274,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 275,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 50,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 276,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 52,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 277,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 54,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 278,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 56,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 279,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 58,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 280,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 60,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 281,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 62,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 282,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 283,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 284,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 285,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 286,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 287,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 288,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 289,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 290,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 291,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 292,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 293,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 294,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 295,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 296,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 297,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 298,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 299,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 300,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 301,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 302,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 303,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 304,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 9,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 305,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 11,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 306,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 307,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 308,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 309,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 310,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 311,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 312,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 313,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 314,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 315,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 316,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 317,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 318,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 319,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 320,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 321,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 322,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 45,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 323,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 47,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 324,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 325,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 51,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 326,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 327,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 55,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 328,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 329,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 59,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 330,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 61,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 331,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 332,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 333,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 334,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 69,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 335,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 336,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 337,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 338,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 339,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 340,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 341,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 342,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 343,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 344,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 345,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 346,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 347,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 348,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 349,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 350,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 351,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 352,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 353,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 354,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 355,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 10,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 356,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 12,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 357,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 358,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 359,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 360,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 361,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 362,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 363,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 364,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 365,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 366,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 367,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 368,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 369,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 370,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 40,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 371,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 42,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 372,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 44,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 373,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 46,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 374,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 375,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 50,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 376,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 52,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 377,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 378,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 56,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 379,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 58,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 380,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 381,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 382,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 64,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 383,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 384,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 385,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 386,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 387,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 388,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 389,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 390,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 391,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 392,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 393,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 394,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 395,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 396,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 397,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 398,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 399,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 400,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 401,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 402,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 403,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 404,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 405,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 11,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 406,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 407,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 408,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 409,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 410,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 411,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 412,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 413,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 414,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 415,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 416,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 417,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 418,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 419,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 420,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 421,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 422,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 45,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 423,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 424,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 425,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 426,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 53,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 427,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 428,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 429,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 430,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 431,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 432,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 433,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 434,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 435,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 8,
                            "z": 4
                        },
                        {
                            "id": 436,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 437,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 438,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 439,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 440,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 441,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 442,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 8,
                            "z": 0
                        },
                        {
                            "id": 443,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 8,
                            "z": 0
                        },
                        {
                            "id": 444,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 445,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 446,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 447,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 448,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 449,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 450,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 451,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 452,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 453,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 454,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 455,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 456,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 457,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 458,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 459,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 460,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 461,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 462,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 463,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 464,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 465,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 466,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 467,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 468,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 469,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 470,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 40,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 471,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 42,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 472,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 44,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 473,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 46,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 474,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 475,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 50,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 476,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 52,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 477,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 478,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 479,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 480,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 481,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 482,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 483,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 484,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 485,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 9,
                            "z": 4
                        },
                        {
                            "id": 486,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 72,
                            "y": 9,
                            "z": 4
                        },
                        {
                            "id": 487,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 488,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 489,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 490,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 491,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 492,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 9,
                            "z": 0
                        },
                        {
                            "id": 493,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 9,
                            "z": 0
                        },
                        {
                            "id": 494,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 9,
                            "z": 0
                        },
                        {
                            "id": 495,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 90,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 496,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 497,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 498,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 499,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 500,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 501,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 502,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 503,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 504,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 505,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 11,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 506,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 507,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 508,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 509,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 510,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 511,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 512,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 513,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 514,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 515,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 516,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 517,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 518,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 519,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 39,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 520,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 41,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 521,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 522,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 45,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 523,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 524,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 525,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 51,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 526,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 527,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 528,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 529,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 530,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 531,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 532,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 65,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 533,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 534,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 10,
                            "z": 4
                        },
                        {
                            "id": 535,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 10,
                            "z": 4
                        },
                        {
                            "id": 536,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 10,
                            "z": 4
                        },
                        {
                            "id": 537,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 538,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 539,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 540,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 541,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 542,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 10,
                            "z": 0
                        },
                        {
                            "id": 543,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 10,
                            "z": 0
                        },
                        {
                            "id": 544,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 10,
                            "z": 0
                        },
                        {
                            "id": 545,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 546,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 547,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 548,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 549,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 550,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 551,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 552,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 553,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 554,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 555,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 556,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 557,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 558,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 559,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 560,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 561,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 562,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 563,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 564,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 565,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 566,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 567,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 568,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 36,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 569,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 38,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 570,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 571,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 42,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 572,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 44,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 573,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 46,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 574,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 575,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 50,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 576,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 577,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 578,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 579,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 580,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 581,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 62,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 582,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 583,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 66,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 584,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 68,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 585,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 11,
                            "z": 4
                        },
                        {
                            "id": 586,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 11,
                            "z": 4
                        },
                        {
                            "id": 587,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 11,
                            "z": 4
                        },
                        {
                            "id": 588,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 589,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 590,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 591,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 592,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 593,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 11,
                            "z": 0
                        },
                        {
                            "id": 594,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 11,
                            "z": 0
                        },
                        {
                            "id": 595,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 90,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 596,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 597,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 598,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 599,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 600,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 601,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 602,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 603,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 604,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 605,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 606,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 607,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 608,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 609,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 610,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 611,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 612,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 613,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 614,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 615,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 616,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 33,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 617,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 35,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 618,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 619,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 620,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 621,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 622,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 45,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 623,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 47,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 624,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 49,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 625,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 626,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 627,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 628,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 629,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 630,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 631,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 632,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 65,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 633,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 634,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 635,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 12,
                            "z": 4
                        },
                        {
                            "id": 636,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 12,
                            "z": 4
                        },
                        {
                            "id": 637,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 12,
                            "z": 4
                        },
                        {
                            "id": 638,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 639,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 640,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 641,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 642,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 643,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 12,
                            "z": 0
                        },
                        {
                            "id": 644,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 645,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 646,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 647,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 648,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 649,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 12,
                            "z": 4
                        },
                        {
                            "id": 650,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 651,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 652,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 653,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 654,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 655,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 656,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 657,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 658,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 659,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 660,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 661,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 662,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 663,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 664,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 665,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 666,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 667,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 668,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 669,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 670,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 671,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 672,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 673,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 674,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 48,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 675,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 50,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 676,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 677,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 678,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 679,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 680,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 681,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 682,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 683,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 684,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 685,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 686,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 13,
                            "z": 4
                        },
                        {
                            "id": 687,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 13,
                            "z": 4
                        },
                        {
                            "id": 688,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 689,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 690,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 691,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 692,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 693,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 694,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 695,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 696,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 697,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 698,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 699,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 13,
                            "z": 4
                        },
                        {
                            "id": 700,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 701,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 702,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 703,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 704,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 705,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 706,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 707,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 708,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 709,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 710,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 711,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 712,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 713,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 714,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 715,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 716,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 717,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 718,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 719,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 39,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 720,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 721,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 722,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 723,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 724,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 725,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 726,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 727,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 728,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 729,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 730,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 731,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 732,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 733,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 734,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 735,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 736,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 14,
                            "z": 4
                        },
                        {
                            "id": 737,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 14,
                            "z": 4
                        },
                        {
                            "id": 738,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 739,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 740,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 741,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 742,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 743,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 744,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 745,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 746,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 747,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 748,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 14,
                            "z": 4
                        },
                        {
                            "id": 749,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 14,
                            "z": 4
                        },
                        {
                            "id": 750,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 751,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 752,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 753,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 754,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 755,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 756,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 757,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 758,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 759,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 760,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 761,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 762,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 763,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 764,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 765,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 766,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 767,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 768,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 769,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 770,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 771,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 772,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 773,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 774,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 15,
                            "z": 4
                        },
                        {
                            "id": 775,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 776,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 52,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 777,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 778,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 779,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 780,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 781,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 782,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 783,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 66,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 784,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 68,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 785,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 786,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 15,
                            "z": 4
                        },
                        {
                            "id": 787,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 15,
                            "z": 4
                        },
                        {
                            "id": 788,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 15,
                            "z": 4
                        },
                        {
                            "id": 789,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 790,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 791,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 792,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 793,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 794,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 795,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 796,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 797,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 798,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 799,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 15,
                            "z": 4
                        },
                        {
                            "id": 800,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 801,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 802,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 803,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 804,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 805,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 806,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 807,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 808,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 809,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 810,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 811,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 812,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 813,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 814,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 815,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 816,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 33,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 817,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 818,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 819,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 820,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 821,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 822,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 823,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 824,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 825,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 826,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 827,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 828,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 829,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 830,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 831,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 832,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 65,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 833,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 834,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 69,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 835,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 836,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 837,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 838,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 839,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 840,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 841,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 842,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 843,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 844,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 845,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 846,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 847,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 848,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 849,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 16,
                            "z": 5
                        },
                        {
                            "id": 850,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 851,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 852,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 853,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 854,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 855,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 856,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 857,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 858,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 859,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 860,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 861,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 22,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 862,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 24,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 863,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 864,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 865,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 866,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 32,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 867,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 34,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 868,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 869,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 38,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 870,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 871,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 872,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 873,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 874,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 875,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 876,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 52,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 877,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 878,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 56,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 879,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 880,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 881,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 882,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 883,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 66,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 884,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 68,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 885,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 70,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 886,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 887,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 888,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 889,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 890,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 891,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 892,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 893,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 894,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 895,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 896,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 897,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 898,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 899,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 17,
                            "z": 5
                        },
                        {
                            "id": 900,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 901,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 902,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 903,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 904,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 905,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 906,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 907,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 908,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 909,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 910,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 911,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 912,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 913,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 914,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 915,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 31,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 916,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 33,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 917,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 35,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 918,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 37,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 919,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 39,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 920,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 41,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 921,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 922,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 923,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 924,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 49,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 925,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 926,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 927,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 928,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 929,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 930,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 18,
                            "z": 1
                        },
                        {
                            "id": 931,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 18,
                            "z": 1
                        },
                        {
                            "id": 932,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 18,
                            "z": 1
                        },
                        {
                            "id": 933,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 934,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 69,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 935,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 936,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 937,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 938,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 939,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 940,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 941,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 942,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 943,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 944,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 945,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 946,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 947,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 95,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 948,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 949,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 18,
                            "z": 5
                        },
                        {
                            "id": 950,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 951,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 952,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 953,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 954,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 955,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 956,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 957,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 958,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 959,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 960,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 961,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 22,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 962,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 963,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 964,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 965,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 966,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 32,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 967,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 34,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 968,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 969,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 38,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 970,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 971,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 972,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 973,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 19,
                            "z": 5
                        },
                        {
                            "id": 974,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 48,
                            "y": 19,
                            "z": 5
                        },
                        {
                            "id": 975,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 50,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 976,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 52,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 977,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 978,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 979,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 980,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 19,
                            "z": 1
                        },
                        {
                            "id": 981,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 19,
                            "z": 1
                        },
                        {
                            "id": 982,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 19,
                            "z": 1
                        },
                        {
                            "id": 983,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 66,
                            "y": 19,
                            "z": 1
                        },
                        {
                            "id": 984,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 68,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 985,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 986,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 987,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 988,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 989,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 990,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 991,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 992,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 993,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 994,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 995,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 996,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 997,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 998,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 999,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 19,
                            "z": 5
                        },
                        {
                            "id": 1000,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1001,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1002,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1003,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1004,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1005,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1006,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1007,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1008,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1009,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1010,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1011,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 23,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1012,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1013,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1014,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1015,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1016,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1017,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1018,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1019,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1020,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 41,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1021,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1022,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 20,
                            "z": 5
                        },
                        {
                            "id": 1023,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 47,
                            "y": 20,
                            "z": 5
                        },
                        {
                            "id": 1024,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 49,
                            "y": 20,
                            "z": 5
                        },
                        {
                            "id": 1025,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1026,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 53,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1027,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1028,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 57,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1029,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1030,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 20,
                            "z": 1
                        },
                        {
                            "id": 1031,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 63,
                            "y": 20,
                            "z": 1
                        },
                        {
                            "id": 1032,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 20,
                            "z": 1
                        },
                        {
                            "id": 1033,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1034,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1035,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1036,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1037,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1038,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1039,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1040,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1041,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1042,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 85,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1043,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1044,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1045,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1046,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1047,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1048,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 20,
                            "z": 5
                        },
                        {
                            "id": 1049,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 20,
                            "z": 5
                        },
                        {
                            "id": 1050,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1051,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1052,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1053,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 6,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1054,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1055,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1056,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1057,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1058,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1059,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1060,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1061,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 22,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1062,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 24,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1063,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1064,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1065,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1066,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1067,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1068,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1069,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1070,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1071,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1072,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 21,
                            "z": 5
                        },
                        {
                            "id": 1073,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 21,
                            "z": 5
                        },
                        {
                            "id": 1074,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 21,
                            "z": 5
                        },
                        {
                            "id": 1075,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 50,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1076,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 52,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1077,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 54,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1078,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1079,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1080,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1081,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 62,
                            "y": 21,
                            "z": 1
                        },
                        {
                            "id": 1082,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 21,
                            "z": 1
                        },
                        {
                            "id": 1083,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 21,
                            "z": 1
                        },
                        {
                            "id": 1084,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1085,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1086,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1087,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1088,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1089,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1090,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1091,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1092,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1093,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1094,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1095,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1096,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1097,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1098,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1099,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1100,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1101,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1102,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1103,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1104,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 9,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1105,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 11,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1106,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 13,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1107,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1108,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1109,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1110,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1111,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 23,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1112,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1113,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1114,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1115,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1116,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1117,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1118,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1119,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1120,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1121,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1122,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1123,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 47,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1124,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1125,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1126,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 53,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1127,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1128,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1129,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1130,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 61,
                            "y": 22,
                            "z": 1
                        },
                        {
                            "id": 1131,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 63,
                            "y": 22,
                            "z": 1
                        },
                        {
                            "id": 1132,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 22,
                            "z": 1
                        },
                        {
                            "id": 1133,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1134,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1135,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1136,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1137,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1138,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1139,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 79,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1140,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1141,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1142,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1143,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1144,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1145,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1146,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1147,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1148,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1149,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1150,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1151,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1152,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1153,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1154,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1155,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 10,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1156,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 12,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1157,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1158,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1159,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1160,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1161,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 22,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1162,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1163,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1164,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1165,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1166,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1167,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 34,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1168,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 36,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1169,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1170,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1171,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1172,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1173,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 46,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1174,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1175,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1176,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1177,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1178,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1179,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1180,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 60,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1181,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 62,
                            "y": 23,
                            "z": 1
                        },
                        {
                            "id": 1182,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 23,
                            "z": 1
                        },
                        {
                            "id": 1183,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1184,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1185,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1186,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1187,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1188,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1189,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1190,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1191,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1192,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1193,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1194,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1195,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1196,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1197,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1198,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1199,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1200,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1201,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1202,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1203,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1204,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1205,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 11,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1206,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1207,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1208,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1209,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1210,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1211,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 23,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1212,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1213,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1214,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1215,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1216,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 33,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1217,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 35,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1218,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1219,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1220,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1221,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 24,
                            "z": 4
                        },
                        {
                            "id": 1222,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 24,
                            "z": 4
                        },
                        {
                            "id": 1223,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 24,
                            "z": 4
                        },
                        {
                            "id": 1224,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 24,
                            "z": 4
                        },
                        {
                            "id": 1225,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 51,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1226,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1227,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1228,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1229,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1230,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1231,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 24,
                            "z": 1
                        },
                        {
                            "id": 1232,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1233,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1234,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1235,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1236,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1237,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1238,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1239,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1240,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1241,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1242,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1243,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1244,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1245,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1246,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1247,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1248,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1249,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 24,
                            "z": 4
                        },
                        {
                            "id": 1250,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1251,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1252,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1253,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1254,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1255,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1256,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1257,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1258,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1259,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1260,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1261,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1262,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1263,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1264,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1265,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1266,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 32,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1267,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 34,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1268,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1269,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 38,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1270,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1271,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1272,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 25,
                            "z": 4
                        },
                        {
                            "id": 1273,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 25,
                            "z": 4
                        },
                        {
                            "id": 1274,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1275,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1276,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1277,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 54,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1278,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1279,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1280,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 60,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1281,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 62,
                            "y": 25,
                            "z": 1
                        },
                        {
                            "id": 1282,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1283,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1284,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1285,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1286,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1287,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1288,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1289,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1290,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1291,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1292,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1293,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1294,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1295,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1296,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1297,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1298,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1299,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1300,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1301,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1302,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1303,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1304,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1305,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1306,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1307,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1308,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1309,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1310,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1311,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1312,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1313,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1314,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1315,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1316,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 33,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1317,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1318,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1319,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1320,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1321,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1322,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1323,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1324,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 49,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1325,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 51,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1326,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1327,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1328,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 57,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1329,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1330,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 61,
                            "y": 26,
                            "z": 1
                        },
                        {
                            "id": 1331,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 63,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1332,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 65,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1333,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1334,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1335,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 71,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1336,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1337,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1338,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1339,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1340,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1341,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1342,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1343,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1344,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1345,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1346,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1347,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1348,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1349,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1350,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1351,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1352,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 4,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1353,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1354,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1355,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1356,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1357,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1358,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1359,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1360,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1361,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1362,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 24,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1363,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1364,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 28,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1365,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 30,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1366,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 32,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1367,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 27,
                            "z": 1
                        },
                        {
                            "id": 1368,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 27,
                            "z": 1
                        },
                        {
                            "id": 1369,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1370,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1371,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1372,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 44,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1373,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1374,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1375,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1376,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1377,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1378,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1379,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1380,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 27,
                            "z": 1
                        },
                        {
                            "id": 1381,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 62,
                            "y": 27,
                            "z": 1
                        },
                        {
                            "id": 1382,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1383,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1384,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1385,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 70,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1386,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 72,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1387,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 74,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1388,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1389,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1390,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1391,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1392,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1393,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1394,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1395,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1396,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1397,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1398,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1399,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1400,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1401,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1402,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1403,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1404,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1405,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1406,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1407,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1408,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1409,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1410,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1411,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 23,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1412,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1413,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 27,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1414,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 29,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1415,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 31,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1416,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 33,
                            "y": 28,
                            "z": 1
                        },
                        {
                            "id": 1417,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 28,
                            "z": 1
                        },
                        {
                            "id": 1418,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 28,
                            "z": 1
                        },
                        {
                            "id": 1419,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1420,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1421,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1422,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1423,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1424,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1425,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1426,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1427,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1428,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1429,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 28,
                            "z": 1
                        },
                        {
                            "id": 1430,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 28,
                            "z": 1
                        },
                        {
                            "id": 1431,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1432,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1433,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1434,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1435,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 71,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1436,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 73,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1437,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1438,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1439,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1440,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1441,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1442,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 85,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1443,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1444,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1445,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1446,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1447,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1448,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1449,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1450,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1451,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1452,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 4,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1453,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 6,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1454,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1455,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1456,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1457,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1458,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1459,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1460,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1461,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 22,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1462,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 24,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1463,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1464,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 28,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1465,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 30,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1466,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 32,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1467,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 34,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1468,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1469,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 38,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1470,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1471,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1472,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1473,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 46,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1474,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1475,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1476,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 52,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1477,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 54,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1478,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1479,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1480,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1481,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1482,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1483,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1484,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1485,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1486,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1487,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1488,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1489,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1490,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1491,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1492,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1493,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1494,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1495,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 90,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1496,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1497,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1498,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1499,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1500,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1501,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1502,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1503,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1504,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1505,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1506,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1507,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1508,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1509,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1510,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1511,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1512,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1513,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1514,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 29,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1515,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 31,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1516,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 33,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1517,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 35,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1518,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1519,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1520,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1521,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1522,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1523,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1524,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1525,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 51,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1526,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1527,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1528,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1529,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1530,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1531,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 63,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1532,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1533,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1534,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1535,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 71,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1536,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 73,
                            "y": 30,
                            "z": 4
                        },
                        {
                            "id": 1537,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 30,
                            "z": 4
                        },
                        {
                            "id": 1538,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1539,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1540,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1541,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1542,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1543,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1544,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1545,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1546,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1547,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1548,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1549,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1550,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1551,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1552,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1553,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1554,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1555,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1556,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1557,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1558,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1559,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1560,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1561,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1562,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1563,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1564,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1565,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1566,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 32,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1567,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1568,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1569,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1570,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1571,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1572,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1573,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1574,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1575,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 50,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1576,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1577,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1578,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1579,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1580,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1581,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 62,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1582,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1583,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 31,
                            "z": 3
                        },
                        {
                            "id": 1584,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 31,
                            "z": 3
                        },
                        {
                            "id": 1585,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 31,
                            "z": 3
                        },
                        {
                            "id": 1586,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1587,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1588,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1589,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1590,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1591,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1592,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 31,
                            "z": 3
                        },
                        {
                            "id": 1593,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 31,
                            "z": 3
                        },
                        {
                            "id": 1594,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1595,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1596,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1597,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1598,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1599,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1600,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1601,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1602,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1603,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1604,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1605,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1606,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1607,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1608,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1609,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1610,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1611,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1612,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1613,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1614,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1615,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1616,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1617,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1618,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1619,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1620,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 41,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1621,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1622,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1623,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1624,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1625,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 51,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1626,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1627,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1628,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1629,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1630,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1631,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1632,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 32,
                            "z": 3
                        },
                        {
                            "id": 1633,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 32,
                            "z": 3
                        },
                        {
                            "id": 1634,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 32,
                            "z": 3
                        },
                        {
                            "id": 1635,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1636,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1637,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1638,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1639,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1640,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1641,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1642,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 32,
                            "z": 3
                        },
                        {
                            "id": 1643,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1644,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1645,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 91,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1646,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1647,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1648,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1649,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1650,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1651,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1652,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1653,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1654,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1655,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1656,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1657,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1658,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1659,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1660,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1661,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1662,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1663,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1664,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1665,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1666,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1667,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1668,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1669,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1670,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1671,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1672,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1673,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1674,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1675,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 50,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1676,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1677,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1678,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 33,
                            "z": 0
                        },
                        {
                            "id": 1679,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1680,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 60,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1681,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 62,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1682,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 33,
                            "z": 3
                        },
                        {
                            "id": 1683,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 33,
                            "z": 3
                        },
                        {
                            "id": 1684,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 68,
                            "y": 33,
                            "z": 3
                        },
                        {
                            "id": 1685,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1686,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1687,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 74,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1688,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1689,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1690,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1691,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1692,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 33,
                            "z": 3
                        },
                        {
                            "id": 1693,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 33,
                            "z": 3
                        },
                        {
                            "id": 1694,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1695,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 90,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1696,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1697,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1698,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1699,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1700,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1701,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1702,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1703,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1704,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1705,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1706,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1707,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1708,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1709,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1710,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1711,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1712,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1713,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1714,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1715,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1716,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1717,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1718,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1719,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1720,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 41,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1721,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1722,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1723,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1724,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1725,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 51,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1726,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1727,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 34,
                            "z": 0
                        },
                        {
                            "id": 1728,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 34,
                            "z": 0
                        },
                        {
                            "id": 1729,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1730,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1731,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 63,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1732,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 34,
                            "z": 3
                        },
                        {
                            "id": 1733,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 34,
                            "z": 3
                        },
                        {
                            "id": 1734,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 34,
                            "z": 3
                        },
                        {
                            "id": 1735,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1736,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1737,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 75,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1738,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1739,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 79,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1740,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1741,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1742,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 34,
                            "z": 3
                        },
                        {
                            "id": 1743,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1744,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1745,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1746,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1747,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1748,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1749,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1750,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1751,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1752,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1753,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1754,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1755,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1756,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1757,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1758,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1759,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1760,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1761,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1762,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1763,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1764,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1765,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1766,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1767,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 34,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1768,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1769,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1770,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1771,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 42,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1772,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1773,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 46,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1774,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1775,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1776,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1777,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1778,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1779,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1780,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1781,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1782,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1783,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 66,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1784,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 68,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1785,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1786,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1787,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1788,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1789,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1790,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1791,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1792,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1793,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1794,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1795,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 90,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1796,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1797,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1798,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1799,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1800,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1801,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1802,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1803,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1804,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1805,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1806,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1807,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1808,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1809,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1810,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1811,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1812,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1813,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1814,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1815,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1816,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1817,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 35,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1818,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1819,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1820,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1821,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1822,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1823,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1824,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1825,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1826,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1827,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1828,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1829,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 59,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1830,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1831,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1832,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 65,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1833,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 67,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1834,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 69,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1835,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1836,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1837,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1838,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1839,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1840,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1841,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1842,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 85,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1843,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1844,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1845,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1846,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1847,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1848,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1849,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1850,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1851,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1852,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1853,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1854,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1855,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1856,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1857,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1858,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1859,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1860,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1861,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1862,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1863,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1864,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1865,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1866,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1867,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 34,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1868,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1869,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1870,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1871,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 42,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1872,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1873,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 46,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1874,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 48,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1875,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1876,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1877,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 54,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1878,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1879,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1880,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1881,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 62,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1882,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1883,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 66,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1884,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 68,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1885,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1886,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1887,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1888,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1889,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1890,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1891,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1892,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1893,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1894,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1895,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1896,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1897,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1898,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1899,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1900,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1901,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1902,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1903,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1904,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1905,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 11,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1906,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1907,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1908,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1909,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1910,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1911,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1912,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1913,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1914,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1915,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1916,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 38,
                            "z": 4
                        },
                        {
                            "id": 1917,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1918,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1919,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1920,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 41,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1921,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1922,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 45,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1923,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 47,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1924,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1925,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1926,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1927,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1928,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1929,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 59,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1930,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1931,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 63,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1932,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 65,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1933,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 67,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1934,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1935,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1936,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1937,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 75,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1938,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1939,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1940,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1941,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1942,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 85,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1943,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1944,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1945,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1946,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1947,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1948,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1949,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1950,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1951,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1952,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1953,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 39,
                            "z": 1
                        },
                        {
                            "id": 1954,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 39,
                            "z": 1
                        },
                        {
                            "id": 1955,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1956,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 12,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1957,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1958,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1959,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1960,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1961,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1962,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1963,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1964,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1965,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1966,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 39,
                            "z": 4
                        },
                        {
                            "id": 1967,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 39,
                            "z": 4
                        },
                        {
                            "id": 1968,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1969,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1970,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1971,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 42,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1972,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 44,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1973,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1974,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 48,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1975,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1976,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1977,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1978,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 39,
                            "z": 1
                        },
                        {
                            "id": 1979,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 39,
                            "z": 1
                        },
                        {
                            "id": 1980,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 60,
                            "y": 39,
                            "z": 1
                        },
                        {
                            "id": 1981,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 62,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1982,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 64,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1983,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 66,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1984,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 68,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1985,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1986,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1987,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1988,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1989,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1990,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1991,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1992,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1993,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1994,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1995,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1996,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1997,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1998,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1999,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 2000,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2001,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2002,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2003,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 40,
                            "z": 1
                        },
                        {
                            "id": 2004,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 40,
                            "z": 1
                        },
                        {
                            "id": 2005,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 11,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2006,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 13,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2007,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2008,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2009,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2010,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2011,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2012,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2013,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2014,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2015,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 40,
                            "z": 4
                        },
                        {
                            "id": 2016,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 40,
                            "z": 4
                        },
                        {
                            "id": 2017,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 40,
                            "z": 4
                        },
                        {
                            "id": 2018,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2019,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2020,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 41,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2021,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2022,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 45,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2023,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 47,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2024,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2025,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2026,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2027,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2028,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 57,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2029,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 40,
                            "z": 1
                        },
                        {
                            "id": 2030,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2031,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 63,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2032,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 65,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2033,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 67,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2034,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2035,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 71,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2036,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 73,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2037,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2038,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2039,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 79,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2040,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2041,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2042,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2043,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2044,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2045,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2046,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2047,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2048,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2049,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2050,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2051,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2052,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 4,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2053,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2054,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2055,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2056,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2057,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2058,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2059,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2060,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2061,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2062,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2063,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2064,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2065,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 41,
                            "z": 4
                        },
                        {
                            "id": 2066,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 41,
                            "z": 4
                        },
                        {
                            "id": 2067,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 41,
                            "z": 4
                        },
                        {
                            "id": 2068,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 41,
                            "z": 4
                        },
                        {
                            "id": 2069,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2070,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2071,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 42,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2072,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 44,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2073,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2074,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2075,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2076,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2077,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2078,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2079,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2080,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 60,
                            "y": 41,
                            "z": 1
                        },
                        {
                            "id": 2081,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 62,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2082,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2083,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 66,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2084,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 68,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2085,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 70,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2086,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 72,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2087,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2088,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2089,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2090,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2091,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2092,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2093,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2094,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2095,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2096,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2097,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2098,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2099,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2100,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2101,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2102,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2103,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2104,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2105,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2106,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2107,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2108,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2109,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2110,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2111,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2112,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2113,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2114,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2115,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 42,
                            "z": 4
                        },
                        {
                            "id": 2116,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 33,
                            "y": 42,
                            "z": 4
                        },
                        {
                            "id": 2117,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 42,
                            "z": 4
                        },
                        {
                            "id": 2118,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2119,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2120,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 41,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2121,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2122,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 45,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2123,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2124,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2125,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2126,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2127,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2128,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2129,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2130,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 42,
                            "z": 1
                        },
                        {
                            "id": 2131,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2132,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 65,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2133,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 67,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2134,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2135,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 71,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2136,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2137,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2138,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2139,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 79,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2140,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2141,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2142,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2143,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2144,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2145,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 91,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2146,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2147,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 95,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2148,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2149,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2150,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2151,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2152,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 4,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2153,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 6,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2154,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2155,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2156,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2157,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2158,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2159,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2160,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2161,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2162,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2163,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2164,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 43,
                            "z": 4
                        },
                        {
                            "id": 2165,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 43,
                            "z": 4
                        },
                        {
                            "id": 2166,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 43,
                            "z": 4
                        },
                        {
                            "id": 2167,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 43,
                            "z": 4
                        },
                        {
                            "id": 2168,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2169,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2170,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2171,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2172,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 44,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2173,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 46,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2174,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2175,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2176,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2177,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2178,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2179,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2180,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2181,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2182,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2183,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 66,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2184,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 68,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2185,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2186,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2187,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 74,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2188,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2189,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2190,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2191,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2192,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2193,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2194,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2195,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2196,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2197,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2198,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2199,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2200,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2201,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2202,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2203,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2204,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 9,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2205,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 11,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2206,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 13,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2207,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2208,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2209,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2210,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2211,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2212,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2213,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 44,
                            "z": 4
                        },
                        {
                            "id": 2214,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 44,
                            "z": 4
                        },
                        {
                            "id": 2215,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 44,
                            "z": 4
                        },
                        {
                            "id": 2216,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 44,
                            "z": 4
                        },
                        {
                            "id": 2217,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 44,
                            "z": 4
                        },
                        {
                            "id": 2218,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2219,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 39,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2220,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 41,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2221,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2222,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2223,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2224,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2225,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2226,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2227,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2228,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2229,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2230,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2231,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2232,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2233,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2234,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2235,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2236,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2237,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2238,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2239,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2240,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2241,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2242,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2243,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2244,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2245,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 91,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2246,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2247,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2248,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2249,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2250,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2251,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2252,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2253,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2254,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2255,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2256,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2257,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2258,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2259,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2260,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2261,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2262,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2263,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2264,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2265,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 45,
                            "z": 5
                        },
                        {
                            "id": 2266,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 45,
                            "z": 5
                        },
                        {
                            "id": 2267,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2268,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2269,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2270,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2271,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2272,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2273,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2274,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2275,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2276,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 52,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2277,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2278,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2279,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2280,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2281,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2282,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2283,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 66,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2284,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2285,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2286,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2287,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2288,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2289,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2290,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2291,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2292,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2293,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2294,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2295,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2296,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2297,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2298,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2299,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2300,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2301,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2302,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2303,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2304,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2305,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2306,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2307,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2308,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2309,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2310,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2311,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2312,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2313,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2314,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2315,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 46,
                            "z": 5
                        },
                        {
                            "id": 2316,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2317,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2318,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2319,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 39,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2320,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2321,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2322,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2323,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2324,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2325,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2326,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2327,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2328,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2329,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2330,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2331,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2332,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2333,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2334,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 69,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2335,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2336,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2337,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 75,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2338,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2339,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2340,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2341,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2342,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2343,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2344,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2345,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 91,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2346,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2347,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2348,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2349,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2350,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2351,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2352,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2353,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2354,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2355,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2356,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2357,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2358,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2359,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2360,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2361,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2362,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2363,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2364,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2365,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 47,
                            "z": 5
                        },
                        {
                            "id": 2366,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 47,
                            "z": 5
                        },
                        {
                            "id": 2367,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2368,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2369,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2370,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2371,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2372,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2373,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2374,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2375,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2376,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2377,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2378,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2379,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2380,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2381,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2382,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2383,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2384,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 68,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2385,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 70,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2386,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 72,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2387,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2388,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 47,
                            "z": 0
                        },
                        {
                            "id": 2389,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 47,
                            "z": 0
                        },
                        {
                            "id": 2390,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2391,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2392,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2393,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2394,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2395,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2396,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2397,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2398,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2399,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2400,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2401,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2402,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2403,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2404,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2405,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2406,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2407,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2408,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2409,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2410,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2411,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2412,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2413,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2414,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2415,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 48,
                            "z": 5
                        },
                        {
                            "id": 2416,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2417,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2418,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2419,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 39,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2420,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2421,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2422,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2423,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2424,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2425,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2426,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2427,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2428,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2429,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2430,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 61,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2431,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2432,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2433,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2434,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2435,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2436,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2437,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2438,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 48,
                            "z": 0
                        },
                        {
                            "id": 2439,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2440,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2441,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2442,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2443,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2444,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2445,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 91,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2446,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2447,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 95,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2448,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2449,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2450,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2451,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2452,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2453,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2454,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2455,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2456,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2457,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2458,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2459,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2460,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2461,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2462,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2463,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2464,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2465,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2466,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2467,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2468,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 36,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2469,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2470,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2471,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2472,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2473,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2474,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2475,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 50,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2476,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2477,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2478,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2479,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 58,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2480,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2481,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2482,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2483,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2484,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2485,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2486,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2487,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2488,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2489,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2490,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2491,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2492,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2493,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2494,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2495,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2496,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2497,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2498,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2499,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2500,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2501,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2502,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 50,
                            "z": 4
                        },
                        {
                            "id": 2503,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 50,
                            "z": 4
                        },
                        {
                            "id": 2504,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2505,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2506,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2507,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2508,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2509,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2510,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2511,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2512,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2513,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2514,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 50,
                            "z": 4
                        },
                        {
                            "id": 2515,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 50,
                            "z": 4
                        },
                        {
                            "id": 2516,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 50,
                            "z": 4
                        },
                        {
                            "id": 2517,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2518,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 37,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2519,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2520,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2521,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2522,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2523,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2524,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2525,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2526,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2527,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2528,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2529,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2530,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 61,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2531,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2532,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 65,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2533,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2534,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2535,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2536,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2537,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2538,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2539,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2540,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2541,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2542,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2543,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2544,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2545,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2546,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2547,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 95,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2548,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2549,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2550,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2551,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2552,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2553,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2554,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2555,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2556,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2557,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2558,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2559,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2560,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2561,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2562,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2563,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2564,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2565,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2566,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2567,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2568,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2569,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 38,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2570,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2571,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2572,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2573,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 51,
                            "z": 0
                        },
                        {
                            "id": 2574,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2575,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 50,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2576,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2577,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2578,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2579,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2580,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2581,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 62,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2582,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 64,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2583,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 66,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2584,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2585,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2586,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2587,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2588,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2589,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2590,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2591,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2592,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2593,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2594,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2595,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2596,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2597,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2598,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2599,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2600,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2601,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2602,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2603,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2604,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2605,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2606,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2607,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2608,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2609,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2610,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2611,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2612,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2613,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2614,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2615,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2616,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 33,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2617,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2618,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2619,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2620,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2621,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2622,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2623,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2624,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2625,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 51,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2626,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2627,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2628,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2629,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2630,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2631,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2632,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2633,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2634,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2635,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2636,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2637,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2638,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2639,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2640,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2641,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2642,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2643,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2644,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2645,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2646,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2647,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2648,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2649,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2650,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2651,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2652,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2653,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 53,
                            "z": 4
                        },
                        {
                            "id": 2654,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 53,
                            "z": 4
                        },
                        {
                            "id": 2655,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2656,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2657,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2658,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2659,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2660,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2661,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2662,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2663,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2664,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2665,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2666,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 53,
                            "z": 4
                        },
                        {
                            "id": 2667,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 53,
                            "z": 4
                        },
                        {
                            "id": 2668,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2669,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2670,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2671,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2672,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2673,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2674,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2675,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2676,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 52,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2677,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 54,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2678,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2679,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2680,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2681,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2682,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2683,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 66,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2684,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 68,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2685,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2686,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2687,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2688,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2689,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2690,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2691,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2692,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2693,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2694,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2695,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2696,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2697,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2698,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2699,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2700,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2701,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2702,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 54,
                            "z": 4
                        },
                        {
                            "id": 2703,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 54,
                            "z": 4
                        },
                        {
                            "id": 2704,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 54,
                            "z": 4
                        },
                        {
                            "id": 2705,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2706,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2707,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2708,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2709,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2710,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2711,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2712,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2713,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2714,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2715,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2716,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 54,
                            "z": 4
                        },
                        {
                            "id": 2717,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 54,
                            "z": 4
                        },
                        {
                            "id": 2718,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2719,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2720,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 41,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2721,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2722,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2723,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 47,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2724,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2725,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2726,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2727,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2728,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2729,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2730,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2731,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2732,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2733,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2734,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2735,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2736,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2737,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 75,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2738,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2739,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2740,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2741,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2742,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2743,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2744,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2745,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2746,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2747,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2748,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2749,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2750,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2751,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2752,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2753,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 55,
                            "z": 4
                        },
                        {
                            "id": 2754,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 55,
                            "z": 4
                        },
                        {
                            "id": 2755,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2756,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2757,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2758,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2759,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2760,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2761,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2762,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2763,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2764,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2765,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2766,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 55,
                            "z": 4
                        },
                        {
                            "id": 2767,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 34,
                            "y": 55,
                            "z": 4
                        },
                        {
                            "id": 2768,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 36,
                            "y": 55,
                            "z": 4
                        },
                        {
                            "id": 2769,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2770,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2771,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2772,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 44,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2773,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 46,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2774,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 48,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2775,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2776,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2777,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 54,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2778,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2779,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2780,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 60,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2781,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 62,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2782,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 64,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2783,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 66,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2784,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2785,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2786,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2787,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2788,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2789,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2790,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2791,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2792,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2793,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2794,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2795,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2796,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2797,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2798,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2799,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2800,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2801,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2802,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 56,
                            "z": 4
                        },
                        {
                            "id": 2803,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 56,
                            "z": 4
                        },
                        {
                            "id": 2804,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2805,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2806,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2807,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2808,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2809,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2810,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2811,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 23,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2812,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2813,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2814,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2815,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2816,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 56,
                            "z": 4
                        },
                        {
                            "id": 2817,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 35,
                            "y": 56,
                            "z": 4
                        },
                        {
                            "id": 2818,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 56,
                            "z": 4
                        },
                        {
                            "id": 2819,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 39,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2820,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 41,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2821,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2822,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 45,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2823,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2824,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2825,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2826,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2827,
                            "events": [],
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2828,
                            "events": [],
                            "value": "W",
                            "walkable": false,
                            "x": 57,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2829,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 59,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2830,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 61,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2831,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 63,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2832,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2833,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2834,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2835,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2836,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2837,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2838,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2839,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2840,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2841,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2842,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2843,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2844,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2845,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2846,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2847,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2848,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2849,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2850,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2851,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2852,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2853,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2854,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2855,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2856,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2857,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2858,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2859,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2860,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2861,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2862,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2863,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2864,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2865,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2866,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 57,
                            "z": 4
                        },
                        {
                            "id": 2867,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 34,
                            "y": 57,
                            "z": 4
                        },
                        {
                            "id": 2868,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 36,
                            "y": 57,
                            "z": 4
                        },
                        {
                            "id": 2869,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 57,
                            "z": 4
                        },
                        {
                            "id": 2870,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 40,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2871,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 42,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2872,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 44,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2873,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 46,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2874,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2875,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 50,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2876,
                            "events": [],
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2877,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 54,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2878,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 56,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2879,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 58,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2880,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 60,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2881,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 62,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2882,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 64,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2883,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 66,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2884,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 68,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2885,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 70,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2886,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2887,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 74,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2888,
                            "events": [],
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2889,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2890,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2891,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2892,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 57,
                            "z": 4
                        },
                        {
                            "id": 2893,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2894,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2895,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2896,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2897,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2898,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2899,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2900,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2901,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2902,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2903,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2904,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2905,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2906,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2907,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2908,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2909,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2910,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2911,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2912,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2913,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2914,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2915,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2916,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2917,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2918,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2919,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2920,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2921,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2922,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 45,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2923,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2924,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2925,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2926,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2927,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2928,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2929,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 59,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2930,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 61,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2931,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 63,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2932,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2933,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2934,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 69,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2935,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 71,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2936,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 73,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2937,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2938,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2939,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2940,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2941,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2942,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2943,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2944,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2945,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2946,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2947,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2948,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2949,
                            "events": [],
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 58,
                            "z": 2
                        }
                    ],
                    "id": 1302422795,
                    "name": "Traitor",
                    "order": 0,
                    "size": 50,
                    "starting_point": {
                        "x": 15,
                        "y": 14,
                        "id": 707
                    },
                    "primary": true,
                    "npcs": []
                }
            ]
        },
        "complete": false
    },
    {
        "id": 446550365,
        "order": 1,
        "name": "Act II",
        "title": "Prologue",
        "date": "02/06/1164",
        "content": {
            "maps": []
        },
        "complete": false
    }
  ]
  '));




