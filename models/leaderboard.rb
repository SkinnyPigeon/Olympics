require_relative('nation')
require('pry-byebug')

class LeaderBoard

  attr_reader( :nations )

  def initialize( nations )
    @nations = nations
    @sorted = []
  end

  def build
    result = @nations.map { |nation| {nation.total_points => nation.name} }
    @sorted = result.sort_by {|points| points.keys[0]}
    return @sorted.reverse!
  end

  def show_scores
    build
    puts
    for team in @sorted
      print "#{team.values.join(" ").capitalize} has #{team.keys.join(" ")} points"
      puts
    end
  end


end

