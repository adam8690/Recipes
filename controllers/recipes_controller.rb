require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/recipe.rb')
require_relative('../models/ingredient.rb')

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
  p @ingredients = params[:ingredients]
  redirect to '/recipes'
end

