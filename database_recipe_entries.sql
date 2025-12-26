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


