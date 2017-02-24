require('pry')
require_relative('../models/ingredient.rb')
require_relative('../models/recipe.rb')

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

binding.pry
nil