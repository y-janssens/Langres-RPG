-- Your SQL goes here
CREATE TABLE quests (
    id TEXT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    "primary" BOOLEAN NOT NULL,
    status TEXT NOT NULL,
    visible BOOLEAN NOT NULL,
    reward INTEGER NOT NULL,
    next TEXT
);

INSERT INTO
    quests(id, name, description, "primary", status, visible, reward, next)
VALUES
    (
        'main_quest_0001', 
        json('{
            "fr": "Il faut battre le frère quand il est faux",
            "en": "Strike the brother while he''s deceitful"
        }'),
        json('{
        "fr": "Tuez Ser Herbert",
        "en": "Kill Sir Herbert"
        }'),
        1,
        json('{
            "owned": true,
            "completed": false,
            "failed": false,
            "abandoned": false
        }'),
        1,
        0,
        'main_quest_0002'
    ),
    (
        'main_quest_0002', 
        json('{
            "fr": "Renégats",
            "en": "Renegades"
        }'),
        json('{
        "fr": "Tuez Ser Herbert",
        "en": "Kill Sir Herbert"
        }'),
        1,
        json('{
            "owned": true,
            "completed": false,
            "failed": false,
            "abandoned": false
        }'),
        1,
        150,
        null
    );