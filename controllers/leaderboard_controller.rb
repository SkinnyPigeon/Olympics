require_relative('../models/nation')
require_relative('../models/leaderboard')

#index
get '/leaderboard' do
  nations = Nation.all
  @board=LeaderBoard.new( nations )
  @leaders = @board.show_scores
  erb(:'leaderboard/index')
end