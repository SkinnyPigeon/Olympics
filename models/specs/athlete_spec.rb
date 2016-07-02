require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../athlete')

class AthleteTest < MiniTest:: Test

  def setup
    @jeff = Athlete.new( "name" => "jeff" )
  end

  def test_athlete_has_name
    binding.pry
    nil
    assert_equal( "jeff", @jeff.name )
  end


end