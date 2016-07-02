require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../event')

class EventTest < MiniTest:: Test

  def setup
    @bum_fights = Event.new( "name" => "bum fights" )
  end

  def test_nation_has_name
    binding.pry
    nil
    assert_equal( "bum fights", @bum_fights.name )
  end


end