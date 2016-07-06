require_relative('../models/nation')
require('pry-byebug')

#index
get '/nation' do
  @nations = Nation.all
  erb(:'nation/index')
end

#new
get '/nation/new' do
  erb(:'nation/new')
end

#create
post '/nation' do
  @nation=Nation.new( params )
  @nation.save()
  erb( :'nation/create' )
end

#show
get '/nation/:id' do
  @nation = Nation.find( params[:id] )
  erb(:'nation/show')
end

#edit
get '/nation/:id/edit' do
  @nation = Nation.find( params[:id] )
  erb( :'nation/edit')
end

#update
post '/nation/:id' do
  @nation = Nation.update( params )
  redirect to( "/nation/#{ params[:id] }")
end

#search
# get '/nation/search' do
#   @nation = Nation.search( params )
#   binding.pry
#   nil
#   erb( :'nation/search')
# end








