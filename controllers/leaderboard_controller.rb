require_relative('../models/nation')
require_relative('../models/leaderboard')

#index
get '/leaderboard' do
  nations = Nation.all
  @board=LeaderBoard.new( nations )
  erb(:'leaderboard/index')
end