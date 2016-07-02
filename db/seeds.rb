require('pry-byebug')
require_relative('../models/athlete')
require_relative('../models/nation')
require_relative('../models/event')

Event.delete_all()
Athlete.delete_all()
Nation.delete_all()

scotland = Nation.new( "name" => "scotland" ).save
spain = Nation.new( "name" => "spain" ).save

jeff = Athlete.new( "name" => "jeff", "nation_id" => scotland.id ).save
steve = Athlete.new( "name" => "steve", "nation_id" => spain.id ).save
bob = Athlete.new( "name" => "bob", "nation_id" => spain.id ).save
john = Athlete.new( "name" => "john", "nation_id" => scotland.id ).save


bum_fights = Event.new( "name" => "bum fights").save

bum_fights.enter_athletes(jeff)
# bum_fights.enter_athletes(steve)
# bum_fights.enter_athletes(bob)
# bum_fights.enter_athletes(john)

bum_fights.results

binding.pry
nil