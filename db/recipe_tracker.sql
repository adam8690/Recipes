DROP TABLE recipe_ingredients;
DROP TABLE ingredients;
DROP TABLE recipes;

CREATE TABLE recipes(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
method VARCHAR(2550)
);


CREATE TABLE ingredients(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
unit VARCHAR(255)
);

CREATE TABLE recipe_ingredients(
id SERIAL4 PRIMARY KEY,
ingredient_id INT4 REFERENCES ingredients(id),
recipe_id INT4 REFERENCES recipes(id)
);