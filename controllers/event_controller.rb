require_relative('../models/athlete')
require_relative('../models/event')

#index
get '/event' do
  @events = Event.all
  erb(:'event/index')
end

#new
get '/event/new' do
  @athletes = Athlete.all
  erb(:'event/new')
end

#create
post '/event' do
  @event=Event.new( params )
  @event.save()
  erb( :'event/create' )
end

#show
get '/event/:id' do
  @event = Event.find( params[:id] )
  erb(:'event/show')
end

#edit
get '/event/:id/edit' do
  @event = Event.find( params[:id] )
  erb( :'event/edit')
end

#add athlete
get '/event/:id/add_athlete' do
  @athletes = Athlete.all
  @event = Event.find( params[:id] )
  erb( :'event/add_athlete')
end

#update
post '/event/:id' do
  @event = Event.update( params )
  redirect to( "/event/#{ params[:id] }")
end
