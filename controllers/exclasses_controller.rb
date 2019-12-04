require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'date')

require_relative( '../models/exclass.rb' )
require_relative( '../models/attendee.rb' )
require_relative( '../models/dropdowns/classtype.rb' )
require_relative( '../models/dropdowns/duration.rb' )
require_relative( '../models/dropdowns/instructor.rb' )


#show_all
get '/exclasses' do
  @instructors = Instructor.all()
  @durations = Duration.all()
  @classtypes = ClassType.all()
  @atteedees = Attendee.all()
  @exclasses = Exclass.all_current()
  erb( :"exclasses/index" )
end
#save exclass to database
post '/exclasses' do
  new_exclass = Exclass.new(params)
  new_exclass.save
  redirect to("/exclasses")
end
#show details and send through member info
get '/exclasses/:id' do
  @members = Member.all()
  @exclass = Exclass.find_by_id(params[:id])
  @attendees = Attendee.find_by_exclass_id(params[:id])
  erb( :"exclasses/show")
end

#delete instance from database
post '/exclasses/:id/delete' do
@exclass = Exclass.find_by_id(params[:id])
@exclass.delete
redirect to("exclasses")
end

#edit the class
get '/exclasses/:id/edit' do
  @instructors = Instructor.all()
  @durations = Duration.all()
  @classtypes = ClassType.all()
  @exclass = Exclass.find_by_id(params[:id])
  erb( :"exclasses/edit")
end

post '/exclasses/:id' do
  result = Exclass.new(params)
  result.update()
  redirect to '/exclasses'
end
