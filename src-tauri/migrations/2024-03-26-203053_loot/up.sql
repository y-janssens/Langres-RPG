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
    ('item_long_sword', '"Weapon"', 
    json('{"fr": "Épée longue", "en": "Long sword"}'),
    json('{"fr": "Une simple épée longue", "en": "A simple long sword"}'),
    null, 14, 14, 6, 14, 4),

    ('item_sword', '"Weapon"', 
    json('{"fr": "Épée courte", "en": "Short sword"}'),
    json('{"fr": "Une simple épée courte", "en": "A simple short sword"}'),
    null, 12, 12, 4, 12, 3),

    ('item_dagger', '"Weapon"', 
    json('{"fr": "Dague", "en": "Dagger"}'),
    json('{"fr": "Une simple dague courte", "en": "A simple short dagger"}'),
    null, 10, 8, 3, 8, 1),

    ('item_shield', '"Weapon"', 
    json('{"fr": "Bouclier", "en": "Shield"}'),
    json('{"fr": "Un bouclier d''acier", "en": "A steel shield"}'),
    14, 2, 14, null, 16, 5),

    ('item_helmet', '"Equipment"', 
    json('{"fr": "Heaume", "en": "Helmet"}'),
    json('{"fr": "Un heaume d''acier", "en": "A steel helmet"}'),
    10, null, 10, null, 12, 2),

    ('item_armor', '"Equipment"', 
    json('{"fr": "Plastron", "en": "Armor"}'),
    json('{"fr": "Une armure d''acier", "en": "A steel armor"}'),
    10, null, 10, null, 12, 2),
    
    ('item_leggings', '"Equipment"', 
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