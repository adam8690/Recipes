require('pry')
require_relative('../models/ingredient.rb')
require_relative('../models/recipe.rb')
require_relative('../models/recipe-ingredient.rb')

ListItem.delete_all
RecipeIngredient.delete_all
Ingredient.delete_all
Recipe.delete_all

ingredient1 = Ingredient.new({
  'name' => 'bread',
  'unit' => 'slice'
    })

ingredient1.save

ingredient2 = Ingredient.new({
  'name' => 'butter',
  'unit' => 'g'
  })

ingredient2.save

recipe1 = Recipe.new({
  'recipe_name' => 'toast',
  'method' => 'Put bread in toaster and wait until golden brown. spread butter onto toasted bread. Serve on a plate.'
  })

recipe1.save

recipe1ingredient1 = RecipeIngredient.new({
  'ingredient_id' => ingredient1.id, 
  'recipe_id' => recipe1.id
})

recipe1ingredient1.save

recipe1ingredient2 = RecipeIngredient.new({
  'ingredient_id' => ingredient2.id, 
  'recipe_id' => recipe1.id
})

recipe1ingredient2.save

recipe1.add_to_shopping_list

binding.pry
nil