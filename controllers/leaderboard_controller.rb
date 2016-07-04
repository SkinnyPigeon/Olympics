require_relative('../models/nation')
require_relative('../models/leaderboard')

#index
get '/leaderboard' do
  nations = Nation.all
  @board=LeaderBoard.new( nations )
  @leaders = @board.show_scores
  @scores = @leaders.map{|leader| leader.keys[0]}
  @teams = @leaders.map{|leader| leader.values[0]}
  erb(:'leaderboard/index')
end