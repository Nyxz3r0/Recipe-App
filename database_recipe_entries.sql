/*----------------COWBOY BUTTER STEAK RECIPE-------------*/
INSERT INTO recipes (rec_name,rec_type,rec_prep,rec_cook,rec_servings,rec_difficulty,rec_instructions,rec_created)
VALUES(
  'Cowboy Butter Steak and Potatoes',
  'American',
  20,
  20,
  2,
  2,
  $$Cowboy Butter:
  1/4 cup softened butter
  1/2 tbsp chives
  1/2 tbsp parsley
  1/2 tbsp Dijon mustard
  2 tsp minced garlic
  1 tsp lemon juice
  1/4 tsp cayenne
  1/4 tsp red pepper flakes
  1/4 tsp paprika
  Salt and pepper to taste
  1. Mix well in bowl.

  Steak Bites:
  1. Trim 1lb sirloin steak into 1 inch pieces.
  2. Season with Worchestershire sauce, salt, pepper, and minced garlic.
  3. Spray pan with olive oil and cook on medium-high heat until almost to desired rareness.
  4. Add cowboy butter and cook until at desired rareness.

  Mashed Potatoes:
  1. Peel and dice 2 large russet potatoes.
  2. Boil in salted water until tender.
  3. Strain water and mash.
  4. Stir 1/3 cup heavy cream, salt, and pepper.

  Garlic Bread:
  1. Slice baguette and brush with cowboy butter.
  2. Bake at 400 degrees until golden brown (8-10 min).$$,
CURRENT_DATE
);
-- RECIPE INGREDIENTS
INSERT INTO ingredients (ing_name,ing_unit,ing_is_pantry_staple,cat_id)
VALUES
('Butter','cup',TRUE,4),
('Chives','tbsp',FALSE,8),
('Parsley','tbsp',TRUE,8),
('Dijon Mustard','tbsp',FALSE,6),
('Garlic','tbsp',TRUE,7),
('Lemon Juice','tbsp',FALSE,5),
('Cayenne','tbsp',TRUE,7),
('Red Pepper Flakes','tbsp',TRUE,7),
('Paprika','tbsp',TRUE,7),
('Salt','tbsp',TRUE,7),
('Pepper','tbsp',TRUE,7),
('Steak','lb',FALSE,1),
('Worchestershire','tbsp',FALSE,6),
('Olive Oil','tbsp',TRUE,9),
('Baguette','loaf',FALSE,3),
('Potatoes','whole',FALSE,2),
('Heavy Cream','cup',FALSE,4);
-- RECIPE TAGS
INSERT INTO recipe_tags (rec_id,tag_id)
VALUES
(1,3),
(1,4),
(1,13),
(1,18),
(1,21);

/*----------------ITALIAN JOES ON TEXAS TOAST---------------*/
/*-----------INSERT RECIPE---------*/
INSERT INTO recipes (rec_name,rec_type,rec_prep,rec_cook,rec_servings,rec_difficulty,rec_instructions,rec_created)
VALUES(
  'Italian Joes on Texas Toast',
  'Italian',
  15,
  10,
  4,
  1,
  $$1. Preheat oven to 425 degrees.
2. In a large skillet, cook beef with green pepper, onion, and garlic over medium-high heat until meat is cooked (5-7 min).
3. Add beef broth, tomato paste, salt, and pepper. Reduce heat and mix until it thickens.
4. Place Texas toast on 15x10x1" pan and bake 8-10 min, or until browned.
5. Top toast with beef mixture and mozzarella cheese. Bake until cheese is melted (3-4 min)$$,
  CURRENT_DATE
);

/*----------INSERT NEW INGREDIENTS-----------*/
INSERT INTO ingredients (ing_name,ing_unit,ing_is_pantry_staple,cat_id)
VALUES
('Ground Beef','lb',FALSE,1),
('Green Bell Pepper','whole',FALSE,2),
('Onion','whole',FALSE,2),
('Beef Broth','cup',FALSE,11),
('Tomato Paste','tbsp',FALSE,10),
('Texas Toast','slice',FALSE,3),
('Mozzarella Cheese','cup',FALSE,14);

/*----------INSERT RECIPE INGREDIENTS-----------*/
-- Check the rec_id first with: SELECT rec_id FROM recipes WHERE rec_name = 'Italian Joes on Texas Toast';
INSERT INTO recipe_ingredients (rec_id,ing_id,ri_quantity,ri_unit,ri_is_key_ingredient)
VALUES
(2,18,1,'lb',TRUE),            -- Ground Beef (new ing_id 18)
(2,19,1,'whole',TRUE),         -- Green Bell Pepper (new ing_id 19)
(2,20,1,'whole',FALSE),        -- Onion (new ing_id 20)
(2,5,3,'cloves',FALSE),        -- Garlic (existing, ing_id 5)
(2,21,1,'cup',FALSE),          -- Beef Broth (new ing_id 21)
(2,22,2,'tbsp',FALSE),         -- Tomato Paste (new ing_id 22)
(2,10,1,'pinch',FALSE),        -- Salt (existing, ing_id 10)
(2,11,1,'pinch',FALSE),        -- Pepper (existing, ing_id 11)
(2,23,8,'slice',TRUE),         -- Texas Toast (new ing_id 23)
(2,24,1,'cup',TRUE);           -- Mozzarella Cheese (new ing_id 24)

/*-------------INSERT TAGS---------------*/
INSERT INTO recipe_tags (rec_id,tag_id)
VALUES
(2,2),   -- Ground Beef
(2,8),   -- Oven-Baked
(2,9),   -- Stovetop
(2,12),  -- Under 30 min
(2,15),  -- Italian
(2,21);  -- Dinner

