require('pry-byebug')
require_relative('../db/sql_runner')
require_relative('athlete')

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

  def total_points

    sql = "SELECT SUM(gold) FROM athletes WHERE nation_id = '#{@id}'"
    result = run_sql( sql )
    @points += ( result.first['sum'].to_i * 5 )

    sql = "SELECT SUM(silver) FROM athletes WHERE nation_id = '#{@id}'"
    result = run_sql( sql )
    @points += ( result.first['sum'].to_i * 3 )

    sql = "SELECT SUM(bronze) FROM athletes WHERE nation_id = '#{@id}'"
    result = run_sql( sql )
    @points += ( result.first['sum'].to_i * 1 )

  end


  def athletes()
    sql = "SELECT * FROM athletes WHERE nation_id = #{ @id }"
    return Athlete.map_items( sql )
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

  def self.update( options )
    sql = "UPDATE nations SET 
          name='#{ options[ 'name' ]}'
          WHERE id='#{ options[ 'id' ]}' 
          "
    run_sql( sql )
  end

end















