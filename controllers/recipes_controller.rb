require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/recipe.rb')
require_relative('../models/ingredient.rb')
require_relative('../models/recipe-ingredient.rb')
require_relative('../models/search.rb')

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
  @recipe.save_ingredient_string_if_new(ingredients_string)
  redirect to '/recipes'

end

post '/recipes/:id/delete' do
  Recipe.delete(params[:id])
  redirect to '/recipes'
end

get '/recipes/:id/edit' do
@recipe = Recipe.show(params[:id])
erb(:update)
end

post '/recipes/:id/edit' do
  @recipe = Recipe.new(params)
  @recipe.update
  ingredients_string = params[:ingredients]
  @recipe.save_ingredient_string_if_new(ingredients_string)
  redirect to "/recipes/#{params[:id]}"
end

get '/search/' do 
  erb(:search)
end

post '/search/result' do
@results = Search.recipes_with(params[:term]) #results is a array of hashes containing found ingredient mapped to a recipe. results["ingredient"] returns the ingredient found and results["recipe"] returns the respective recipe. 
erb(:search_result)
end