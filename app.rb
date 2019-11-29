require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/members_controller.rb')

also_reload( '../models/*' )

get '/' do
  erb( :index )
end
