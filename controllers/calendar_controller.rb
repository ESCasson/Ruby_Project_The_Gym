require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require( 'date')

require_relative( '../models/exclass.rb' )
require_relative( '../models/attendee.rb' )
require_relative( '../models/classtype.rb' )
require_relative( '../models/duration.rb' )
require_relative( '../models/instructor.rb' )
require_relative( '../models/calendar.rb' )
require_relative( '../models/Nov_Dec.rb' )

get '/calendar' do
  @dates = Nov_Dec.all()
  erb(:"calendar/index")
end
