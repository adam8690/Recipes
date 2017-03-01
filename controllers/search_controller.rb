require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/search.rb')

get '/search/' do 
  erb(:search)
end

post '/search/result' do
@results = Search.recipes_with(params[:term]) #results is a array of hashes containing found ingredient mapped to a recipe. results["ingredient"] returns the ingredient found and results["recipe"] returns the respective recipe. 
erb(:search_result)
end