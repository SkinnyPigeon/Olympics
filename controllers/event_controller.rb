require_relative('../models/athlete')
require_relative('../models/event')
require('pry-byebug')

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
  @event.populate_with_athletes
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

#save athlete
post '/event/:id/add_athlete' do
  event = Event.find(params[:id])
  athlete = Athlete.find(params[:athlete_id])
  event.enter_athletes( athlete )
  redirect to("/event/#{ params[:id] }/add_athlete")
end

post '/event/:id/result' do
  event = Event.find(params[:id])
  event.results
  event.athletes.each { |athlete| athlete.award_medals}
  event.athletes.each { |athlete| athlete.convert_medals}
  redirect to("/leaderboard")
end

# get '/event/:id/table' do
#   @event = Event.find(params[:id])
#   @event.results
#   @results = @event.athletes
#   binding.pry
#   nil
#   @result = for result in @results
#     @results.first.name
#   end
#   erb(:"/event/table")
# end

#update
post '/event/:id' do
  @event = Event.update( params )
  redirect to( "/event/#{ params[:id] }")
end









