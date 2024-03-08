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
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 1,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 0,
                            "z": 1
                        },
                        {
                            "id": 2,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 0,
                            "z": 1
                        },
                        {
                            "id": 3,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 0,
                            "z": 1
                        },
                        {
                            "id": 4,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 0,
                            "z": 1
                        },
                        {
                            "id": 5,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 6,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 7,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 8,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 9,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 10,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 11,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 12,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 13,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 14,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 15,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 16,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 17,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 0,
                            "z": 1
                        },
                        {
                            "id": 18,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 19,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 20,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 21,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 22,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 45,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 23,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 24,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 25,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 26,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 27,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 28,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 29,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 59,
                            "y": 0,
                            "z": 4
                        },
                        {
                            "id": 30,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 61,
                            "y": 0,
                            "z": 4
                        },
                        {
                            "id": 31,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 63,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 32,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 33,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 34,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 69,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 35,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 71,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 36,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 73,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 37,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 38,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 39,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 40,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 41,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 42,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 43,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 44,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 45,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 0,
                            "z": 3
                        },
                        {
                            "id": 46,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 47,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 48,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 49,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 0,
                            "z": 2
                        },
                        {
                            "id": 50,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 51,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 52,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 53,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 54,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 55,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 56,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 57,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 58,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 59,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 60,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 61,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 62,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 63,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 64,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 65,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 66,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 67,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 68,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 1,
                            "z": 1
                        },
                        {
                            "id": 69,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 70,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 40,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 71,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 42,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 72,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 44,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 73,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 46,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 74,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 75,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 50,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 76,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 52,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 77,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 54,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 78,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 56,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 79,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 58,
                            "y": 1,
                            "z": 4
                        },
                        {
                            "id": 80,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 60,
                            "y": 1,
                            "z": 4
                        },
                        {
                            "id": 81,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 62,
                            "y": 1,
                            "z": 4
                        },
                        {
                            "id": 82,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 83,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 66,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 84,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 68,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 85,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 70,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 86,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 72,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 87,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 74,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 88,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 89,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 90,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 91,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 92,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 93,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 94,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 95,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 96,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 1,
                            "z": 3
                        },
                        {
                            "id": 97,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 98,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 99,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 1,
                            "z": 2
                        },
                        {
                            "id": 100,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 101,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 102,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 103,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 104,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 105,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 106,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 107,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 108,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 109,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 110,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 111,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 112,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 113,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 114,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 115,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 116,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 117,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 2,
                            "z": 1
                        },
                        {
                            "id": 118,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 119,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 120,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 121,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 122,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 45,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 123,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 124,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 125,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 126,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 53,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 127,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 128,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 129,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 59,
                            "y": 2,
                            "z": 4
                        },
                        {
                            "id": 130,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 61,
                            "y": 2,
                            "z": 4
                        },
                        {
                            "id": 131,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 132,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 133,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 134,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 69,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 135,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 71,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 136,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 137,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 138,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 139,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 140,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 141,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 142,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 143,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 144,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 145,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 2,
                            "z": 3
                        },
                        {
                            "id": 146,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 147,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 95,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 148,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 149,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 2,
                            "z": 2
                        },
                        {
                            "id": 150,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 151,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 152,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 153,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 154,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 155,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 156,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 157,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 158,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 159,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 160,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 161,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 162,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 163,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 164,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 165,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 166,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 167,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 168,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 3,
                            "z": 1
                        },
                        {
                            "id": 169,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 170,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 40,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 171,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 42,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 172,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 44,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 173,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 46,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 174,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 175,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 50,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 176,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 52,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 177,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 54,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 178,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 56,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 179,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 58,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 180,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 60,
                            "y": 3,
                            "z": 4
                        },
                        {
                            "id": 181,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 62,
                            "y": 3,
                            "z": 4
                        },
                        {
                            "id": 182,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 183,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 184,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 185,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 70,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 186,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 187,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 188,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 189,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 3,
                            "z": 3
                        },
                        {
                            "id": 190,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 191,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 192,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 193,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 194,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 195,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 196,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 197,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 198,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 199,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 3,
                            "z": 2
                        },
                        {
                            "id": 200,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 201,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 202,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 203,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 204,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 205,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 206,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 207,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 208,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 209,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 210,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 211,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 212,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 213,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 214,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 215,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 216,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 217,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 218,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 219,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 220,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 221,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 222,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 45,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 223,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 224,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 225,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 226,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 227,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 228,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 229,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 59,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 230,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 61,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 231,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 232,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 233,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 234,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 235,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 236,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 237,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 75,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 238,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 4,
                            "z": 3
                        },
                        {
                            "id": 239,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 240,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 241,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 242,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 4,
                            "z": 1
                        },
                        {
                            "id": 243,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 244,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 245,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 246,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 247,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 248,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 249,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 4,
                            "z": 2
                        },
                        {
                            "id": 250,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 251,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 252,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 253,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 6,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 254,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 255,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 256,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 257,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 258,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 259,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 260,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 261,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 262,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 263,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 264,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 265,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 266,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 267,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 268,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 269,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 270,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 40,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 271,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 42,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 272,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 44,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 273,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 46,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 274,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 275,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 50,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 276,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 52,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 277,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 54,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 278,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 56,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 279,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 58,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 280,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 60,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 281,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 62,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 282,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 283,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 284,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 285,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 286,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 287,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 288,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 5,
                            "z": 3
                        },
                        {
                            "id": 289,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 290,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 291,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 292,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 293,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 5,
                            "z": 1
                        },
                        {
                            "id": 294,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 295,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 296,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 297,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 298,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 299,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 5,
                            "z": 2
                        },
                        {
                            "id": 300,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 301,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 302,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 303,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 304,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 9,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 305,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 11,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 306,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 307,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 308,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 309,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 310,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 311,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 312,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 313,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 314,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 315,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 316,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 317,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 318,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 319,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 320,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 321,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 322,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 45,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 323,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 47,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 324,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 325,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 51,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 326,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 327,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 55,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 328,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 329,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 59,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 330,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 61,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 331,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 332,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 333,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 334,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 69,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 335,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 336,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 337,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 6,
                            "z": 3
                        },
                        {
                            "id": 338,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 339,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 340,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 341,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 342,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 343,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 344,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 6,
                            "z": 1
                        },
                        {
                            "id": 345,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 346,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 347,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 348,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 349,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 6,
                            "z": 2
                        },
                        {
                            "id": 350,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 351,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 352,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 353,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 354,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 355,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 10,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 356,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 12,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 357,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 358,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 359,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 360,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 361,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 362,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 363,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 364,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 365,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 366,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 367,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 368,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 369,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 370,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 40,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 371,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 42,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 372,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 44,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 373,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 46,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 374,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 375,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 50,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 376,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 52,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 377,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 378,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 56,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 379,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 58,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 380,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 381,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 382,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 64,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 383,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 384,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 385,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 386,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 387,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 388,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 7,
                            "z": 3
                        },
                        {
                            "id": 389,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 390,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 391,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 392,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 393,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 394,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 395,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 396,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 397,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 7,
                            "z": 1
                        },
                        {
                            "id": 398,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 399,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 7,
                            "z": 2
                        },
                        {
                            "id": 400,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 401,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 402,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 403,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 404,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 405,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 11,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 406,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 407,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 408,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 409,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 410,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 411,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 412,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 413,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 414,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 415,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 416,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 417,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 418,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 419,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 420,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 421,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 422,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 45,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 423,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 424,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 425,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 426,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 53,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 427,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 428,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 429,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 430,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 431,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 432,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 433,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 434,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 435,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 8,
                            "z": 4
                        },
                        {
                            "id": 436,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 437,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 8,
                            "z": 3
                        },
                        {
                            "id": 438,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 439,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 440,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 441,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 442,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 8,
                            "z": 0
                        },
                        {
                            "id": 443,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 8,
                            "z": 0
                        },
                        {
                            "id": 444,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 445,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 446,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 8,
                            "z": 1
                        },
                        {
                            "id": 447,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 448,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 449,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 8,
                            "z": 2
                        },
                        {
                            "id": 450,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 451,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 452,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 453,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 454,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 455,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 456,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 457,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 458,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 459,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 460,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 461,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 462,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 463,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 464,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 465,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 466,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 467,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 468,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 469,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 470,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 40,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 471,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 42,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 472,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 44,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 473,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 46,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 474,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 475,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 50,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 476,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 52,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 477,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 478,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 479,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 480,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 481,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 482,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 483,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 484,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 485,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 9,
                            "z": 4
                        },
                        {
                            "id": 486,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 72,
                            "y": 9,
                            "z": 4
                        },
                        {
                            "id": 487,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 488,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 9,
                            "z": 3
                        },
                        {
                            "id": 489,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 490,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 491,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 492,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 9,
                            "z": 0
                        },
                        {
                            "id": 493,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 9,
                            "z": 0
                        },
                        {
                            "id": 494,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 9,
                            "z": 0
                        },
                        {
                            "id": 495,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 90,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 496,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 9,
                            "z": 1
                        },
                        {
                            "id": 497,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 498,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 499,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 9,
                            "z": 2
                        },
                        {
                            "id": 500,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 501,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 502,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 503,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 504,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 505,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 11,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 506,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 507,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 508,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 509,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 510,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 511,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 512,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 513,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 514,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 515,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 516,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 517,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 518,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 519,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 39,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 520,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 41,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 521,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 522,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 45,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 523,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 524,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 525,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 51,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 526,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 527,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 528,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 529,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 530,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 531,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 532,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 65,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 533,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 534,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 10,
                            "z": 4
                        },
                        {
                            "id": 535,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 10,
                            "z": 4
                        },
                        {
                            "id": 536,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 10,
                            "z": 4
                        },
                        {
                            "id": 537,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 538,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 539,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 540,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 541,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 542,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 10,
                            "z": 0
                        },
                        {
                            "id": 543,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 10,
                            "z": 0
                        },
                        {
                            "id": 544,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 10,
                            "z": 0
                        },
                        {
                            "id": 545,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 10,
                            "z": 1
                        },
                        {
                            "id": 546,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 547,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 548,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 10,
                            "z": 2
                        },
                        {
                            "id": 549,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 10,
                            "z": 3
                        },
                        {
                            "id": 550,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 551,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 552,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 553,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 554,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 555,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 556,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 557,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 558,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 559,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 560,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 561,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 562,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 563,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 564,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 565,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 566,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 567,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 568,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 36,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 569,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 38,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 570,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 571,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 42,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 572,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 44,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 573,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 46,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 574,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 575,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 50,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 576,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 577,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 578,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 579,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 580,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 581,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 62,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 582,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 583,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 66,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 584,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 68,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 585,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 11,
                            "z": 4
                        },
                        {
                            "id": 586,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 11,
                            "z": 4
                        },
                        {
                            "id": 587,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 11,
                            "z": 4
                        },
                        {
                            "id": 588,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 589,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 590,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 591,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 592,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 593,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 11,
                            "z": 0
                        },
                        {
                            "id": 594,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 11,
                            "z": 0
                        },
                        {
                            "id": 595,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 90,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 596,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 11,
                            "z": 1
                        },
                        {
                            "id": 597,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 598,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 11,
                            "z": 2
                        },
                        {
                            "id": 599,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 11,
                            "z": 3
                        },
                        {
                            "id": 600,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 601,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 602,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 603,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 604,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 605,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 606,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 607,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 608,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 609,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 610,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 611,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 612,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 613,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 614,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 615,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 616,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 33,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 617,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 35,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 618,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 619,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 620,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 621,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 622,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 45,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 623,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 47,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 624,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 49,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 625,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 626,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 627,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 628,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 629,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 630,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 631,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 632,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 65,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 633,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 634,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 635,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 12,
                            "z": 4
                        },
                        {
                            "id": 636,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 12,
                            "z": 4
                        },
                        {
                            "id": 637,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 12,
                            "z": 4
                        },
                        {
                            "id": 638,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 639,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 640,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 641,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 642,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 643,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 12,
                            "z": 0
                        },
                        {
                            "id": 644,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 645,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 12,
                            "z": 1
                        },
                        {
                            "id": 646,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 647,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 12,
                            "z": 2
                        },
                        {
                            "id": 648,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 12,
                            "z": 3
                        },
                        {
                            "id": 649,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 12,
                            "z": 4
                        },
                        {
                            "id": 650,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 651,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 652,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 653,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 654,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 655,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 656,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 657,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 658,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 659,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 660,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 661,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 662,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 663,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 664,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 665,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 666,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 667,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 668,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 669,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 670,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 671,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 672,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 673,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 674,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 48,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 675,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 50,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 676,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 677,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 678,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 679,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 680,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 681,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 682,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 683,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 684,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 685,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 686,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 13,
                            "z": 4
                        },
                        {
                            "id": 687,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 13,
                            "z": 4
                        },
                        {
                            "id": 688,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 689,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 690,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 691,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 692,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 693,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 694,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 695,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 13,
                            "z": 1
                        },
                        {
                            "id": 696,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 697,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 13,
                            "z": 2
                        },
                        {
                            "id": 698,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 13,
                            "z": 3
                        },
                        {
                            "id": 699,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 13,
                            "z": 4
                        },
                        {
                            "id": 700,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 701,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 702,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 703,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 704,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 705,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 706,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 707,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 708,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 709,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 710,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 711,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 712,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 713,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 714,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 715,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 716,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 717,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 718,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 719,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 39,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 720,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 721,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 722,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 723,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 724,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 725,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 726,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 727,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 728,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 729,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 730,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 731,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 732,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 733,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 734,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 735,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 736,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 14,
                            "z": 4
                        },
                        {
                            "id": 737,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 14,
                            "z": 4
                        },
                        {
                            "id": 738,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 739,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 740,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 741,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 742,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 743,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 744,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 14,
                            "z": 1
                        },
                        {
                            "id": 745,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 746,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 14,
                            "z": 2
                        },
                        {
                            "id": 747,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 14,
                            "z": 3
                        },
                        {
                            "id": 748,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 14,
                            "z": 4
                        },
                        {
                            "id": 749,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 14,
                            "z": 4
                        },
                        {
                            "id": 750,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 751,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 752,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 753,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 754,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 755,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 756,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 757,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 758,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 759,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 760,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 761,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 762,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 763,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 764,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 765,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 766,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 767,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 768,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 769,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 770,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 771,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 772,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 773,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 774,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 15,
                            "z": 4
                        },
                        {
                            "id": 775,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 776,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 52,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 777,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 778,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 779,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 780,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 781,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 782,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 783,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 66,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 784,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 68,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 785,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 786,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 15,
                            "z": 4
                        },
                        {
                            "id": 787,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 15,
                            "z": 4
                        },
                        {
                            "id": 788,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 15,
                            "z": 4
                        },
                        {
                            "id": 789,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 790,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 791,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 792,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 793,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 794,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 15,
                            "z": 1
                        },
                        {
                            "id": 795,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 796,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 15,
                            "z": 2
                        },
                        {
                            "id": 797,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 798,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 15,
                            "z": 3
                        },
                        {
                            "id": 799,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 15,
                            "z": 4
                        },
                        {
                            "id": 800,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 801,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 802,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 803,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 804,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 805,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 806,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 807,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 808,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 809,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 810,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 811,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 812,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 813,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 814,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 815,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 816,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 33,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 817,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 818,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 819,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 820,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 821,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 822,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 823,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 824,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 825,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 826,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 827,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 828,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 829,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 830,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 831,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 832,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 65,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 833,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 834,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 69,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 835,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 836,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 837,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 838,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 839,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 840,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 841,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 842,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 843,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 16,
                            "z": 1
                        },
                        {
                            "id": 844,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 845,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 16,
                            "z": 2
                        },
                        {
                            "id": 846,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 847,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 16,
                            "z": 3
                        },
                        {
                            "id": 848,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 16,
                            "z": 4
                        },
                        {
                            "id": 849,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 16,
                            "z": 5
                        },
                        {
                            "id": 850,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 851,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 852,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 853,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 854,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 855,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 856,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 857,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 858,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 859,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 860,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 861,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 22,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 862,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 24,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 863,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 864,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 865,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 866,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 32,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 867,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 34,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 868,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 869,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 38,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 870,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 871,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 872,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 873,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 874,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 875,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 876,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 52,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 877,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 878,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 56,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 879,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 880,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 881,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 882,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 883,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 66,
                            "y": 17,
                            "z": 1
                        },
                        {
                            "id": 884,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 68,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 885,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 70,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 886,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 887,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 888,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 889,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 890,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 891,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 892,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 893,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 894,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 895,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 17,
                            "z": 2
                        },
                        {
                            "id": 896,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 17,
                            "z": 3
                        },
                        {
                            "id": 897,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 898,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 17,
                            "z": 4
                        },
                        {
                            "id": 899,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 17,
                            "z": 5
                        },
                        {
                            "id": 900,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 901,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 902,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 903,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 904,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 905,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 906,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 907,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 908,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 909,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 910,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 911,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 912,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 913,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 914,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 915,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 31,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 916,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 33,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 917,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 35,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 918,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 37,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 919,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 39,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 920,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 41,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 921,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 922,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 923,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 924,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 49,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 925,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 926,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 927,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 928,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 929,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 930,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 18,
                            "z": 1
                        },
                        {
                            "id": 931,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 18,
                            "z": 1
                        },
                        {
                            "id": 932,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 18,
                            "z": 1
                        },
                        {
                            "id": 933,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 934,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 69,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 935,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 936,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 937,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 938,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 939,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 940,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 941,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 942,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 943,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 944,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 18,
                            "z": 2
                        },
                        {
                            "id": 945,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 18,
                            "z": 3
                        },
                        {
                            "id": 946,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 947,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 95,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 948,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 18,
                            "z": 4
                        },
                        {
                            "id": 949,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 18,
                            "z": 5
                        },
                        {
                            "id": 950,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 951,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 952,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 953,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 954,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 955,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 956,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 957,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 958,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 959,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 960,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 961,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 22,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 962,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 963,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 964,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 965,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 966,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 32,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 967,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 34,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 968,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 969,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 38,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 970,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 971,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 972,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 973,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 19,
                            "z": 5
                        },
                        {
                            "id": 974,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 48,
                            "y": 19,
                            "z": 5
                        },
                        {
                            "id": 975,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 50,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 976,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 52,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 977,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 978,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 979,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 980,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 19,
                            "z": 1
                        },
                        {
                            "id": 981,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 19,
                            "z": 1
                        },
                        {
                            "id": 982,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 19,
                            "z": 1
                        },
                        {
                            "id": 983,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 66,
                            "y": 19,
                            "z": 1
                        },
                        {
                            "id": 984,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 68,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 985,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 986,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 987,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 988,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 989,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 990,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 991,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 992,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 993,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 994,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 19,
                            "z": 2
                        },
                        {
                            "id": 995,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 19,
                            "z": 3
                        },
                        {
                            "id": 996,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 997,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 998,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 19,
                            "z": 4
                        },
                        {
                            "id": 999,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 19,
                            "z": 5
                        },
                        {
                            "id": 1000,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1001,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1002,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1003,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1004,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1005,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1006,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1007,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1008,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1009,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1010,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1011,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 23,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1012,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1013,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1014,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1015,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1016,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1017,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1018,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1019,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1020,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 41,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1021,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1022,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 20,
                            "z": 5
                        },
                        {
                            "id": 1023,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 47,
                            "y": 20,
                            "z": 5
                        },
                        {
                            "id": 1024,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 49,
                            "y": 20,
                            "z": 5
                        },
                        {
                            "id": 1025,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1026,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 53,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1027,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1028,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 57,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1029,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1030,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 20,
                            "z": 1
                        },
                        {
                            "id": 1031,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 63,
                            "y": 20,
                            "z": 1
                        },
                        {
                            "id": 1032,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 20,
                            "z": 1
                        },
                        {
                            "id": 1033,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1034,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1035,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1036,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1037,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1038,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1039,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1040,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1041,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1042,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 85,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1043,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 20,
                            "z": 2
                        },
                        {
                            "id": 1044,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 20,
                            "z": 3
                        },
                        {
                            "id": 1045,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1046,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1047,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 20,
                            "z": 4
                        },
                        {
                            "id": 1048,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 20,
                            "z": 5
                        },
                        {
                            "id": 1049,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 20,
                            "z": 5
                        },
                        {
                            "id": 1050,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1051,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1052,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1053,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 6,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1054,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1055,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1056,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1057,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1058,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1059,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1060,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1061,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 22,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1062,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 24,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1063,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1064,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1065,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1066,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1067,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1068,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1069,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1070,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1071,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1072,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 21,
                            "z": 5
                        },
                        {
                            "id": 1073,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 21,
                            "z": 5
                        },
                        {
                            "id": 1074,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 21,
                            "z": 5
                        },
                        {
                            "id": 1075,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 50,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1076,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 52,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1077,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 54,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1078,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1079,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1080,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1081,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 62,
                            "y": 21,
                            "z": 1
                        },
                        {
                            "id": 1082,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 21,
                            "z": 1
                        },
                        {
                            "id": 1083,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 21,
                            "z": 1
                        },
                        {
                            "id": 1084,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1085,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1086,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1087,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1088,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1089,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1090,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1091,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1092,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1093,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 21,
                            "z": 2
                        },
                        {
                            "id": 1094,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1095,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 21,
                            "z": 3
                        },
                        {
                            "id": 1096,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1097,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1098,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1099,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 21,
                            "z": 4
                        },
                        {
                            "id": 1100,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1101,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1102,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1103,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1104,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 9,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1105,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 11,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1106,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 13,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1107,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1108,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1109,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1110,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1111,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 23,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1112,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1113,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1114,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1115,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1116,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1117,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1118,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1119,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1120,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1121,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1122,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1123,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 47,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1124,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1125,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1126,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 53,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1127,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1128,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1129,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1130,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 61,
                            "y": 22,
                            "z": 1
                        },
                        {
                            "id": 1131,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 63,
                            "y": 22,
                            "z": 1
                        },
                        {
                            "id": 1132,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 22,
                            "z": 1
                        },
                        {
                            "id": 1133,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1134,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1135,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1136,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1137,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1138,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1139,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 79,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1140,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1141,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1142,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1143,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 22,
                            "z": 2
                        },
                        {
                            "id": 1144,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1145,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 22,
                            "z": 3
                        },
                        {
                            "id": 1146,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1147,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1148,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1149,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 22,
                            "z": 4
                        },
                        {
                            "id": 1150,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1151,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1152,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1153,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1154,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1155,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 10,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1156,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 12,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1157,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1158,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1159,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1160,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1161,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 22,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1162,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1163,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1164,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1165,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1166,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1167,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 34,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1168,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 36,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1169,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1170,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1171,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1172,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1173,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 46,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1174,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1175,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1176,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1177,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1178,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1179,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1180,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 60,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1181,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 62,
                            "y": 23,
                            "z": 1
                        },
                        {
                            "id": 1182,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 23,
                            "z": 1
                        },
                        {
                            "id": 1183,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1184,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1185,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1186,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1187,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1188,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1189,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1190,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1191,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1192,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1193,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 23,
                            "z": 2
                        },
                        {
                            "id": 1194,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1195,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1196,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1197,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 23,
                            "z": 3
                        },
                        {
                            "id": 1198,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1199,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 23,
                            "z": 4
                        },
                        {
                            "id": 1200,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1201,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1202,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1203,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1204,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1205,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 11,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1206,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1207,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1208,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1209,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1210,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1211,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 23,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1212,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1213,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1214,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1215,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1216,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 33,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1217,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 35,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1218,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1219,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1220,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1221,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 24,
                            "z": 4
                        },
                        {
                            "id": 1222,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 24,
                            "z": 4
                        },
                        {
                            "id": 1223,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 24,
                            "z": 4
                        },
                        {
                            "id": 1224,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 24,
                            "z": 4
                        },
                        {
                            "id": 1225,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 51,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1226,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1227,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1228,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1229,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1230,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1231,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 24,
                            "z": 1
                        },
                        {
                            "id": 1232,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1233,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1234,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1235,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1236,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1237,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1238,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1239,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1240,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1241,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1242,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1243,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 24,
                            "z": 2
                        },
                        {
                            "id": 1244,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1245,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1246,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1247,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1248,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 24,
                            "z": 3
                        },
                        {
                            "id": 1249,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 24,
                            "z": 4
                        },
                        {
                            "id": 1250,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1251,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1252,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1253,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1254,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1255,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1256,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1257,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1258,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1259,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1260,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1261,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1262,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1263,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1264,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1265,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1266,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 32,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1267,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 34,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1268,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1269,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 38,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1270,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1271,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1272,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 25,
                            "z": 4
                        },
                        {
                            "id": 1273,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 25,
                            "z": 4
                        },
                        {
                            "id": 1274,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1275,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1276,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1277,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 54,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1278,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1279,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1280,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 60,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1281,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 62,
                            "y": 25,
                            "z": 1
                        },
                        {
                            "id": 1282,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1283,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1284,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1285,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1286,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1287,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1288,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1289,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1290,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1291,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1292,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1293,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1294,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 25,
                            "z": 2
                        },
                        {
                            "id": 1295,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1296,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1297,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1298,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1299,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 25,
                            "z": 3
                        },
                        {
                            "id": 1300,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1301,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1302,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1303,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1304,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1305,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1306,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1307,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1308,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1309,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1310,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1311,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1312,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1313,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1314,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1315,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1316,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 33,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1317,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1318,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1319,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1320,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1321,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1322,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1323,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1324,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 49,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1325,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 51,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1326,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1327,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1328,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 57,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1329,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1330,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 61,
                            "y": 26,
                            "z": 1
                        },
                        {
                            "id": 1331,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 63,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1332,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 65,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1333,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1334,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1335,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 71,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1336,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1337,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1338,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1339,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1340,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1341,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1342,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1343,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1344,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1345,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1346,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 26,
                            "z": 2
                        },
                        {
                            "id": 1347,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1348,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1349,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 26,
                            "z": 3
                        },
                        {
                            "id": 1350,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1351,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1352,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 4,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1353,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1354,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1355,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1356,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1357,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1358,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1359,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1360,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1361,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1362,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 24,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1363,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1364,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 28,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1365,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 30,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1366,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 32,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1367,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 27,
                            "z": 1
                        },
                        {
                            "id": 1368,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 27,
                            "z": 1
                        },
                        {
                            "id": 1369,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1370,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1371,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1372,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 44,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1373,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1374,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1375,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1376,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1377,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1378,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1379,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1380,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 27,
                            "z": 1
                        },
                        {
                            "id": 1381,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 62,
                            "y": 27,
                            "z": 1
                        },
                        {
                            "id": 1382,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1383,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1384,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1385,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 70,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1386,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 72,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1387,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 74,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1388,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1389,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1390,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1391,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1392,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1393,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1394,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1395,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1396,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1397,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1398,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 27,
                            "z": 2
                        },
                        {
                            "id": 1399,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 27,
                            "z": 3
                        },
                        {
                            "id": 1400,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1401,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1402,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1403,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1404,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1405,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1406,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1407,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1408,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1409,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1410,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1411,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 23,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1412,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1413,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 27,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1414,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 29,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1415,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 31,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1416,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 33,
                            "y": 28,
                            "z": 1
                        },
                        {
                            "id": 1417,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 28,
                            "z": 1
                        },
                        {
                            "id": 1418,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 28,
                            "z": 1
                        },
                        {
                            "id": 1419,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1420,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1421,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1422,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1423,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1424,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1425,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1426,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1427,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1428,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1429,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 28,
                            "z": 1
                        },
                        {
                            "id": 1430,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 28,
                            "z": 1
                        },
                        {
                            "id": 1431,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1432,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1433,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1434,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1435,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 71,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1436,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 73,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1437,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1438,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1439,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1440,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1441,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1442,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 85,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1443,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1444,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1445,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1446,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1447,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1448,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 28,
                            "z": 2
                        },
                        {
                            "id": 1449,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 28,
                            "z": 3
                        },
                        {
                            "id": 1450,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1451,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1452,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 4,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1453,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 6,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1454,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1455,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1456,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1457,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1458,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1459,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1460,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1461,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 22,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1462,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 24,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1463,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1464,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 28,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1465,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 30,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1466,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 32,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1467,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 34,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1468,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1469,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 38,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1470,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1471,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1472,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1473,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 46,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1474,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1475,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1476,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 52,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1477,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 54,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1478,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1479,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1480,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1481,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 29,
                            "z": 1
                        },
                        {
                            "id": 1482,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1483,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1484,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1485,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1486,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1487,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1488,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1489,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1490,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1491,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1492,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 29,
                            "z": 3
                        },
                        {
                            "id": 1493,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1494,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1495,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 90,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1496,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1497,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1498,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1499,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 29,
                            "z": 2
                        },
                        {
                            "id": 1500,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1501,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1502,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1503,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1504,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1505,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1506,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1507,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1508,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1509,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1510,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1511,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1512,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1513,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1514,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 29,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1515,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 31,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1516,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 33,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1517,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 35,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1518,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1519,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1520,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1521,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1522,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1523,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1524,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1525,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 51,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1526,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1527,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1528,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1529,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1530,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1531,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 63,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1532,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1533,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1534,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1535,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 71,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1536,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 73,
                            "y": 30,
                            "z": 4
                        },
                        {
                            "id": 1537,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 30,
                            "z": 4
                        },
                        {
                            "id": 1538,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1539,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1540,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1541,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1542,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 30,
                            "z": 3
                        },
                        {
                            "id": 1543,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1544,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1545,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1546,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1547,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 30,
                            "z": 1
                        },
                        {
                            "id": 1548,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1549,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 30,
                            "z": 2
                        },
                        {
                            "id": 1550,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1551,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1552,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1553,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1554,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1555,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1556,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1557,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1558,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1559,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1560,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1561,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1562,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1563,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1564,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1565,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1566,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 32,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1567,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1568,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 36,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1569,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1570,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1571,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1572,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1573,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1574,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1575,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 50,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1576,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1577,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1578,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1579,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1580,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1581,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 62,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1582,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1583,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 31,
                            "z": 3
                        },
                        {
                            "id": 1584,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 31,
                            "z": 3
                        },
                        {
                            "id": 1585,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 31,
                            "z": 3
                        },
                        {
                            "id": 1586,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1587,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1588,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1589,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1590,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1591,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 31,
                            "z": 4
                        },
                        {
                            "id": 1592,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 31,
                            "z": 3
                        },
                        {
                            "id": 1593,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 31,
                            "z": 3
                        },
                        {
                            "id": 1594,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1595,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1596,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1597,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1598,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 31,
                            "z": 1
                        },
                        {
                            "id": 1599,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 31,
                            "z": 2
                        },
                        {
                            "id": 1600,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1601,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1602,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1603,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1604,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1605,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1606,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1607,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1608,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1609,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1610,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1611,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1612,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1613,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1614,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1615,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1616,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1617,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1618,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1619,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1620,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 41,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1621,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1622,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1623,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1624,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1625,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 51,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1626,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1627,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1628,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1629,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1630,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1631,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1632,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 32,
                            "z": 3
                        },
                        {
                            "id": 1633,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 32,
                            "z": 3
                        },
                        {
                            "id": 1634,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 32,
                            "z": 3
                        },
                        {
                            "id": 1635,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1636,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1637,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1638,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1639,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1640,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1641,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 32,
                            "z": 4
                        },
                        {
                            "id": 1642,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 32,
                            "z": 3
                        },
                        {
                            "id": 1643,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1644,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1645,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 91,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1646,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1647,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1648,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 32,
                            "z": 1
                        },
                        {
                            "id": 1649,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 32,
                            "z": 2
                        },
                        {
                            "id": 1650,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1651,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1652,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1653,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1654,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1655,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1656,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1657,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1658,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1659,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1660,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1661,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1662,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1663,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1664,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1665,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1666,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1667,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1668,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1669,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1670,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1671,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1672,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1673,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1674,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1675,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 50,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1676,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1677,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1678,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 33,
                            "z": 0
                        },
                        {
                            "id": 1679,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1680,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 60,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1681,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 62,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1682,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 33,
                            "z": 3
                        },
                        {
                            "id": 1683,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 33,
                            "z": 3
                        },
                        {
                            "id": 1684,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 68,
                            "y": 33,
                            "z": 3
                        },
                        {
                            "id": 1685,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1686,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1687,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 74,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1688,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1689,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1690,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1691,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 33,
                            "z": 4
                        },
                        {
                            "id": 1692,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 33,
                            "z": 3
                        },
                        {
                            "id": 1693,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 33,
                            "z": 3
                        },
                        {
                            "id": 1694,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1695,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 90,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1696,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1697,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1698,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 33,
                            "z": 1
                        },
                        {
                            "id": 1699,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 33,
                            "z": 2
                        },
                        {
                            "id": 1700,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1701,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1702,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1703,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1704,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1705,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1706,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1707,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1708,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1709,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1710,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1711,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1712,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1713,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1714,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1715,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1716,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1717,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1718,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1719,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1720,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 41,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1721,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1722,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1723,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1724,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1725,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 51,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1726,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1727,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 34,
                            "z": 0
                        },
                        {
                            "id": 1728,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 34,
                            "z": 0
                        },
                        {
                            "id": 1729,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1730,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1731,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 63,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1732,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 34,
                            "z": 3
                        },
                        {
                            "id": 1733,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 34,
                            "z": 3
                        },
                        {
                            "id": 1734,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 34,
                            "z": 3
                        },
                        {
                            "id": 1735,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1736,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1737,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 75,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1738,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1739,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 79,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1740,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1741,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 34,
                            "z": 4
                        },
                        {
                            "id": 1742,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 34,
                            "z": 3
                        },
                        {
                            "id": 1743,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1744,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1745,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1746,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1747,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1748,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 34,
                            "z": 1
                        },
                        {
                            "id": 1749,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 34,
                            "z": 2
                        },
                        {
                            "id": 1750,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1751,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1752,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1753,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1754,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1755,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1756,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1757,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1758,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1759,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1760,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1761,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1762,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1763,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1764,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1765,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1766,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1767,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 34,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1768,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1769,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1770,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1771,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 42,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1772,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1773,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 46,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1774,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1775,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1776,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1777,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1778,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1779,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1780,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1781,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1782,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1783,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 66,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1784,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 68,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1785,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1786,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1787,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1788,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1789,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1790,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1791,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 35,
                            "z": 4
                        },
                        {
                            "id": 1792,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1793,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 35,
                            "z": 3
                        },
                        {
                            "id": 1794,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1795,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 90,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1796,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1797,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1798,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 35,
                            "z": 1
                        },
                        {
                            "id": 1799,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 35,
                            "z": 2
                        },
                        {
                            "id": 1800,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1801,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1802,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1803,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1804,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1805,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1806,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1807,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 15,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1808,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1809,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1810,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1811,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1812,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1813,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1814,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1815,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1816,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1817,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 35,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1818,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1819,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1820,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1821,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1822,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1823,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1824,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1825,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1826,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1827,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1828,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1829,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 59,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1830,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1831,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1832,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 65,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1833,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 67,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1834,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 69,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1835,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1836,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1837,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1838,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1839,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1840,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1841,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1842,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 85,
                            "y": 36,
                            "z": 3
                        },
                        {
                            "id": 1843,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1844,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1845,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1846,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1847,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1848,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 36,
                            "z": 1
                        },
                        {
                            "id": 1849,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 36,
                            "z": 2
                        },
                        {
                            "id": 1850,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1851,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1852,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1853,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1854,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1855,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1856,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1857,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1858,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1859,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1860,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1861,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1862,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1863,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1864,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1865,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1866,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1867,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 34,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1868,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1869,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1870,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1871,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 42,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1872,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1873,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 46,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1874,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 48,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1875,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1876,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1877,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 54,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1878,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1879,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1880,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1881,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 62,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1882,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1883,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 66,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1884,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 68,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1885,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1886,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1887,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1888,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1889,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1890,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1891,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1892,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 37,
                            "z": 3
                        },
                        {
                            "id": 1893,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1894,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1895,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1896,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1897,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 37,
                            "z": 1
                        },
                        {
                            "id": 1898,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1899,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 37,
                            "z": 2
                        },
                        {
                            "id": 1900,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1901,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1902,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1903,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1904,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1905,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 11,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1906,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1907,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1908,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1909,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1910,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1911,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1912,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1913,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1914,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1915,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1916,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 38,
                            "z": 4
                        },
                        {
                            "id": 1917,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1918,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1919,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1920,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 41,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1921,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1922,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 45,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1923,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 47,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1924,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1925,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1926,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1927,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1928,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1929,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 59,
                            "y": 38,
                            "z": 1
                        },
                        {
                            "id": 1930,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1931,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 63,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1932,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 65,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1933,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 67,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1934,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1935,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1936,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1937,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 75,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1938,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1939,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1940,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1941,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1942,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 85,
                            "y": 38,
                            "z": 3
                        },
                        {
                            "id": 1943,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1944,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1945,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1946,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1947,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1948,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1949,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 38,
                            "z": 2
                        },
                        {
                            "id": 1950,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1951,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1952,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1953,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 39,
                            "z": 1
                        },
                        {
                            "id": 1954,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 39,
                            "z": 1
                        },
                        {
                            "id": 1955,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1956,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 12,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1957,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1958,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1959,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1960,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1961,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1962,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1963,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1964,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 28,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1965,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1966,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 39,
                            "z": 4
                        },
                        {
                            "id": 1967,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 39,
                            "z": 4
                        },
                        {
                            "id": 1968,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1969,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1970,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1971,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 42,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1972,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 44,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1973,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1974,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 48,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1975,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1976,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1977,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1978,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 39,
                            "z": 1
                        },
                        {
                            "id": 1979,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 39,
                            "z": 1
                        },
                        {
                            "id": 1980,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 60,
                            "y": 39,
                            "z": 1
                        },
                        {
                            "id": 1981,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 62,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1982,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 64,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1983,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 66,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1984,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 68,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1985,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1986,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1987,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1988,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1989,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1990,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1991,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 82,
                            "y": 39,
                            "z": 3
                        },
                        {
                            "id": 1992,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1993,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1994,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1995,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1996,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1997,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1998,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 1999,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 39,
                            "z": 2
                        },
                        {
                            "id": 2000,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2001,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2002,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2003,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 40,
                            "z": 1
                        },
                        {
                            "id": 2004,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 40,
                            "z": 1
                        },
                        {
                            "id": 2005,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 11,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2006,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 13,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2007,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2008,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2009,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2010,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2011,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2012,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2013,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2014,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2015,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 40,
                            "z": 4
                        },
                        {
                            "id": 2016,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 40,
                            "z": 4
                        },
                        {
                            "id": 2017,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 40,
                            "z": 4
                        },
                        {
                            "id": 2018,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2019,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2020,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 41,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2021,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2022,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 45,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2023,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 47,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2024,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2025,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 40,
                            "z": 3
                        },
                        {
                            "id": 2026,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2027,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2028,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 57,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2029,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 40,
                            "z": 1
                        },
                        {
                            "id": 2030,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2031,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 63,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2032,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 65,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2033,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 67,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2034,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2035,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 71,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2036,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 73,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2037,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2038,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2039,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 79,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2040,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2041,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2042,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2043,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2044,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2045,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2046,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2047,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2048,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2049,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 40,
                            "z": 2
                        },
                        {
                            "id": 2050,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2051,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2052,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 4,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2053,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2054,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2055,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2056,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2057,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2058,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2059,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2060,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2061,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2062,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2063,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2064,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2065,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 41,
                            "z": 4
                        },
                        {
                            "id": 2066,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 41,
                            "z": 4
                        },
                        {
                            "id": 2067,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 41,
                            "z": 4
                        },
                        {
                            "id": 2068,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 41,
                            "z": 4
                        },
                        {
                            "id": 2069,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2070,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2071,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 42,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2072,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 44,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2073,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 46,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2074,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2075,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2076,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2077,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2078,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2079,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 58,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2080,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 60,
                            "y": 41,
                            "z": 1
                        },
                        {
                            "id": 2081,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 62,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2082,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 64,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2083,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 66,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2084,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 68,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2085,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 70,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2086,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 72,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2087,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2088,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2089,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2090,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2091,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2092,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2093,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2094,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2095,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2096,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2097,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2098,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 41,
                            "z": 3
                        },
                        {
                            "id": 2099,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 41,
                            "z": 2
                        },
                        {
                            "id": 2100,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2101,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2102,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2103,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2104,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2105,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2106,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 13,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2107,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2108,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 17,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2109,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2110,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2111,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2112,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2113,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2114,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2115,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 42,
                            "z": 4
                        },
                        {
                            "id": 2116,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 33,
                            "y": 42,
                            "z": 4
                        },
                        {
                            "id": 2117,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 42,
                            "z": 4
                        },
                        {
                            "id": 2118,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2119,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 39,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2120,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 41,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2121,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2122,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 45,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2123,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2124,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2125,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2126,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2127,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2128,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2129,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 59,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2130,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 61,
                            "y": 42,
                            "z": 1
                        },
                        {
                            "id": 2131,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2132,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 65,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2133,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 67,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2134,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2135,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 71,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2136,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2137,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2138,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2139,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 79,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2140,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2141,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2142,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2143,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2144,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2145,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 91,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2146,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2147,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 95,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2148,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 42,
                            "z": 3
                        },
                        {
                            "id": 2149,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 42,
                            "z": 2
                        },
                        {
                            "id": 2150,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2151,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 2,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2152,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 4,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2153,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 6,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2154,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 8,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2155,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2156,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2157,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 14,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2158,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 16,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2159,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2160,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2161,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2162,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2163,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2164,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 43,
                            "z": 4
                        },
                        {
                            "id": 2165,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 43,
                            "z": 4
                        },
                        {
                            "id": 2166,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 43,
                            "z": 4
                        },
                        {
                            "id": 2167,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 43,
                            "z": 4
                        },
                        {
                            "id": 2168,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2169,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2170,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2171,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2172,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 44,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2173,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 46,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2174,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2175,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2176,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2177,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2178,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2179,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2180,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 60,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2181,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2182,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2183,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 66,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2184,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 68,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2185,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2186,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2187,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 74,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2188,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2189,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2190,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 43,
                            "z": 1
                        },
                        {
                            "id": 2191,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2192,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2193,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 43,
                            "z": 2
                        },
                        {
                            "id": 2194,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2195,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2196,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2197,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2198,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2199,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 43,
                            "z": 3
                        },
                        {
                            "id": 2200,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2201,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2202,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2203,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2204,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 9,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2205,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 11,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2206,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 13,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2207,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 15,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2208,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2209,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2210,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2211,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2212,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2213,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 27,
                            "y": 44,
                            "z": 4
                        },
                        {
                            "id": 2214,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 29,
                            "y": 44,
                            "z": 4
                        },
                        {
                            "id": 2215,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 44,
                            "z": 4
                        },
                        {
                            "id": 2216,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 44,
                            "z": 4
                        },
                        {
                            "id": 2217,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 44,
                            "z": 4
                        },
                        {
                            "id": 2218,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2219,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 39,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2220,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 41,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2221,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2222,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2223,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2224,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2225,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2226,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2227,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2228,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2229,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2230,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2231,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2232,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2233,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2234,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2235,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2236,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2237,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2238,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2239,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2240,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2241,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 44,
                            "z": 1
                        },
                        {
                            "id": 2242,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 44,
                            "z": 2
                        },
                        {
                            "id": 2243,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2244,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2245,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 91,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2246,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2247,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2248,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2249,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 44,
                            "z": 3
                        },
                        {
                            "id": 2250,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2251,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2252,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2253,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2254,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2255,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 10,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2256,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 12,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2257,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 14,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2258,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2259,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2260,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2261,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2262,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2263,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 26,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2264,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2265,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 45,
                            "z": 5
                        },
                        {
                            "id": 2266,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 32,
                            "y": 45,
                            "z": 5
                        },
                        {
                            "id": 2267,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2268,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2269,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2270,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2271,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2272,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 44,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2273,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2274,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2275,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2276,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 52,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2277,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 54,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2278,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2279,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 58,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2280,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2281,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2282,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2283,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 66,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2284,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2285,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2286,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2287,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 74,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2288,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 76,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2289,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2290,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2291,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 45,
                            "z": 1
                        },
                        {
                            "id": 2292,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2293,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 45,
                            "z": 2
                        },
                        {
                            "id": 2294,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2295,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2296,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2297,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 94,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2298,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 45,
                            "z": 4
                        },
                        {
                            "id": 2299,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 45,
                            "z": 3
                        },
                        {
                            "id": 2300,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2301,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2302,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2303,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2304,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2305,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2306,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2307,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2308,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2309,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2310,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2311,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2312,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 25,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2313,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2314,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2315,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 46,
                            "z": 5
                        },
                        {
                            "id": 2316,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2317,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2318,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2319,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 39,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2320,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2321,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2322,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2323,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2324,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2325,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2326,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 53,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2327,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2328,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2329,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2330,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2331,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2332,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2333,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2334,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 69,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2335,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2336,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 73,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2337,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 75,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2338,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2339,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2340,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2341,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 46,
                            "z": 1
                        },
                        {
                            "id": 2342,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 46,
                            "z": 2
                        },
                        {
                            "id": 2343,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2344,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2345,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 91,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2346,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2347,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2348,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 46,
                            "z": 4
                        },
                        {
                            "id": 2349,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 46,
                            "z": 3
                        },
                        {
                            "id": 2350,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2351,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2352,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2353,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2354,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2355,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2356,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2357,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2358,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2359,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2360,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2361,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2362,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2363,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2364,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2365,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 47,
                            "z": 5
                        },
                        {
                            "id": 2366,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 47,
                            "z": 5
                        },
                        {
                            "id": 2367,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 34,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2368,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 36,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2369,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2370,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2371,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2372,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2373,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2374,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2375,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 50,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2376,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2377,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2378,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2379,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2380,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2381,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2382,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2383,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2384,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 68,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2385,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 70,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2386,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 72,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2387,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2388,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 47,
                            "z": 0
                        },
                        {
                            "id": 2389,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 47,
                            "z": 0
                        },
                        {
                            "id": 2390,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2391,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 47,
                            "z": 1
                        },
                        {
                            "id": 2392,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2393,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 47,
                            "z": 2
                        },
                        {
                            "id": 2394,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2395,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2396,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2397,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2398,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 47,
                            "z": 4
                        },
                        {
                            "id": 2399,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 47,
                            "z": 3
                        },
                        {
                            "id": 2400,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2401,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2402,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2403,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2404,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2405,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2406,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2407,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2408,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2409,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2410,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2411,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2412,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2413,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2414,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2415,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 48,
                            "z": 5
                        },
                        {
                            "id": 2416,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2417,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2418,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2419,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 39,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2420,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2421,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2422,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2423,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2424,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2425,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2426,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2427,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2428,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2429,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2430,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 61,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2431,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 63,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2432,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 65,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2433,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2434,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2435,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2436,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2437,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2438,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 48,
                            "z": 0
                        },
                        {
                            "id": 2439,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2440,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2441,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 48,
                            "z": 1
                        },
                        {
                            "id": 2442,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 48,
                            "z": 2
                        },
                        {
                            "id": 2443,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 87,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2444,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2445,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 91,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2446,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2447,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 95,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2448,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 48,
                            "z": 4
                        },
                        {
                            "id": 2449,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 48,
                            "z": 3
                        },
                        {
                            "id": 2450,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2451,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2452,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2453,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2454,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2455,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2456,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2457,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2458,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2459,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2460,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2461,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2462,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 24,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2463,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 26,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2464,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 28,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2465,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 30,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2466,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2467,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2468,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 36,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2469,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2470,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2471,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2472,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2473,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2474,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2475,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 50,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2476,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2477,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2478,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2479,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 58,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2480,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2481,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2482,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 64,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2483,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 66,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2484,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2485,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2486,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2487,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2488,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2489,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2490,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2491,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 49,
                            "z": 1
                        },
                        {
                            "id": 2492,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 49,
                            "z": 2
                        },
                        {
                            "id": 2493,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2494,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2495,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2496,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2497,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2498,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 49,
                            "z": 4
                        },
                        {
                            "id": 2499,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 49,
                            "z": 3
                        },
                        {
                            "id": 2500,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2501,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2502,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 5,
                            "y": 50,
                            "z": 4
                        },
                        {
                            "id": 2503,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 50,
                            "z": 4
                        },
                        {
                            "id": 2504,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2505,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2506,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2507,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2508,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2509,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2510,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2511,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2512,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2513,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2514,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 50,
                            "z": 4
                        },
                        {
                            "id": 2515,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 31,
                            "y": 50,
                            "z": 4
                        },
                        {
                            "id": 2516,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 50,
                            "z": 4
                        },
                        {
                            "id": 2517,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2518,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 37,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2519,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2520,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2521,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2522,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2523,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2524,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2525,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 51,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2526,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2527,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 55,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2528,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2529,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2530,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 61,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2531,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2532,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 65,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2533,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 67,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2534,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2535,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2536,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2537,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2538,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2539,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 50,
                            "z": 1
                        },
                        {
                            "id": 2540,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2541,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 83,
                            "y": 50,
                            "z": 2
                        },
                        {
                            "id": 2542,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2543,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2544,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 89,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2545,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2546,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2547,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 95,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2548,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 97,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2549,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 50,
                            "z": 3
                        },
                        {
                            "id": 2550,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2551,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2552,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2553,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2554,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2555,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2556,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2557,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2558,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2559,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2560,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 20,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2561,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2562,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2563,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2564,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2565,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2566,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2567,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 51,
                            "z": 4
                        },
                        {
                            "id": 2568,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2569,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 38,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2570,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 40,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2571,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2572,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2573,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 51,
                            "z": 0
                        },
                        {
                            "id": 2574,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 48,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2575,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 50,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2576,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2577,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 54,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2578,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 56,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2579,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2580,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2581,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 62,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2582,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 64,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2583,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 66,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2584,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2585,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2586,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2587,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2588,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 76,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2589,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 78,
                            "y": 51,
                            "z": 1
                        },
                        {
                            "id": 2590,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 80,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2591,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 51,
                            "z": 2
                        },
                        {
                            "id": 2592,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 84,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2593,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 86,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2594,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 88,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2595,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 90,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2596,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 92,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2597,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2598,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2599,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 51,
                            "z": 3
                        },
                        {
                            "id": 2600,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2601,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2602,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2603,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2604,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2605,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2606,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2607,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2608,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2609,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2610,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 21,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2611,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 23,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2612,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2613,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2614,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2615,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2616,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 33,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2617,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 35,
                            "y": 52,
                            "z": 4
                        },
                        {
                            "id": 2618,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 37,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2619,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2620,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 41,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2621,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 43,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2622,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 45,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2623,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 47,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2624,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2625,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 51,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2626,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 53,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2627,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2628,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 57,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2629,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2630,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2631,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2632,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2633,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2634,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2635,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2636,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2637,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2638,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 77,
                            "y": 52,
                            "z": 1
                        },
                        {
                            "id": 2639,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 79,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2640,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 81,
                            "y": 52,
                            "z": 2
                        },
                        {
                            "id": 2641,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2642,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 85,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2643,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 87,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2644,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2645,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 91,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2646,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 93,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2647,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2648,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2649,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 52,
                            "z": 3
                        },
                        {
                            "id": 2650,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2651,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2652,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 4,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2653,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 6,
                            "y": 53,
                            "z": 4
                        },
                        {
                            "id": 2654,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 8,
                            "y": 53,
                            "z": 4
                        },
                        {
                            "id": 2655,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2656,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2657,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2658,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2659,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 18,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2660,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 20,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2661,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 22,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2662,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2663,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2664,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2665,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 30,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2666,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 32,
                            "y": 53,
                            "z": 4
                        },
                        {
                            "id": 2667,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 34,
                            "y": 53,
                            "z": 4
                        },
                        {
                            "id": 2668,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 36,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2669,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 38,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2670,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 40,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2671,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 42,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2672,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 44,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2673,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 46,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2674,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 48,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2675,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 53,
                            "z": 1
                        },
                        {
                            "id": 2676,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 52,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2677,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 54,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2678,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 56,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2679,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2680,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 60,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2681,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 62,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2682,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 64,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2683,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 66,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2684,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 68,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2685,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2686,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2687,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2688,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2689,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 78,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2690,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 80,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2691,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 82,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2692,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 84,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2693,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 86,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2694,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2695,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2696,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2697,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 94,
                            "y": 53,
                            "z": 2
                        },
                        {
                            "id": 2698,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 96,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2699,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 53,
                            "z": 3
                        },
                        {
                            "id": 2700,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2701,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2702,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 54,
                            "z": 4
                        },
                        {
                            "id": 2703,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 7,
                            "y": 54,
                            "z": 4
                        },
                        {
                            "id": 2704,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 54,
                            "z": 4
                        },
                        {
                            "id": 2705,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2706,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2707,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2708,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2709,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 19,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2710,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2711,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2712,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2713,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2714,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2715,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2716,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 54,
                            "z": 4
                        },
                        {
                            "id": 2717,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 35,
                            "y": 54,
                            "z": 4
                        },
                        {
                            "id": 2718,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 37,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2719,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 39,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2720,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 41,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2721,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 43,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2722,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 45,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2723,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 47,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2724,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 49,
                            "y": 54,
                            "z": 1
                        },
                        {
                            "id": 2725,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2726,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2727,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 55,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2728,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 57,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2729,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 59,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2730,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 61,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2731,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 63,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2732,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2733,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2734,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2735,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2736,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2737,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 75,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2738,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2739,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2740,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 81,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2741,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 83,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2742,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2743,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2744,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 89,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2745,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2746,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 93,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2747,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 95,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2748,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 54,
                            "z": 2
                        },
                        {
                            "id": 2749,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 54,
                            "z": 3
                        },
                        {
                            "id": 2750,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2751,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2752,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2753,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 55,
                            "z": 4
                        },
                        {
                            "id": 2754,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 55,
                            "z": 4
                        },
                        {
                            "id": 2755,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2756,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2757,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2758,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 16,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2759,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 18,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2760,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2761,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2762,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2763,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2764,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2765,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2766,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 55,
                            "z": 4
                        },
                        {
                            "id": 2767,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 34,
                            "y": 55,
                            "z": 4
                        },
                        {
                            "id": 2768,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 36,
                            "y": 55,
                            "z": 4
                        },
                        {
                            "id": 2769,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 38,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2770,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 40,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2771,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 42,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2772,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 44,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2773,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 46,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2774,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 48,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2775,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 50,
                            "y": 55,
                            "z": 1
                        },
                        {
                            "id": 2776,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 52,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2777,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 54,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2778,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 56,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2779,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 58,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2780,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 60,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2781,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 62,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2782,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 64,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2783,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 66,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2784,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 68,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2785,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 70,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2786,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 72,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2787,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 74,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2788,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2789,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2790,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2791,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2792,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2793,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2794,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 88,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2795,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2796,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 92,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2797,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2798,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 55,
                            "z": 2
                        },
                        {
                            "id": 2799,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 55,
                            "z": 3
                        },
                        {
                            "id": 2800,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2801,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 3,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2802,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 5,
                            "y": 56,
                            "z": 4
                        },
                        {
                            "id": 2803,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 7,
                            "y": 56,
                            "z": 4
                        },
                        {
                            "id": 2804,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 9,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2805,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2806,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2807,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2808,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 17,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2809,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 19,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2810,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 21,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2811,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 23,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2812,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 25,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2813,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 27,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2814,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 29,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2815,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 31,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2816,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 33,
                            "y": 56,
                            "z": 4
                        },
                        {
                            "id": 2817,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 35,
                            "y": 56,
                            "z": 4
                        },
                        {
                            "id": 2818,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 56,
                            "z": 4
                        },
                        {
                            "id": 2819,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 39,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2820,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 41,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2821,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 43,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2822,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 45,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2823,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 47,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2824,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 49,
                            "y": 56,
                            "z": 1
                        },
                        {
                            "id": 2825,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 51,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2826,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 53,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2827,
                            "threshold": null,
                            "value": "S",
                            "walkable": true,
                            "x": 55,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2828,
                            "threshold": null,
                            "value": "W",
                            "walkable": false,
                            "x": 57,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2829,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 59,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2830,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 61,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2831,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 63,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2832,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2833,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 67,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2834,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 69,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2835,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 71,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2836,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 73,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2837,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 75,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2838,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 77,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2839,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2840,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2841,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2842,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2843,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2844,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2845,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2846,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2847,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2848,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 56,
                            "z": 2
                        },
                        {
                            "id": 2849,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 99,
                            "y": 56,
                            "z": 3
                        },
                        {
                            "id": 2850,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 0,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2851,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 2,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2852,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 4,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2853,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 6,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2854,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 8,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2855,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 10,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2856,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 12,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2857,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 14,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2858,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 16,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2859,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 18,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2860,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 20,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2861,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 22,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2862,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 24,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2863,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 26,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2864,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 28,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2865,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 30,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2866,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 32,
                            "y": 57,
                            "z": 4
                        },
                        {
                            "id": 2867,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 34,
                            "y": 57,
                            "z": 4
                        },
                        {
                            "id": 2868,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 36,
                            "y": 57,
                            "z": 4
                        },
                        {
                            "id": 2869,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 38,
                            "y": 57,
                            "z": 4
                        },
                        {
                            "id": 2870,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 40,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2871,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 42,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2872,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 44,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2873,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 46,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2874,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 48,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2875,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 50,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2876,
                            "threshold": null,
                            "value": "-",
                            "walkable": true,
                            "x": 52,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2877,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 54,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2878,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 56,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2879,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 58,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2880,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 60,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2881,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 62,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2882,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 64,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2883,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 66,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2884,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 68,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2885,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 70,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2886,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 72,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2887,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 74,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2888,
                            "threshold": null,
                            "value": "C",
                            "walkable": true,
                            "x": 76,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2889,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 78,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2890,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 80,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2891,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 82,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2892,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 84,
                            "y": 57,
                            "z": 4
                        },
                        {
                            "id": 2893,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 86,
                            "y": 57,
                            "z": 3
                        },
                        {
                            "id": 2894,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 88,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2895,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 90,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2896,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 92,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2897,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 94,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2898,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 96,
                            "y": 57,
                            "z": 1
                        },
                        {
                            "id": 2899,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 98,
                            "y": 57,
                            "z": 2
                        },
                        {
                            "id": 2900,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 1,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2901,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 3,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2902,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 5,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2903,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 7,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2904,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 9,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2905,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 11,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2906,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 13,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2907,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 15,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2908,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 17,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2909,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 19,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2910,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 21,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2911,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 23,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2912,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 25,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2913,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 27,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2914,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 29,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2915,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 31,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2916,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 33,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2917,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 35,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2918,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 37,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2919,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 39,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2920,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 41,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2921,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 43,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2922,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 45,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2923,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 47,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2924,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 49,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2925,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 51,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2926,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 53,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2927,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 55,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2928,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 57,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2929,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 59,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2930,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 61,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2931,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 63,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2932,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 65,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2933,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 67,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2934,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 69,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2935,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 71,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2936,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 73,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2937,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 75,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2938,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 77,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2939,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 79,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2940,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 81,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2941,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 83,
                            "y": 58,
                            "z": 4
                        },
                        {
                            "id": 2942,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 85,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2943,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 87,
                            "y": 58,
                            "z": 3
                        },
                        {
                            "id": 2944,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 89,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2945,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 91,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2946,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 93,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2947,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 95,
                            "y": 58,
                            "z": 1
                        },
                        {
                            "id": 2948,
                            "threshold": null,
                            "value": "T",
                            "walkable": false,
                            "x": 97,
                            "y": 58,
                            "z": 2
                        },
                        {
                            "id": 2949,
                            "threshold": null,
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
                    "primary": true
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




