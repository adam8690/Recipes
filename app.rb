require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./controllers/recipes_controller.rb')
require_relative('./controllers/shopping_list_controller.rb')


get '/' do 
  erb(:index)
end