require('pry-byebug')
require_relative('../db/sql_runner')
require_relative('nation')

class Athlete

  attr_reader( :name, :id, :finishing_positions, :nation_id, :results, :gold, :silver, :bronze, :nation )

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i
    @nation_id = options['nation_id'].to_i
    @results = []
    @finishing_positions = []
    @gold = 0
    @silver = 0
    @bronze = 0
    @nation = nil
  end

  def save()
    sql = "INSERT INTO athletes ( name, nation_id ) VALUES ('#{ @name }', '#{ @nation_id }') RETURNING *"
    return Athlete.map_item( sql )
  end

  def nation()
    sql = "SELECT * FROM nations WHERE id = #{ @nation_id }"
    @nation = Nation.map_item( sql )
  end

  def award_medals
    sql = "SELECT * FROM athletes_events WHERE athlete_id = #{@id}"
    result = run_sql( sql )
    @results << result
    position = @results.first.map { |medal| medal['position_id'] }
    @finishing_positions << position
    @finishing_positions.flatten!
  end

  def convert_medals
    @finishing_positions.each do |finishing_position|
      case finishing_position
      when "1"
        @gold += 1
      when "2"
        @silver += 1
      when "3"
        @bronze += 1
      end
      sql = "UPDATE athletes SET 
      gold='#{@gold}', 
      silver = '#{@silver}', 
      bronze = '#{@bronze}'
      WHERE id='#{@id}' 
      "
      run_sql( sql )
    end
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















