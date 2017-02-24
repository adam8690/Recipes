require_relative('../models/ingredient.rb')

Ingredient.delete_all

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