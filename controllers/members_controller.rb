require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative( '../models/member.rb' )


#show_all
get '/members' do
  @members = Member.all()
  erb( :"members/index" )
end

#save to database
post '/members' do
  new_member = Member.new(params)
  new_member.save
  redirect to("/members")
end

#edit i.e. gets the form for editing
get '/members/:id/edit' do
  @member = Member.find_by_id(params[:id])
  erb( :"members/edit" )
end

#UPDATE
post '/members/:id' do
  result = Member.new(params)
  result.update()
  redirect to '/members'
end

#delete

post '/members/:id/delete' do
@member = Member.find_by_id(params[:id])
@member.delete
redirect to("/members")
end
