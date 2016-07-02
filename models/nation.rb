class Nation

  attr_reader( :name, :id, :points )

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i
    @points = 0
  end

end