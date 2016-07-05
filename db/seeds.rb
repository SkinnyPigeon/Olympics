require('pry-byebug')
require_relative('../models/athlete')
require_relative('../models/nation')
require_relative('../models/event')
require_relative('../models/leaderboard')

Event.delete_all()
Athlete.delete_all()
Nation.delete_all()

scotland = Nation.new( "name" => "Scotland" ).save
spain = Nation.new( "name" => "Spain" ).save
bolivia = Nation.new( "name" => "Bolivia" ).save
columbia = Nation.new( "name" => "Columbia" ).save
mongolia = Nation.new( "name" => "Mongolia" ).save
nations = Nation.all

jeff = Athlete.new( "name" => "Jeff", "nation_id" => scotland.id ).save
steve = Athlete.new( "name" => "Steve", "nation_id" => spain.id ).save
bob = Athlete.new( "name" => "Bob", "nation_id" => spain.id ).save
john = Athlete.new( "name" => "John", "nation_id" => bolivia.id ).save
jeffy = Athlete.new( "name" => "Jeffy", "nation_id" => columbia.id ).save
gengis = Athlete.new( "name" => "Gengis", "nation_id" => mongolia.id ).save
kahn = Athlete.new( "name" => "Kahn", "nation_id" => mongolia.id ).save

bum_fights = Event.new( "name" => "Bum Fights").save
knifing = Event.new( "name" => "Knifing").save
sticks = Event.new( "name" => "Stick vs Stick").save
guns = Event.new( "name" => "Gun Smuggling").save
fish = Event.new( "name" => "Fish Getting").save
dodge = Event.new( "name" => "Machine Gun Dodging").save
cross_country_wrestling = Event.new( "name" => "Cross Country Wrestling").save

# board = LeaderBoard.new( nations )

bum_fights.enter_athletes(jeff)
bum_fights.enter_athletes(steve)
bum_fights.enter_athletes(bob)
bum_fights.enter_athletes(john)


bum_fights.enter_athletes(gengis)
bum_fights.enter_athletes(kahn)
bum_fights.enter_athletes(jeffy)
bum_fights.enter_athletes(john)

guns.enter_athletes(jeffy)
guns.enter_athletes(kahn)
guns.enter_athletes(bob)
guns.enter_athletes(jeff)


cross_country_wrestling.enter_athletes(jeff)
cross_country_wrestling.enter_athletes(steve)
cross_country_wrestling.enter_athletes(bob)
cross_country_wrestling.enter_athletes(john)

# bum_fights.results
# cross_country_wrestling.results

# jeff.convert_medals
# steve.convert_medals
# bob.convert_medals
# john.convert_medals

# board.show_scores

binding.pry
nil