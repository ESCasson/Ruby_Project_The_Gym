require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/attendee.rb' )


post '/attendees' do
  new_attendee = Attendee.new(params)
  new_attendee.save()
  redirect to '/exclasses/' + new_attendee.exclass_id
end

post '/exclasses/attendees/:id/delete' do
  @attendee = Attendee.find_by_id(params[:id])
  @attendee.delete
  redirect to '/exclasses/' + @attendee.exclass_id
end
