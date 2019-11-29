require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/member.rb' )

also_reload( '../models/*' )

get '/members' do
  @members = Member.all()
  erb( :"members/index" )
end

post '/members' do
  new_member = Member.new(params)
  new_member.save
  redirect to("/members")
end
