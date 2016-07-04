require_relative('nation')
require('pry-byebug')

class LeaderBoard

  attr_reader( :nations, :name, :score )

  def initialize( nations )
    @nations = nations
    @sorted = []
    @name = nil
    @score = nil
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
      @name = team.values.join(" ").capitalize
      @score = team.keys.join(" ")
      # binding.pry
      print "#{team.values.join(" ").capitalize} has #{team.keys.join(" ")} points"
      puts
    end
  end


end

