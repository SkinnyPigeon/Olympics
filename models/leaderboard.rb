require_relative('nation')
require('pry-byebug')

class LeaderBoard

  attr_reader( :nations )

  def initialize( nations )
    @nations = nations
  end

  def build
    result = @nations.map { |nation| {nation.total_points => nation.name} }
    sorted = result.sort_by {|points| points.keys[0]}
    return sorted.reverse
  end

  # my_hash = {'a'=>'1', 'c'=>'3', 'b'=>'2'}
  # my_hash.keys.sort.each { |key| puts my_hash[key] }


end

