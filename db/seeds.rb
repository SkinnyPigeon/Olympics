require('pry-byebug')
require_relative('../models/athlete')
require_relative('../models/nation')

Athlete.delete_all()
Nation.delete_all()

scotland = Nation.new( "name" => "scotland" ).save
spain = Nation.new( "name" => "spain" ).save

jeff = Athlete.new( "name" => "jeff", "nation_id" => scotland.id ).save
steve = Athlete.new( "name" => "steve", "nation_id" => spain.id ).save

binding.pry
nil