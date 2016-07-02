require('pry-byebug')
require_relative('../models/athlete')
require_relative('../models/nation')

Athlete.delete_all()
Nation.delete_all()

@jeff = Athlete.new( "name" => "jeff" ).save
@steve = Athlete.new( "name" => "steve" ).save

@scotland = Nation.new( "name" => "scotland" ).save
@spain = Nation.new( "name" => "spain" ).save

binding.pry
nil