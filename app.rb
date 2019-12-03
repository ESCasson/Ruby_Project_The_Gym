require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'date' )
require_relative('controllers/members_controller.rb')
require_relative('controllers/exclasses_controller.rb')
require_relative('controllers/attendees_controller.rb')

also_reload( '/models/*' )

get '/' do
  erb( :index )
end
