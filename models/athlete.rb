require('pry-byebug')
require_relative('../db/sql_runner')
require_relative('nation')

class Athlete

  attr_reader( :name, :id, :medals, :nation_id, :results )

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i
    @nation_id = options['nation_id'].to_i
    @results = []
    @medals = []
  end

  def save()
    sql = "INSERT INTO athletes ( name, nation_id ) VALUES ('#{ @name }', '#{ @nation_id }') RETURNING *"
    return Athlete.map_item( sql )
  end

  def nation()
    sql = "SELECT * FROM nations WHERE id = #{ @nation_id }"
    return Nation.map_item( sql )
  end

  def award_medals
    sql = "SELECT * FROM athletes_events WHERE athlete_id = '#{@id}'"
    result = run_sql( sql )
    @results << result
    position = @results.first.map { |medal| medal['position_id'] }
    @medals << position
    @medals.flatten!
  end

  def self.all()
    sql = "SELECT * FROM athletes"
    return Athlete.map_items( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM athletes"
    run_sql( sql )
  end

  def self.map_items( sql )
    athlete = run_sql( sql )
    result = athlete.map { |product| Athlete.new( product ) }
    return result
  end

  def self.map_item( sql )
    result = Athlete.map_items( sql )
    return result.first
  end

  def self.find( id )
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    return Athlete.map_item( sql )
  end

  def self.update( options )
    sql = "UPDATE athletes SET 
          name='#{ options[ 'name' ]}'
          WHERE id='#{ options[ 'id' ]}' 
          "
    run_sql( sql )
  end

end















