require_relative('../models/athlete')
require_relative('../models/nation')

#index
get '/athlete' do
  @athletes = Athlete.all
  erb(:'athlete/index')
end

#new
get '/athlete/new' do
  @nations = Nation.all
  erb(:'athlete/new')
end

#create
post '/athlete' do
  @athlete=Athlete.new( params )
  @athlete.save()
  erb( :'athlete/create' )
end

#show
get '/athlete/:id' do
  @athlete = Athlete.find( params[:id] )
  erb(:'athlete/show')
end

#edit
get '/athlete/:id/edit' do
  @athlete = Athlete.find( params[:id] )
  erb( :'athlete/edit')
end

#update
post '/athlete/:id' do
  @athlete = Athlete.update( params )
  redirect to( "/athlete/#{ params[:id] }")
end
