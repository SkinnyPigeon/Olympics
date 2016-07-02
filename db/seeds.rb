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
cross_country_wrestling = Event.new( "name" => "cross country wrestling").save

bum_fights.enter_athletes(jeff)
bum_fights.enter_athletes(steve)
bum_fights.enter_athletes(bob)
bum_fights.enter_athletes(john)

cross_country_wrestling.enter_athletes(jeff)
cross_country_wrestling.enter_athletes(steve)
cross_country_wrestling.enter_athletes(bob)
cross_country_wrestling.enter_athletes(john)

bum_fights.results
cross_country_wrestling.results

jeff.award_medals
steve.award_medals
bob.award_medals
john.award_medals

jeff.convert_medals
steve.convert_medals
bob.convert_medals
john.convert_medals



binding.pry
nil