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
  @ingredients_array = ingredients_string.split(",")

  for ingredient in @ingredients_array
    new_ingredient = Ingredient.new({
      'name' => ingredient.strip,
      'unit' => ''
      })
    # Ingredient.show returns the ingredient object if the name passed in exists in the database. if new_ingredient.name exists in the database the returned object will be equal to new_ingredient. If this is not the case the new ingredient will be saved else recipe_ingredient will be saved with the new relationship between recipe and ingredient added to the db. 
    found_ingredient = Ingredient.show(new_ingredient.name).first

    if found_ingredient == nil
      new_ingredient.save
    else 
      new_ingredient.id = found_ingredient.id
    end
    
      recipe_ingredient = RecipeIngredient.new({
        'ingredient_id' => new_ingredient.id,
        'recipe_id' => @recipe.id
        })
      recipe_ingredient.save
    
  end
  
  redirect to '/recipes'

end

post '/recipes/:id/delete' do
  Recipe.delete(params[:id])
  redirect to '/recipes'
end