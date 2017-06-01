require('pry')
require_relative('../models/ingredient.rb')
require_relative('../models/recipe.rb')
require_relative('../models/recipe-ingredient.rb')

ListItem.delete_all
RecipeIngredient.delete_all
Ingredient.delete_all
Recipe.delete_all

recipe1 = Recipe.new( {'recipe_name' => "Stovies", 'method' => "1. Heat your oil in a large pan then add the onion, and cook it really well so that it gets nicely browned. It’s important you add lots of flavour to your onion so don’t be afraid to overcook it. 2. Add the sliced potato, the stock cube, the oxo cube and about 300ml of water. Give a good stir. Note: Traditional stovies are made using beef dripping. This isn’t something I normally have to hand, so I’ve had to add the meaty taste from elsewhere. I find Knorr Beef Stock Potsreally good for this (either the normal beef one or the rich beef – both are good), but a regular beef stock cube would also work. The oxo cube adds colour and extra flavour – I add beef oxo cubes to pretty much everything meaty, it’s kind of my secret ingredient (just not that secret). I love them and think they add a lovely rich flavour to any kind of meat dish (bolognese; stew; I even add them to chicken gravy!). They always feature in my cupboard supplies. 3. Put the lid of the pan on and let it simmer. Every so often give it a good stir. The potatoes will start to stick to the bottom, so with every stir, scrape the bottom of the pan. This is good, it all adds flavour. As you stir, the potatoes will begin to break up which is what you want. 4. Once the potatoes have softened and absorbed most of the stock, add your meat. Give it a good stir so everything is combined and check your seasoning. The corned beef can be quite salty, so it’s best to check the seasoning once it’s been added. Season as required. Serve with oatcakes, beetroot tomato and brown sauce." })
recipe1.save
ingredients_string = "about 10 medium potatoes peeled and sliced, 1 onion finely chopped, 2 tbsp oil, 1 beef stock cube / stock pot, 1 beef oxo cube, 1 tin of corned beef cubed, salt & pepper, oatcakes, beetroot, tomato or brown sauce"
recipe1.save_ingredient_string_if_new(ingredients_string)


recipe2 = Recipe.new( {'recipe_name' => "Black Bean Burritos", 'method' => "Wrap tortillas in foil and place in oven heated to 180 C / Gas 4. Bake for 15 minutes or until heated through. Heat oil in a large frying pan over medium heat. Place onion, red pepper, garlic and jalapenos in pan, cook for 2 minutes stirring occasionally. Pour beans into pan, cook 3 minutes stirring. Cut cream cheese into cubes and add to pan with salt. Cook for 2 minutes stirring occasionally. Stir coriander into mixture. Spoon mixture evenly down centre of warmed tortilla and roll tortillas up. Serve immediately." })
recipe2.save
ingredients_string = "2 flour tortillas, 2 tablespoons vegetable oil, 1 small onion chopped, 1/2 red pepper chopped, 1 teaspoon minced garlic, 1 (400g) tin black beans rinsed and drained, 1 teaspoon minced jalapenos, 85g cream cheese, 1/2 teaspoon salt, 2 tablespoons chopped fresh coriander"
recipe2.save_ingredient_string_if_new(ingredients_string)



recipe3 = Recipe.new( {'recipe_name' => "Thai Green Chicken Curry", 'method' => "Put the potatoes in a pan of boiling water and cook for 5 minutes. Throw in the beans and cook for a further 3 minutes, by which time both should be just tender but not too soft. Drain and put to one side. In a wok or large frying pan, heat the oil until very hot, then drop in the garlic and cook until golden, this should take only a few seconds. Don’t let it go very dark or it will spoil the taste. Spoon in the curry paste and stir it around for a few seconds to begin to cook the spices and release all the flavours. Next, pour in the coconut milk and let it come to a bubble. Stir in the fish sauce and sugar, then the pieces of chicken. Turn the heat down to a simmer and cook, covered, for about 8 minutes until the chicken is cooked. Tip in the potatoes and beans and let them warm through in the hot coconut milk, then add a lovely citrussy flavour by stirring in the shredded lime leaves (or lime zest). The basil leaves go in next, but only leave them briefly on the heat or they will quickly lose their brightness. Scatter with the lime garnish and serve immediately with boiled rice." })
recipe3.save
ingredients_string = "100g green beans trimmed and halved, 1 tbsp vegetable or sunflower oil, 1 garlic clove chopped, 225g new potatoes cut into chunks, 1 rounded tbsp or 4 tsp Thai green curry paste, 400ml can coconut milk, 2 tsp Thai fish sauce, 1 tsp caster sugar, 450g boneless skinless chicken (breasts or thighs) cut into bite-size pieces, 2 fresh kaffir lime leaves finely shredded or 3 wide strips lime zest plus extra to garnish, good handful of basil leaves, boiled rice to serve"
recipe3.save_ingredient_string_if_new(ingredients_string)



recipe4 = Recipe.new( {'recipe_name' => "Spaghetti Carbonara", 'method' => "Put a large saucepan of water on to boil. Finely chop the pancetta, having first removed any rind. Finely grate both cheeses and mix them together. Beat the eggs in a medium bowl, season with a little freshly grated black pepper and set everything aside. Add 1 tsp salt to the boiling water, add the spaghetti and when the water comes back to the boil, cook at a constant simmer, covered, for 10 minutes or until al dente (just cooked). Squash the garlic with the blade of a knife, just to bruise it. While the spaghetti is cooking, fry the pancetta with the garlic. Drop the butter into a large wide frying pan or wok and, as soon as the butter has melted, tip in the pancetta and garlic. Leave these to cook on a medium heat for about 5 minutes, stirring often, until the pancetta is golden and crisp. The garlic has now imparted its flavour, so take it out with a slotted spoon and discard. Keep the heat under the pancetta on low.When the pasta is ready lift it from the water with a pasta fork or tongs and put it in the frying pan with the pancetta (see left). Don’t worry if a little water drops in the pan as well (you want this to happen) and don’t throw the rest of the pasta water away yet. Mix most of the cheese in with the eggs, keeping a small handful back for sprinkling over later. Take the pan of spaghetti and pancetta off the heat. Now quickly pour in the eggs and cheese and, using the tongs or a long fork, lift up the spaghetti so it mixes easily with the egg mixture, which thickens but doesn’t scramble, and everything is coated. Add extra pasta cooking water to keep it saucy (several tablespoons should do it). You don’t want it wet, just moist. Season with a little salt, if needed. Use a long-pronged fork to twist the pasta on to the serving plate or bowl. Serve immediately with a little sprinkling of the remaining cheese and a grating of black pepper. If the dish does get a little dry before serving, splash in some more hot pasta water and the glossy sauciness will be revived." })
recipe4.save
ingredients_string = "100g pancetta, 50g pecorino cheese, 50g Parmesan, 3 large eggs, 350g spaghetti, 50g unsalted butter, Maldon salt and freshly grated black pepper, 2 plump garlic clove peeled and left whole"
recipe4.save_ingredient_string_if_new(ingredients_string)

recipe1.add_to_shopping_list

# binding.pry
nil

