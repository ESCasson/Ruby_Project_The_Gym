require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/exclass.rb' )

also_reload( '../models/*' )

#show_all
get '/exclasses' do
  @exclasses = Exclass.all()
  erb( :"exclasses/index" )
end

post '/exclasses' do
  new_exclass = Exclass.new(params)
  new_exclass.save
  redirect to("/exclasses")
end
