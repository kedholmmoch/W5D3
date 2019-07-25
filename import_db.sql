DROP TABLE IF EXISTS cattoys;
DROP TABLE IF EXISTS cats;
DROP TABLE IF EXISTS toys;

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR (100) NOT NULL,
    color VARCHAR (100),
    breed VARCHAR (100)
);

CREATE TABLE toys (
    id SERIAL PRIMARY KEY,
    name VARCHAR (100) NOT NULL,
    color VARCHAR (100),
    price NUMERIC
);

CREATE TABLE cattoys (
    id SERIAL PRIMARY KEY,
    cat_id INTEGER,
    toy_id INTEGER,

    FOREIGN KEY (cat_id) REFERENCES cats(id) ON DELETE RESTRICT,
    FOREIGN KEY (toy_id) REFERENCES toys(id) ON DELETE RESTRICT
);

INSERT INTO
    cats (name, color, breed)
VALUES
    ('Whiskers', 'gray', 'ragdoll'),
    ('Scheherazade', 'gray mackerel', 'American shorthair'),
    ('Osiris', NULL, 'Sphynx'),
    ('Nala', 'calico', 'American shorthair'),
    ('Simba', 'spotted orange', 'Bengal');

INSERT INTO
    toys (name, color, price)
VALUES
    ('mouse', 'gray', 5.99),
    ('catnip', 'brown', 10.99),
    ('scratching post', 'blue', 15.49),
    ('laser pointer', 'red', 7.99),
    ('ball', 'green', 5.99);

INSERT INTO
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT id FROM cats WHERE name = 'Whiskers'), (SELECT id FROM toys WHERE name = 'mouse')),
    ((SELECT id FROM cats WHERE name = 'Scheherazade'), (SELECT id FROM toys WHERE name = 'catnip')),
    ((SELECT id FROM cats WHERE name = 'Osiris'), (SELECT id FROM toys WHERE name = 'scratching post')),
    ((SELECT id FROM cats WHERE name = 'Nala'), (SELECT id FROM toys WHERE name = 'laser pointer')),
    ((SELECT id FROM cats WHERE name = 'Simba'), (SELECT id FROM toys WHERE name = 'ball'));






