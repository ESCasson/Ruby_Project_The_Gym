require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require( 'date')

require_relative( '../models/exclass.rb' )
require_relative( '../models/Nov_Dec.rb' )

get '/calendar' do
  @exclasses = Exclass.all()
  @dates = Nov_Dec.all()
  erb(:"calendar/index")
end
