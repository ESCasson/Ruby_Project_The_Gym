require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( '../models/exclass.rb' )


#show_all
get '/exclasses' do
  @exclasses = Exclass.all_current()
  erb( :"exclasses/index" )
end
#save exclass to database
post '/exclasses' do
  new_exclass = Exclass.new(params)
  new_exclass.save
  redirect to("/exclasses")
end

#delete instance from database
post '/exclasses/:id/delete' do
@exclass = Exclass.find_by_id(params[:id])
@exclass.delete
redirect to("exclasses")
end

#edit the class
get '/exclasses/:id/edit' do
  @exclass = Exclass.find_by_id(params[:id])
  erb( :"exclasses/edit")
end

post '/exclasses/:id' do
  result = Exclass.new(params)
  result.update()
  redirect to '/exclasses'
end