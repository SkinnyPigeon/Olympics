require('pry-byebug')
require_relative('../db/sql_runner')
require_relative('athlete')

class Event

  attr_reader( :name, :id, :athletes, :ranking )

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i
    @athletes = []
    @ranking = []
  end

  def save()
    sql = "INSERT INTO events ( name ) VALUES ('#{@name }') RETURNING *"
    return Event.map_item( sql )
  end

  def enter_athletes( athlete )
    @athletes << athlete
      sql = "INSERT INTO athletes_events ( event_id, athlete_id ) VALUES (#{@id}, #{athlete.id}) RETURNING *"
      return Event.map_item( sql )
  end

  def results
    sql = "SELECT athletes.* FROM athletes INNER JOIN athletes_events ON athletes_events.athlete_id = athletes.id WHERE athletes_events.event_id = #{@id}"
    results = run_sql( sql )
    @athletes = results.map { |result| Athlete.new( result ) }
    #create a loop for that
    @ranking + @athletes.shuffle
    position = @ranking.length

    @ranking.each do |athlete|  
      sql = "UPDATE athletes_events SET position_id = #{position} WHERE athlete_id = #{athlete.id} AND event_id = #{@id}"

      run_sql( sql )
      position -=1
    end
  end

  def self.all()
    sql = "SELECT * FROM events"
    return Event.map_items( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM events"
    run_sql( sql )
  end

  def self.map_items( sql )
    event = run_sql( sql )
    result = event.map { |product| Event.new( product ) }
    return result
  end

  def self.map_item( sql )
    result = Event.map_items( sql )
    return result.first
  end

  def self.find( id )
    sql = "SELECT * FROM events WHERE id = #{id}"
    return Event.map_item( sql )
  end

  def self.update( options )
    sql = "UPDATE events SET 
          name='#{ options[ 'name' ]}'
          WHERE id='#{ options[ 'id' ]}' 
          "
    run_sql( sql )
  end

end












