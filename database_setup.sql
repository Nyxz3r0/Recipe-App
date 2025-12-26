/*-----------------------------------------------TABLE CREATION----------------------------------------*/
/*-------------CREATE RECIPES TABLE----------*/
CREATE TABLE Recipes(
  REC_ID SERIAL,
  REC_NAME TEXT,
  REC_TYPE VARCHAR(50),
  REC_PREP INT,
  REC_COOK INT,
  REC_SERVINGS INT,
  REC_DIFFICULTY INT,
  REC_INSTRUCTIONS TEXT,
  REC_CREATED DATE,
PRIMARY KEY(REC_ID)
);
/*-------------CREATE INGREDIENT CATEGORY TABLE----------*/
CREATE TABLE Ingredient_Category(
  CAT_ID SERIAL,
  CAT_NAME VARCHAR(20),
PRIMARY KEY (CAT_ID)
);
/*-------------CREATE INGREDIENTS TABLE----------*/
CREATE TABLE Ingredients(
  ING_ID SERIAL,
  ING_NAME VARCHAR(20),
  ING_UNIT VARCHAR(20),
  ING_IS_PANTRY_STAPLE BOOLEAN,
  CAT_ID INT,
PRIMARY KEY (ING_ID),
FOREIGN KEY (CAT_ID) REFERENCES Ingredient_Category(CAT_ID)
);
/*-------------CREATE RECIPE INGREDIENTS TABLE----------*/
CREATE TABLE Recipe_Ingredients(
  RI_ID SERIAL,
  REC_ID INT,
  ING_ID INT,
  RI_QUANTITY FLOAT,
  RI_UNIT VARCHAR(20),
  RI_IS_KEY_INGREDIENT BOOLEAN,
PRIMARY KEY (RI_ID),
FOREIGN KEY (REC_ID) REFERENCES Recipes(REC_ID),
FOREIGN KEY (ING_ID) REFERENCES Ingredients(ING_ID)
);
/*-------------CREATE TAGS TABLE----------*/
CREATE TABLE Tags(
  TAG_ID SERIAL,
  TAG_NAME VARCHAR(20),
  TAG_TYPE VARCHAR(20),
PRIMARY KEY (TAG_ID)
);
/*-------------CREATE RECIPE TAGS TABLE----------*/
CREATE TABLE Recipe_Tags(
  REC_ID INT,
  TAG_ID INT,
FOREIGN KEY (REC_ID) REFERENCES Recipes(REC_ID),
FOREIGN KEY (TAG_ID) REFERENCES Tags(TAG_ID)
);
/*-------------------------------------------------------STARTER VALUES------------------------------------------------*/
/*----------INSERT INGREDIENT CATEGORIES-----------*/
INSERT INTO ingredient_category (cat_name) values
('Protein'),
('Vegetable'),
('Grain'),
('Dairy'),
('Fruit'),
('Condiment'),
('Spice'),
('Herb'),
('Oil'),
('Sauce'),
('Broth/Stock'),
('Pasta'),
('Noodle'),
('Cheese'),
('Legume'),
('Vinegar'),
('Asian Specialty'),
('Latin Specialty'),
('Baking Specialty');
/*--------------------INSERT TAGS------------------*/
INSERT INTO tags (tag_name,tag_type) values
--PROTEINS
('Chicken','Protein'),
('Ground Beef','Protein'),
('Steak','Protein'),
('Eggs','Protein'),
('Seafood','Protein'),
--COOKING METHODS
('One-Pot','Cooking Method'),
('Slow-Cooker','Cooking Method'),
('Oven-Baked','Cooking Method'),
('Stovetop','Cooking Method'),
('Air-Fryer','Cooking Method'),
('Microwave','Cooking Method'),
--TIME BASED
('Under 30 min','Time'),
('Under 1hr','Time'),
('Make-ahead','Time'),
--CUISINE
('Italian','Cuisine'),
('Mexican','Cuisine'),
('Asian','Cuisine'),
('American','Cuisine'),
--DISH
('Breakfast','Dish'),
('Lunch','Dish'),
('Dinner','Dish'),
('Dessert','Dish'),
('Snack','Dish'),
('Side','Dish');
