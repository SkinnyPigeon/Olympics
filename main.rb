require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/nation_controller')


get '/' do
  erb :home
end
