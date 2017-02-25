require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/list_item.rb')

get '/shopping_list' do 
  @list = ListItem.show_all
  erb(:shopping_list)
end