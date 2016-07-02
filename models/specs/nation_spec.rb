require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../nation')

class NationTest < MiniTest:: Test

  def setup
    @scotland = Nation.new( "name" => "scotland" )
  end

  def test_nation_has_name
    binding.pry
    nil
    assert_equal( "scotland", @scotland.name )
  end


end