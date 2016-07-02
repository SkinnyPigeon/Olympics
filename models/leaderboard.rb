require_relative('nation')
require('pry-byebug')

class LeaderBoard

  attr_reader( :nations )

  def initialize( nations )
    @nations = nations
  end

  def build
    result = @nations.map { |nation| {nation.total_points => nation.name} }
    sorted = result.sort_by {|nation| nation[:total_points]}
    return sorted.reverse
  end




end

