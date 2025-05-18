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

INSERT INTO
    loot(id, item_type, name, description, armor, damage, random, parade, price, weight)
VALUES
    ('6a3e9e4d-8f21-4c9b-b84c-a9f1e2d3b4c5', '"Weapon"', 
    json('{"fr": "Épée longue", "en": "Long sword"}'),
    json('{"fr": "Une simple épée longue", "en": "A simple long sword"}'),
    null, 14, 14, 6, 14, 4),

    ('13ff7466-ca20-458d-9585-5d470569da80', '"Weapon"', 
    json('{"fr": "Épée courte", "en": "Short sword"}'),
    json('{"fr": "Une simple épée courte", "en": "A simple short sword"}'),
    null, 12, 12, 4, 12, 3),

    ('35c84aae-5291-4d17-b080-e66fcf4d9951', '"Weapon"', 
    json('{"fr": "Dague", "en": "Dagger"}'),
    json('{"fr": "Une simple dague courte", "en": "A simple short dagger"}'),
    null, 10, 8, 3, 8, 1),

    ('18b5f4a0-7d62-4e31-9c8b-5f4e3d2c1b0a', '"Weapon"', 
    json('{"fr": "Bouclier", "en": "Shield"}'),
    json('{"fr": "Un bouclier d''acier", "en": "A steel shield"}'),
    14, 2, 14, null, 16, 5),

    ('f7c8b9a0-1d2e-43f5-a6b7-c8d9e0f1a2b3', '"Equipment"', 
    json('{"fr": "Heaume", "en": "Helmet"}'),
    json('{"fr": "Un heaume d''acier", "en": "A steel helmet"}'),
    10, null, 10, null, 12, 2),

    ('2e3d4c5b-6a7f-48e9-bd0c-1a2b3c4d5e6f', '"Equipment"', 
    json('{"fr": "Plastron", "en": "Armor"}'),
    json('{"fr": "Une armure d''acier", "en": "A steel armor"}'),
    10, null, 10, null, 12, 2),
    
    ('c1d2e3f4-a5b6-47c8-9d0e-1f2a3b4c5d6e', '"Equipment"', 
    json('{"fr": "Jambières", "en": "Leggings"}'),
    json('{"fr": "Des jambières de plates", "en": "Steel plated leggings"}'),
    10, null, 10, null, 12, 2),

    ('obj_water_vial', '"Consumable"', 
    json('{"fr": "Fiole d''eau de mer", "en": "Sea water vial"}'),
    json('{"fr": "Une offrande à la Déesse", "en": "An offering to the Goddess"}'),
    null, 5, 2, null, null, 1),

    ('obj_dirt', '"Consumable"', 
    json('{"fr": "Poussière", "en": "Dirt"}'),
    json('{"fr": "Une poignée de poussière", "en": "A fistful of dirt"}'),
    null, null, null, null, null, 1),

    ('obj_bandage', '"Consumable"', 
    json('{"fr": "Bandage", "en": "Bandage"}'),
    json('{"fr": "Un bandage de combat", "en": "A combat bandage"}'),
    10, null, 10, null, 12, 2),

    ('obj_torch', '"Consumable"', 
    json('{"fr": "Torche", "en": "Torch"}'),
    json('{"fr": "Une torche", "en": "A torch"}'),
    10, null, 10, null, 12, 2);