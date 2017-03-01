require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/list_item.rb')

get '/shopping_list' do 
  @list = ListItem.show_all
  ListItem.show_all
  erb(:shopping_list)
end

post '/shopping_list/delete_all' do 
  ListItem.delete_all
  redirect to '/shopping_list'
end

post '/shopping_list/:id/delete/' do
  ListItem.delete(params[:id])
  redirect to '/shopping_list'
end


post '/shopping_list/:id' do
  @recipe = Recipe.show(params[:id])
  @recipe.add_to_shopping_list
  redirect to "/recipes/#{params[:id]}"
end


