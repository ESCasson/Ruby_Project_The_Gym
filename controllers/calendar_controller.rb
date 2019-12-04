require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require( 'date')

require_relative( '../models/exclass.rb' )
require_relative( '../models/calendar.rb' )

get '/calendar' do
  @exclasses = Exclass.all()
  @dates = Calendar.all()
  erb(:"calendar/index")
end
