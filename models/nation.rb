require('pry-byebug')
require_relative('../db/sql_runner')

class Nation

  attr_reader( :name, :id, :points )

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i
    @points = 0
  end


  def save()
    sql = "INSERT INTO nations ( name ) VALUES ('#{@name}') RETURNING *"
    return Nation.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM nations"
    return Nation.map_items( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM nations"
    run_sql( sql )
  end

  def self.map_items( sql )
    nation = run_sql( sql )
    result = nation.map { |product| Nation.new( product ) }
    return result
  end

  def self.map_item( sql )
    result = Nation.map_items( sql )
    return result.first
  end

  def self.find( id )
    sql = "SELECT * FROM nations WHERE id = #{id}"
    return Nation.map_item( sql )
  end

end















