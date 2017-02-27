require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/recipe.rb')
require_relative('../models/ingredient.rb')
require_relative('../models/recipe-ingredient.rb')

get '/recipes' do 
  @recipes = Recipe.find_all
  erb(:recipes)
end

get '/recipes/new' do 
  erb(:new)
end

get '/recipes/:id' do 
  @recipe = Recipe.show(params[:id])
  erb(:recipe)
end

post '/recipes' do 
  @recipe = Recipe.new( {'recipe_name' => params[:recipe_name], 'method' => params[:method]} )
  @recipe.save
  ingredients_string = params[:ingredients]
  p @ingredients_array = ingredients_string.split(",")

  for ingredient in @ingredients_array
    new_ingredient = Ingredient.new({
      'name' => ingredient.strip ,
      'unit' => ''
      })
    new_ingredient.save
    
    recipe_ingredient = RecipeIngredient.new({
      'ingredient_id' => new_ingredient.id,
      'recipe_id' => @recipe.id
      })
    recipe_ingredient.save
  end
  
  redirect to '/recipes'

end