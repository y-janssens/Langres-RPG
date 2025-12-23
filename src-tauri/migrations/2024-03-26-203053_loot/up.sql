-- Your SQL goes here
create table loot (
    id TEXT NOT NULL PRIMARY KEY,
    item_type TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    armor INTEGER,
    damage INTEGER,
    random INTEGER,
    parade INTEGER,
    price INTEGER,
    weight INTEGER
);