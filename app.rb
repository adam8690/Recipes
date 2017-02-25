require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./controllers/recipes.rb')
require_relative('./controllers/shopping_list.rb')


get '/' do 
  erb(:index)
end